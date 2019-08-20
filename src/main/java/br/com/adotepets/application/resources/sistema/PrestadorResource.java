package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Prestador;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import br.com.adotepets.domain.repositories.sistema.PrestadorRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/prestador")
@Api
public class PrestadorResource extends AbstractResource<Prestador> {

    private FileRepository fileRepository = new FileRepository();

    /**
     * @param repository
     */
    public PrestadorResource(PrestadorRepository repository) {
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
    public Prestador createAndUpload(@RequestParam @Valid String value, @RequestParam("file") MultipartFile uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            var usuarioMapped = objectMapper.readValue(value, Prestador.class);

            final Prestador usuario = this.repository.save(usuarioMapped);

            this.fileRepository.handleFileUploadPrestador(usuario.getId(), uploadedFile.getBytes(), this.repository);

            Optional<Prestador> user = this.repository.findById(usuario.getId());

            return user.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
