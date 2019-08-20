package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/usuario")
@Api
public class UsuarioResource extends AbstractResource<Usuario> {

    private FileRepository fileRepository = new FileRepository();

    /**
     * @param repository
     */
    public UsuarioResource(UsuarioRepository repository) {
        super(repository);
    }

    /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @Transactional
    @PostMapping(value = "/upload")
    @ResponseStatus(HttpStatus.CREATED)
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
}
