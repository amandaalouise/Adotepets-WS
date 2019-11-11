package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import br.com.adotepets.domain.repositories.sistema.AnuncioPerdidoRepository;
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
@RequestMapping("/api/perdido")
@Api
public class AnuncioPerdidoResource extends AbstractResource<AnuncioPerdido> {

    private FileRepository fileRepository = new FileRepository();
    private AnuncioPerdidoRepository anuncioPerdidoRepository;

    /**
     * @param anuncioPerdidoRepository
     */
    public AnuncioPerdidoResource(AnuncioPerdidoRepository anuncioPerdidoRepository) {
        super(anuncioPerdidoRepository);
        this.anuncioPerdidoRepository = anuncioPerdidoRepository;
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

            final AnuncioPerdido perdido = this.anuncioPerdidoRepository.save(anuncioMapped);

            this.fileRepository.handleUploadPerdido(perdido.getId(), uploadedFile, this.anuncioPerdidoRepository);

            Optional<AnuncioPerdido> anuncioPerdido = this.anuncioPerdidoRepository.findById(perdido.getId());

            return anuncioPerdido.get();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @PostMapping(value = "/delete/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public HttpStatus removePerdido(@PathVariable Long id, @RequestParam("userId") Long userId) {

        Optional<AnuncioPerdido> anuncioPerdido = this.anuncioPerdidoRepository.findById(id);
        var anuncio = anuncioPerdido.get();

        if(!anuncio.getAnimal().getUsuario().getId().equals(userId)) {
            return HttpStatus.UNAUTHORIZED;
        } else {
            try {
                this.fileRepository.removeFilesPerdido(id, anuncioPerdidoRepository);
            } catch (IOException e) {
                e.printStackTrace();
            }

            this.anuncioPerdidoRepository.deleteById(id);
            return HttpStatus.OK;
        }
    }

    /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @PostMapping(value = "/edit")
    @ResponseStatus(HttpStatus.CREATED)
    public AnuncioPerdido editAndUpload(@RequestParam @Valid String value,
                                       @RequestParam(value="files", required = false) List<MultipartFile> uploadedFile,
                                       @RequestParam(value="delete", required = false) List<String> delete) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            var anuncioMapped = objectMapper.readValue(value, AnuncioPerdido.class);

            final AnuncioPerdido perdido = this.anuncioPerdidoRepository.getOne(anuncioMapped.getId());

            if(delete != null) {
                for (String img : delete) {
                    this.fileRepository.removeFilePerdido(anuncioMapped.getId(), img);
                }
            }

            this.anuncioPerdidoRepository.save(anuncioMapped);

            if(!uploadedFile.isEmpty()) {
                this.fileRepository.handleUploadPerdido(perdido.getId(), uploadedFile, this.anuncioPerdidoRepository);
            }

            Optional<AnuncioPerdido> anuncioPerdido = this.anuncioPerdidoRepository.findById(perdido.getId());

            return anuncioPerdido.get();

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
    public Page<AnuncioPerdido> byUserId(@PathVariable("id") Long id, @RequestParam("page") int pageIndex, @RequestParam("size") int pageSize) {
        PageRequest pageRequest = PageRequest.of(
                pageIndex,
                pageSize,
                Sort.Direction.ASC,
                "createdOn");
        return this.anuncioPerdidoRepository.findByAnimalUsuarioId(id, pageRequest);
    }
}
