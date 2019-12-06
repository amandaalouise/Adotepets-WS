package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioDoacao;
import br.com.adotepets.domain.repositories.sistema.AnuncioDoacaoRepository;
import br.com.adotepets.domain.repositories.sistema.FileRepository;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
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
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
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


    @PostMapping(value = "/delete/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public HttpStatus removeDoacao(@PathVariable Long id, @RequestParam("userId") Long userId) {

        Optional<AnuncioDoacao> anuncioDoacao = this.anuncioDoacaoRepository.findById(id);
        var anuncio = anuncioDoacao.get();

        if(!anuncio.getAnimal().getUsuario().getId().equals(userId)) {
            return HttpStatus.UNAUTHORIZED;
        } else {
            try {
                this.fileRepository.removeFilesDoacao(id, anuncioDoacaoRepository);
            } catch (IOException e) {
                e.printStackTrace();
            }

            this.anuncioDoacaoRepository.deleteById(id);
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
    public AnuncioDoacao editAndUpload(@RequestParam @Valid String value,
                                       @RequestParam(value="files", required = false) List<MultipartFile> uploadedFile,
                                       @RequestParam(value="delete", required = false) List<String> delete) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            var anuncioMapped = objectMapper.readValue(value, AnuncioDoacao.class);

            final AnuncioDoacao doacao = this.anuncioDoacaoRepository.getOne(anuncioMapped.getId());

            doacao.getAnimal().setTipo(!anuncioMapped.getAnimal().getTipo().isEmpty() ? anuncioMapped.getAnimal().getTipo() : doacao.getAnimal().getTipo());
            doacao.getAnimal().setSexo(!anuncioMapped.getAnimal().getSexo().isEmpty() ? anuncioMapped.getAnimal().getSexo() : doacao.getAnimal().getSexo());
            doacao.getAnimal().setCastrado(anuncioMapped.getAnimal().isCastrado());
            doacao.getAnimal().setNome(!anuncioMapped.getAnimal().getNome().isEmpty() ? anuncioMapped.getAnimal().getNome() : doacao.getAnimal().getNome());
            doacao.getAnimal().setCor(!anuncioMapped.getAnimal().getCor().isEmpty() ? anuncioMapped.getAnimal().getCor() : doacao.getAnimal().getCor());
            doacao.getAnimal().setPorte(!anuncioMapped.getAnimal().getPorte().isEmpty() ? anuncioMapped.getAnimal().getPorte() : doacao.getAnimal().getPorte());
            doacao.getAnimal().setIdade(!anuncioMapped.getAnimal().getIdade().isEmpty() ? anuncioMapped.getAnimal().getIdade() : doacao.getAnimal().getIdade());
            doacao.getAnimal().setDescricao(!anuncioMapped.getAnimal().getDescricao().isEmpty() ? anuncioMapped.getAnimal().getDescricao() : doacao.getAnimal().getDescricao());

            if(delete != null) {
                for (String img : delete) {
                    this.fileRepository.removeFileDoacao(anuncioMapped.getId(), img);
                }
            }

            this.anuncioDoacaoRepository.save(anuncioMapped);

            if(!uploadedFile.isEmpty()) {
                this.fileRepository.handleUploadDoacao(doacao.getId(), uploadedFile, this.anuncioDoacaoRepository);
            }

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
    public Page<AnuncioDoacao> byUserId(@PathVariable("id") Long id, @RequestParam("page") int pageIndex, @RequestParam("size") int pageSize) {
        PageRequest pageRequest = PageRequest.of(
                pageIndex,
                pageSize,
                Sort.Direction.ASC,
                "createdOn");
        return this.anuncioDoacaoRepository.findByAnimalUsuarioId(id, pageRequest);
    }
}
