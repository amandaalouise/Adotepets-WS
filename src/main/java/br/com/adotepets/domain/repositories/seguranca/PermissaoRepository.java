package br.com.adotepets.domain.repositories.seguranca;

import br.com.adotepets.domain.model.entities.seguranca.Permissao;
import br.com.adotepets.domain.repositories.DefaultRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PermissaoRepository extends DefaultRepository<Permissao> {

    /**
     * Busca uma {@link Permissao} pela sua regra
     *
     * @param regra para buscarmos a {@link Permissao}
     * @return a {@link Permissao}
     */
    Optional<Permissao> findByRegra(String regra);
}