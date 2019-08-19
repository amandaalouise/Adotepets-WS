package br.com.adotepets.domain.repositories.auditoria;

import br.com.adotepets.domain.model.entities.auditoria.Operacao;
import br.com.adotepets.domain.model.entities.auditoria.RegistroUso;
import br.com.adotepets.domain.repositories.DefaultRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RegistroUsoRepository extends DefaultRepository<RegistroUso> {

    /**
     * Busca um registro de uso por operacao
     *
     * @param operacao operacao que desejamos buscar
     * @return um {@link Optional} do registro de uso
     */
    Optional<RegistroUso> findByOperacao(Operacao operacao);
}
