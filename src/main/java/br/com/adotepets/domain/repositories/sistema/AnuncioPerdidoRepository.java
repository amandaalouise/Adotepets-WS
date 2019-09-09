package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnuncioPerdidoRepository extends JpaRepository<AnuncioPerdido, Long> {

    @Query("from AnuncioPerdido ap where ap.animal.usuario = :id")
    List<AnuncioPerdido> findByAnimalUsuario(Long id);
}
