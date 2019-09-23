package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.AnuncioEncontrado;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnuncioEncontradoRepository extends JpaRepository<AnuncioEncontrado, Long> {

    @Query("from AnuncioEncontrado ae where ae.animal.usuario = :id")
    List<AnuncioEncontrado> findByAnimalUsuario(Long id);

    @Query("from AnuncioEncontrado")
    Page<AnuncioEncontrado> findByFilters(@Param("filter") String filter, Pageable pageable);
}
