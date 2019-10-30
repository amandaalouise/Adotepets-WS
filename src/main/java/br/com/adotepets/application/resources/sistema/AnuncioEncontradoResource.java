package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioEncontrado;
import br.com.adotepets.domain.repositories.sistema.AnuncioEncontradoRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
    private AnuncioEncontradoRepository anuncioEncontradoRepository;

    /**
     * @param anuncioEncontradoRepository
     */
    public AnuncioEncontradoResource(AnuncioEncontradoRepository anuncioEncontradoRepository) {
        super(anuncioEncontradoRepository);
        this.anuncioEncontradoRepository = anuncioEncontradoRepository;
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

            final AnuncioEncontrado encontrado = this.anuncioEncontradoRepository.save(anuncioMapped);

            this.fileRepository.handleUploadEncontrado(encontrado.getId(), uploadedFile, this.anuncioEncontradoRepository);

            Optional<AnuncioEncontrado> anuncioEncontrado = this.anuncioEncontradoRepository.findById(encontrado.getId());

            return anuncioEncontrado.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param id
     * @return
     */
    @GetMapping("/porUsuario/{id}")
    public Page<AnuncioEncontrado> byUserId(@PathVariable("id") Long id, @RequestParam("page") int pageIndex, @RequestParam("size") int pageSize) {
        PageRequest pageRequest = PageRequest.of(
                pageIndex,
                pageSize,
                Sort.Direction.ASC,
                "createdOn");
        return this.anuncioEncontradoRepository.findByAnimalUsuarioId(id, pageRequest);
    }
}
