package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.domain.repositories.sistema.FileRepository;
import io.swagger.annotations.Api;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/arquivo")
@Api
public class ArquivoResource {

    private FileRepository fileRepository = new FileRepository();

    public ArquivoResource() {
    }

    @GetMapping(value = "/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {

        try {
            byte[] image = this.fileRepository.findDocumentoFile(id, filename);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/doacao/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getDoacaoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {

        try {
            byte[] image = this.fileRepository.findDoacaoFiles(id, filename);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/perdido/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getPerdidoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {

        try {
            byte[] image = this.fileRepository.findPerdidoFile(id, filename);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/encontrado/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getEncontradoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {

        try {
            byte[] image = this.fileRepository.findEncontradoFile(id, filename);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }
}
