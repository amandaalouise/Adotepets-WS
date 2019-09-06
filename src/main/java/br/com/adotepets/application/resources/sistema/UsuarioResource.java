package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.apache.tomcat.util.codec.binary.Base64;
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
            var usuarioMapped = objectMapper.readValue(value, Usuario.class);

            final Usuario usuario = this.repository.save(usuarioMapped);

            this.fileRepository.handleFileUpload(usuario.getId(), uploadedFile.getBytes(), this.repository);

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
    public ResponseEntity autenticar(@RequestParam String token) {

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
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.UNAUTHORIZED);
        }
    }
}
