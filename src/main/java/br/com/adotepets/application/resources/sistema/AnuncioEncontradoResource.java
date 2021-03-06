package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioEncontrado;
import br.com.adotepets.domain.repositories.sistema.AnuncioEncontradoRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.DeserializationFeature;
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
import java.io.IOException;
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
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
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

    @PostMapping(value = "/delete/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public HttpStatus removeEncontrado(@PathVariable Long id, @RequestParam("userId") Long userId) {

        Optional<AnuncioEncontrado> anuncioEncontrado = this.anuncioEncontradoRepository.findById(id);
        var anuncio = anuncioEncontrado.get();

        if(!anuncio.getAnimal().getUsuario().getId().equals(userId)) {
            return HttpStatus.UNAUTHORIZED;
        } else {
            try {
                this.fileRepository.removeFilesEncontrado(id, anuncioEncontradoRepository);
            } catch (IOException e) {
                e.printStackTrace();
            }

            this.anuncioEncontradoRepository.deleteById(id);
            return HttpStatus.OK;
        }
    }

    /**
     * @return
     */
    @GetMapping(value = "filter")
    public Page<AnuncioEncontrado> findByFilters(
            @RequestParam("page") int pageIndex,
            @RequestParam("size") int pageSize,
            @RequestParam("tipo") String tipo,
            @RequestParam("sexo") String sexo,
            @RequestParam("porte") String porte,
            @RequestParam("idade") String idade) {
        PageRequest pageRequest = PageRequest.of(
                pageIndex,
                pageSize,
                Sort.Direction.ASC,
                "createdOn");

        return anuncioEncontradoRepository.findByFilters(pageRequest, tipo, sexo, porte, idade);
    }

    /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @PostMapping(value = "/edit")
    @ResponseStatus(HttpStatus.CREATED)
    public AnuncioEncontrado editAndUpload(@RequestParam @Valid String value,
                                       @RequestParam(value="files", required = false) List<MultipartFile> uploadedFile,
                                       @RequestParam(value="delete", required = false) List<String> delete) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            var anuncioMapped = objectMapper.readValue(value, AnuncioEncontrado.class);

            final AnuncioEncontrado encontrado = this.anuncioEncontradoRepository.getOne(anuncioMapped.getId());

            if(delete != null) {
                for (String img : delete) {
                    this.fileRepository.removeFileEncontrado(anuncioMapped.getId(), img);
                }
            }

            this.anuncioEncontradoRepository.save(anuncioMapped);

            if(!uploadedFile.isEmpty()) {
                this.fileRepository.handleUploadEncontrado(encontrado.getId(), uploadedFile, this.anuncioEncontradoRepository);
            }

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
