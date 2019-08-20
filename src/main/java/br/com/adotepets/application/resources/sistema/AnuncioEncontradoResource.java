package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioEncontrado;
import br.com.adotepets.domain.repositories.sistema.AnuncioEncontradoRepository;
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
@RequestMapping("/api/encontrado")
@Api
public class AnuncioEncontradoResource extends AbstractResource<AnuncioEncontrado> {

    private FileRepository fileRepository = new FileRepository();

    /**
     * @param repository
     */
    public AnuncioEncontradoResource(AnuncioEncontradoRepository repository) {
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
    public AnuncioEncontrado createAndUpload(@RequestParam @Valid String value, @RequestParam("files") List<MultipartFile> uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            var anuncioMapped = objectMapper.readValue(value, AnuncioEncontrado.class);

            final AnuncioEncontrado encontrado = this.repository.save(anuncioMapped);

            this.fileRepository.handleUploadEncontrado(encontrado.getId(), uploadedFile, this.repository);

            Optional<AnuncioEncontrado> anuncioEncontrado = this.repository.findById(encontrado.getId());

            return anuncioEncontrado.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
