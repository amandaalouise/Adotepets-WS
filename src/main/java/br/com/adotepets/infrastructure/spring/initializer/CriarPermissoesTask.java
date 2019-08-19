package br.com.adotepets.infrastructure.spring.initializer;

import br.com.adotepets.domain.model.entities.seguranca.Permissao;
import br.com.adotepets.domain.repositories.seguranca.PermissaoRepository;
import br.com.adotepets.application.components.Regras;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(0)
@Component
public class CriarPermissoesTask implements InitialTask {

    private PermissaoRepository permissaoRepository;

    /**
     * Construtor
     *
     * @param permissaoRepository repositorio de {@link Permissao} de acesso
     */
    public CriarPermissoesTask(PermissaoRepository permissaoRepository) {
        this.permissaoRepository = permissaoRepository;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void perform() {
        Regras.listarRegras().forEach(regra -> this.permissaoRepository.findByRegra(regra)
                .ifPresentOrElse(saved -> {/* do nothing */},
                        () -> this.permissaoRepository.save(new Permissao(regra))));
    }
}
