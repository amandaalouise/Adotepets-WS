package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.model.entities.sistema.*;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
@Transactional
public class FileRepository {

    private final String FILES_FOLDER = "/mnt/adotapet";

    private final String DOCUMENTOS_FOLDER = "/photos/";

    private final String ANUNCIOS_FOLDER = "/anuncios/";

    private final String DOACAO_FOLDER = "/doacao/";

    private final String ENC_FOLDER = "/encontrados/";

    private final String PERD_FOLDER = "/perdidos/";

    /**
     * Grava o arquivo no sistema de arquvios.
     *
     * @param path
     * @param filename
     * @param bytes
     * @throws IOException
     */
    public void save(String path, String filename, byte[] bytes) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER);
        final Path filePath = home.resolve(path);

        //caso o Path principal não exista, cria
        if (!Files.exists(home)) {
            Files.createDirectory(home);
        }

        //caso o path do arquivo não exista, cria
        if (!Files.exists(filePath)) {
            Files.createDirectories(filePath);
        }

        final Path file = filePath.resolve(filename);

        //cria o local do arquivo
        if (!Files.exists(file)) {
            Files.createFile(file);
        }

        //escreve os bytes no disco.
        Files.write(file, bytes);
    }

    /**
     * Verifica se o arquivo a ser salvo já existe no sistema de arquivos.
     *
     * @param path
     * @param filename
     * @return
     */
    public boolean verifyExists(String path, String filename) {
        final Path home = Paths.get(this.FILES_FOLDER);
        final Path filePath = home.resolve(path);
        final Path file = filePath.resolve(filename);

        return Files.exists(file);
    }

    public void handleFileUpload(Long userId, byte[] file, JpaRepository<Usuario, Long> repository) throws Exception {

        final Usuario usuario = repository.findById(userId).get();

        String fileName = "photo_" + userId + "_" + Calendar.getInstance().getTimeInMillis() + ".png";

        usuario.setImagem(fileName);

        //Cria o path do arquivo
        final String path = this.FILES_FOLDER + this.DOCUMENTOS_FOLDER + userId;

        //salva o arquivo.
        this.save(path, fileName, file);

        repository.save(usuario);

    }

    /**
     * Verifica as informações do arquivo a ser gravado, resolve o path e o nome
     * do arquivo, manda fazer a gravação no sistema de arquivos.
     *
     * @param userId
     * @param file
     * @return
     * @throws Exception
     */
    public void handleFileUploadPrestador(Long userId, byte[] file, JpaRepository<Prestador, Long> prestadorRepository) throws Exception {

        final Prestador usuario = prestadorRepository.findById(userId).get();

        String fileName = "photo_" + userId + "_" + Calendar.getInstance().getTimeInMillis() + ".png";

        usuario.setImagem(fileName);

        //Cria o path do arquivo
        final String path = this.FILES_FOLDER + this.DOCUMENTOS_FOLDER + String.valueOf(userId);

        //salva o arquivo.
        this.save(path, fileName, file);

        prestadorRepository.save(usuario);

    }

    /**
     * Verifica as informações do arquivo a ser gravado, resolve o path e o nome
     * do arquivo, manda fazer a gravação no sistema de arquivos.
     *
     * @param anuncioId
     * @param file
     * @throws Exception
     */
    public void handleUploadDoacao(Long anuncioId, List<MultipartFile> file, JpaRepository<AnuncioDoacao, Long> anuncioDoacaoRepository) throws Exception {

        final AnuncioDoacao doacao = anuncioDoacaoRepository.findById(anuncioId).get();
        List<String> files = new ArrayList<>();

        for (MultipartFile f : file) {

            String fileName = "photo_" + anuncioId + "_" + Calendar.getInstance().getTimeInMillis() + ".png";

            files.add(fileName);

            //Cria o path do arquivo
            final String path = this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.DOACAO_FOLDER + String.valueOf(anuncioId);

            //salva o arquivo.
            this.save(path, fileName, f.getBytes());
        }

        var tempImages = doacao.getAnimal().getImagens();
        tempImages.addAll(files);

        doacao.getAnimal().setImagens(tempImages);
        anuncioDoacaoRepository.save(doacao);
    }

    /**
     * Verifica as informações do arquivo a ser gravado, resolve o path e o nome
     * do arquivo, manda fazer a gravação no sistema de arquivos.
     *
     * @param anuncioId
     * @param file
     * @throws Exception
     */
    public void handleUploadPerdido(Long anuncioId, List<MultipartFile> file, JpaRepository<AnuncioPerdido, Long> anuncioPerdidoRepository) throws Exception {

        final AnuncioPerdido perdido = anuncioPerdidoRepository.findById(anuncioId).get();
        List<String> files = new ArrayList<>();

        for (MultipartFile f : file) {

            String fileName = "photo_" + anuncioId + "_" + Calendar.getInstance().getTimeInMillis() + ".png";

            files.add(fileName);

            //Cria o path do arquivo
            final String path = this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.PERD_FOLDER + String.valueOf(anuncioId);

            //salva o arquivo.
            this.save(path, fileName, f.getBytes());
        }

        var tempImages = perdido.getAnimal().getImagens();
        tempImages.addAll(files);

        perdido.getAnimal().setImagens(tempImages);
        anuncioPerdidoRepository.save(perdido);
    }

    /**
     * Verifica as informações do arquivo a ser gravado, resolve o path e o nome
     * do arquivo, manda fazer a gravação no sistema de arquivos.
     *
     * @param anuncioId
     * @param file
     * @throws Exception
     */
    public void handleUploadEncontrado(Long anuncioId, List<MultipartFile> file, JpaRepository<AnuncioEncontrado, Long> anuncioEncontradoRepository) throws Exception {

        final AnuncioEncontrado encontrado = anuncioEncontradoRepository.findById(anuncioId).get();
        List<String> files = new ArrayList<>();

        for (MultipartFile f : file) {

            String fileName = "photo_" + anuncioId + "_" + Calendar.getInstance().getTimeInMillis() + ".png";

            files.add(fileName);

            //Cria o path do arquivo
            final String path = this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.ENC_FOLDER + String.valueOf(anuncioId);

            //salva o arquivo.
            this.save(path, fileName, f.getBytes());
        }

        var tempImages = encontrado.getAnimal().getImagens();
        tempImages.addAll(files);

        encontrado.getAnimal().setImagens(tempImages);
        anuncioEncontradoRepository.save(encontrado);

    }

    /**
     * Busca um arquivo no sistema de arquivos.
     *
     * @return
     */
    public byte[] findDocumentoFile(Long id, String doc) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.DOCUMENTOS_FOLDER + id + "/");
        final Path file = home.resolve(doc + ".png");

        return Files.readAllBytes(file);
    }

    /**
     * Busca um arquivo no sistema de arquivos.
     *
     * @return
     */
    public byte[] findDoacaoFiles(Long id, String doc) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.DOACAO_FOLDER + id + "/");
        final Path file = home.resolve(doc + ".png");

        return Files.readAllBytes(file);
    }

    /**
     * Busca um arquivo no sistema de arquivos.
     *
     * @return
     */
    public byte[] findPerdidoFile(Long id, String doc) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.PERD_FOLDER + id + "/");
        final Path file = home.resolve(doc + ".png");

        return Files.readAllBytes(file);
    }

    /**
     * Busca um arquivo no sistema de arquivos.
     *
     * @return
     */
    public byte[] findEncontradoFile(Long id, String doc) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.ENC_FOLDER + id + "/");
        final Path file = home.resolve(doc + ".png");

        return Files.readAllBytes(file);
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFile(Long id, JpaRepository<Usuario, Long> usuarioRepository) throws IOException {
        final Usuario user = usuarioRepository.findById(id).get();
        final Path home = Paths.get(this.FILES_FOLDER + this.DOCUMENTOS_FOLDER + String.valueOf(id) + "/");
        if (Files.exists(home, LinkOption.NOFOLLOW_LINKS)) {
            final Path file = home.resolve(user.getImagem());
            Files.deleteIfExists(file);
        }
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFilePrestador(Long id, JpaRepository<Prestador, Long> prestadorRepository) throws IOException {
        final Prestador user = prestadorRepository.findById(id).get();
        final Path home = Paths.get(this.FILES_FOLDER + this.DOCUMENTOS_FOLDER + String.valueOf(id) + "/");
        if (Files.exists(home, LinkOption.NOFOLLOW_LINKS)) {
            final Path file = home.resolve(user.getImagem());
            Files.deleteIfExists(file);
        }
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFilesDoacao(Long id, JpaRepository<AnuncioDoacao, Long> anuncioDoacaoRepository) throws IOException {
        final AnuncioDoacao anuncio = anuncioDoacaoRepository.findById(id).get();
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.DOACAO_FOLDER + String.valueOf(id) + "/");

        for (String s : anuncio.getAnimal().getImagens()) {
            final Path file = home.resolve(s);
            Files.deleteIfExists(file);
        }
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @param fileName
     * @throws IOException
     */
    public void removeFileDoacao(Long id, String fileName) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.DOACAO_FOLDER + String.valueOf(id) + "/");

        final Path file = home.resolve(fileName);
        Files.deleteIfExists(file);
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFilesPerdido(Long id, JpaRepository<AnuncioPerdido, Long> anuncioPerdidoRepository) throws IOException {
        final AnuncioPerdido anuncio = anuncioPerdidoRepository.findById(id).get();
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.PERD_FOLDER + String.valueOf(id) + "/");

        for (String s : anuncio.getAnimal().getImagens()) {
            final Path file = home.resolve(s);
            Files.deleteIfExists(file);
        }
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @param fileName
     * @throws IOException
     */
    public void removeFilePerdido(Long id, String fileName) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.PERD_FOLDER + String.valueOf(id) + "/");

        final Path file = home.resolve(fileName);
        Files.deleteIfExists(file);
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFilesEncontrado(Long id, JpaRepository<AnuncioEncontrado, Long> anuncioEncontradoRepository) throws IOException {
        final AnuncioEncontrado anuncio = anuncioEncontradoRepository.findById(id).get();
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.ENC_FOLDER + String.valueOf(id) + "/");

        for (String s : anuncio.getAnimal().getImagens()) {
            final Path file = home.resolve(s);
            Files.deleteIfExists(file);
        }
    }

    /**
     * Deleta um arquivo do sistema de arquivos.
     *
     * @param id
     * @throws IOException
     */
    public void removeFileEncontrado(Long id, String fileName) throws IOException {
        final Path home = Paths.get(this.FILES_FOLDER + this.ANUNCIOS_FOLDER + this.ENC_FOLDER + String.valueOf(id) + "/");

        final Path file = home.resolve(fileName);
        Files.deleteIfExists(file);
    }
}
