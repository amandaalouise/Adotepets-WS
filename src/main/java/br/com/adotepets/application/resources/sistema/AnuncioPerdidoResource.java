package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import br.com.adotepets.domain.repositories.sistema.AnuncioPerdidoRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/perdido")
@Api
public class AnuncioPerdidoResource extends AbstractResource<AnuncioPerdido> {

    private FileRepository fileRepository = new FileRepository();

    /**
     * @param repository
     */
    public AnuncioPerdidoResource(AnuncioPerdidoRepository repository) {
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
    public AnuncioPerdido createAndUpload(@RequestParam @Valid String value, @RequestParam("files") List<MultipartFile> uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            var anuncioMapped = objectMapper.readValue(value, AnuncioPerdido.class);

            final AnuncioPerdido perdido = this.repository.save(anuncioMapped);

            this.fileRepository.handleUploadPerdido(perdido.getId(), uploadedFile, this.repository);

            Optional<AnuncioPerdido> anuncioEncontrado = this.repository.findById(perdido.getId());

            return anuncioEncontrado.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
