package br.com.adotepets.domain.services;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.application.components.PasswordGenerator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UsuarioService {

    private PasswordEncoder passwordEncoder;

    private UsuarioRepository usuarioRepository;

    /**
     *
     * @param passwordEncoder
     * @param usuarioRepository
     */
    public UsuarioService(PasswordEncoder passwordEncoder, UsuarioRepository usuarioRepository) {
        this.passwordEncoder = passwordEncoder;
        this.usuarioRepository = usuarioRepository;
    }

    /**
     *
     * @param usuario
     */
    @Transactional
    public List<Usuario> cadastrar(Usuario usuario) {

        usuario.setSenha(this.passwordEncoder.encode(usuario.getSenha()));

        this.usuarioRepository.findByEmail(usuario.getEmail())
                .ifPresentOrElse(saved -> {/* empty */}, () -> this.usuarioRepository.save(usuario));

        return this.usuarioRepository.findAll();
    }

    /**
     *
     * @param usuarioId
     * @return
     */
    @Transactional
    public List<Usuario> ativar(long usuarioId) {
        this.usuarioRepository.findById(usuarioId)
                .ifPresent(usuario -> this.usuarioRepository.save(usuario.ativar()));
        return this.usuarioRepository.findAll();
    }

    /**
     *
     * @param usuarioId
     * @return
     */
    @Transactional
    public List<Usuario> desativar(long usuarioId) {
        this.usuarioRepository.findById(usuarioId)
                .ifPresent(usuario -> this.usuarioRepository.save(usuario.desativar()));
        return this.usuarioRepository.findAll();
    }

    /**
     *
     * @param id
     * @return
     */
    @Transactional
    public String trocarSenha(Long id) {

        final String novaSenha = PasswordGenerator.generate();

        this.usuarioRepository.findById(id).ifPresent(usuario -> {
            usuario.setSenha(this.passwordEncoder.encode(novaSenha));
            this.usuarioRepository.save(usuario);
        });

        return novaSenha;
    }
}
