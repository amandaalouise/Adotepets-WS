package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.Mensagem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MensagemRepository extends JpaRepository<Mensagem, Long> {
}
