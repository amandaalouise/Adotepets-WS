package br.com.adotepets.infrastructure.spring.initializer;

import br.com.adotepets.domain.model.entities.seguranca.Permissao;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.PermissaoRepository;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.domain.services.AutorizacaoService;
import br.com.adotepets.application.components.Regras;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(2)
@Component
public class AutorizarAdministradorTask implements InitialTask {

    @Autowired
    private UsuarioRepository usuarioRepository;
    @Autowired
    private PermissaoRepository permissaoRepository;

    @Autowired
    private AutorizacaoService autorizacaoService;

    /**
     * {@inheritDoc}
     */
    @Override
    public void perform() {

        final Usuario usuario = this.usuarioRepository.findByEmail("amandaalouise@live.com")
                .orElseThrow(() -> new IllegalStateException("Usuario admin não foi localizado! Ele existe?"));

        if (usuario.getAuthorities().isEmpty()) {

            final Permissao permissaoAdmin = this.permissaoRepository.findByRegra(Regras.ADMINISTRADOR)
                    .orElseThrow(() -> new IllegalStateException("Permissao de administrador nao localizada!"));

            this.autorizacaoService.autorizar(usuario, permissaoAdmin);
        }
    }
}
