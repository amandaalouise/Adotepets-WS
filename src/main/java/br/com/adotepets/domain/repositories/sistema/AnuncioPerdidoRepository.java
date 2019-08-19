package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnuncioPerdidoRepository extends JpaRepository<AnuncioPerdido, Long> {
}
