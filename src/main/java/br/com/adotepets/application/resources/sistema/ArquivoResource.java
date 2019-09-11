package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.domain.repositories.sistema.FileRepository;
import io.swagger.annotations.Api;
import org.apache.commons.compress.utils.IOUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.Media;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("/api/arquivo")
@Api
public class ArquivoResource {

    //https://github.com/amandaalouise/springboot-fork/blob/master/src/main/java/org/fucks/oauth2app/controller/FileController.java

    private FileRepository fileRepository = new FileRepository();

    public ArquivoResource() {
    }

    @GetMapping(value= "/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] getFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {
        //obtem a entidade referente ao documento solicitado

        final java.nio.file.Path path = this.fileRepository.findDocumentoFile(id, filename);
        InputStream in = getClass().getResourceAsStream(path.toString());

        System.out.println(path.toString());
        return IOUtils.toByteArray(in);
    }

    @GetMapping(value = "/doacao/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getDoacaoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {
        //obtem a entidade referente ao documento solicitado

        try {
            byte[] image = this.fileRepository.findDoacaoFiles(id, filename);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping(value = "/perdido/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] getPerdidoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {
        //obtem a entidade referente ao documento solicitado

        final java.nio.file.Path path = this.fileRepository.findPerdidoFile(id, filename);

        InputStream in = getClass().getResourceAsStream(path.toString());

        System.out.println(path.toString());
        return IOUtils.toByteArray(in);
    }

    @GetMapping(value = "/encontrado/{id}/{filename}", produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] getEncontradoFile(@PathVariable("id") Long id, @PathVariable("filename") String filename) throws IOException {
        //obtem a entidade referente ao documento solicitado

        final java.nio.file.Path path = this.fileRepository.findEncontradoFile(id, filename);

        InputStream in = getClass().getResourceAsStream(path.toString());

        System.out.println(path.toString());
        return IOUtils.toByteArray(in);
    }
}
