package br.com.adotepets.infrastructure.spring.initializer;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import org.springframework.core.annotation.Order;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Order(0)
@Component
public class CriarAdministradorTask implements InitialTask {

    private PasswordEncoder passwordEncoder;
    private UsuarioRepository usuarioRepository;

    /**
     * Construtor
     *
     * @param usuarioRepository o repositorio de {@link Usuario}
     */
    public CriarAdministradorTask(UsuarioRepository usuarioRepository, PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.usuarioRepository = usuarioRepository;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void perform() {
        this.usuarioRepository.findByEmail("amandaalouise@live.com")
                .ifPresentOrElse(saved -> {/* empty */}, () -> {

                    final Usuario usuario = new Usuario();

                    usuario.setNome("Amanda");
                    usuario.setEmail("amandaalouise@live.com");
                    usuario.setSenha(this.passwordEncoder.encode("admin"));

                    this.usuarioRepository.save(usuario);
                });
    }
}
