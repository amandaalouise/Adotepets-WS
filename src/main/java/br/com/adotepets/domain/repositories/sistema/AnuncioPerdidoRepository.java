package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnuncioPerdidoRepository extends JpaRepository<AnuncioPerdido, Long> {

    @Query("from AnuncioPerdido ap where ap.animal.usuario.id = :id")
    Page<AnuncioPerdido> findByAnimalUsuarioId(Long id, Pageable pageable);

    @Query("from AnuncioPerdido")
    Page<AnuncioPerdido> findByFilters(@Param("filter") String filter, Pageable pageable);
}
