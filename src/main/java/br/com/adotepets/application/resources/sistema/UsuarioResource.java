package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/usuario")
@Api
@CrossOrigin
public class UsuarioResource extends AbstractResource<Usuario> {

    private FileRepository fileRepository = new FileRepository();

    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * @param usuarioRepository
     */
    public UsuarioResource(UsuarioRepository usuarioRepository) {
        super(usuarioRepository);
        this.usuarioRepository = usuarioRepository;
    }

    /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @Transactional
    @PostMapping(value = "/upload")
    @ResponseStatus(HttpStatus.CREATED)
    @CrossOrigin
    public Usuario createAndUpload(@RequestParam @Valid String value, @RequestParam("file") MultipartFile uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            var usuarioMapped = objectMapper.readValue(value, Usuario.class);

            usuarioMapped.setSenha(passwordEncoder.encode(usuarioMapped.getSenha()));

            final Usuario usuario = this.repository.save(usuarioMapped);

            this.fileRepository.handleFileUpload(usuario.getId(), uploadedFile.getBytes(), this.repository);

            Optional<Usuario> user = this.repository.findById(usuario.getId());

            return user.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

        /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @Transactional
    @PostMapping(value = "/edit")
    @ResponseStatus(HttpStatus.CREATED)
    @CrossOrigin
    public Usuario edit(@RequestParam @Valid String value, @RequestParam(value="file", required = false) MultipartFile uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            objectMapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
            var usuarioMapped = objectMapper.readValue(value, Usuario.class);

            //Nome, Email, celular, telefone

            final Usuario usuario = this.usuarioRepository.getOne(usuarioMapped.getId());

            usuario.setNome(!usuarioMapped.getNome().isEmpty() ? usuarioMapped.getNome() : usuario.getNome());
            usuario.setEmail(!usuarioMapped.getEmail().isEmpty() ? usuarioMapped.getEmail() : usuario.getEmail());
            usuario.setCelular(!usuarioMapped.getCelular().isEmpty() ? usuarioMapped.getCelular() : usuario.getCelular());
            usuario.setTelefone(!usuarioMapped.getTelefone().isEmpty() ? usuarioMapped.getTelefone() : usuario.getTelefone());

            this.repository.save(usuario);

            if(!uploadedFile.isEmpty()) {
                this.fileRepository.handleFileUpload(usuario.getId(), uploadedFile.getBytes(), this.repository);
            }

            Optional<Usuario> user = this.repository.findById(usuario.getId());

            return user.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    @PostMapping(value = "/autenticar")
    @CrossOrigin
    public Usuario autenticar(@RequestParam String token) {

        byte[] byteArray = Base64.decodeBase64(token.getBytes());
        String decodedString = new String(byteArray);

        System.out.println(decodedString);

        String[] parts = decodedString.split(":");
        String user = parts[0]; // 004
        String pass = parts[1];

        Usuario usuario = this.usuarioRepository.findByEmail(user).get();

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);

        System.out.println(passwordEncoder.matches(pass, usuario.getSenha()));

        if(passwordEncoder.matches(pass, usuario.getSenha())) {
            return usuario;
        } else {
            return null;
        }
    }
}
