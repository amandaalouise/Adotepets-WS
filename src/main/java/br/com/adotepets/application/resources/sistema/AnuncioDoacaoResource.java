package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioDoacao;
import br.com.adotepets.domain.model.exception.ResourceNotFoundException;
import br.com.adotepets.domain.repositories.sistema.AnuncioDoacaoRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/doacao")
@Api
@CrossOrigin(origins = "*")
public class AnuncioDoacaoResource extends AbstractResource<AnuncioDoacao> {

    private FileRepository fileRepository = new FileRepository();
    private AnuncioDoacaoRepository anuncioDoacaoRepository;

    /**
     * @param anuncioDoacaoRepository
     */
    public AnuncioDoacaoResource(AnuncioDoacaoRepository anuncioDoacaoRepository) {
        super(anuncioDoacaoRepository);
        this.anuncioDoacaoRepository = anuncioDoacaoRepository;
    }

    /**
     * @param value
     * @param uploadedFile
     * @return
     */
    @PostMapping(value = "/upload")
    @ResponseStatus(HttpStatus.CREATED)
    public AnuncioDoacao createAndUpload(@RequestParam @Valid String value, @RequestParam("files") List<MultipartFile> uploadedFile) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            var anuncioMapped = objectMapper.readValue(value, AnuncioDoacao.class);

            final AnuncioDoacao doacao = this.anuncioDoacaoRepository.save(anuncioMapped);

            this.fileRepository.handleUploadDoacao(doacao.getId(), uploadedFile, this.anuncioDoacaoRepository);

            Optional<AnuncioDoacao> anuncioDoacao = this.anuncioDoacaoRepository.findById(doacao.getId());

            return anuncioDoacao.get();

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
    public List<AnuncioDoacao> byUserId(@PathVariable("id") Long id) {
        return this.anuncioDoacaoRepository.findByAnimalUsuario(id);
    }
}
