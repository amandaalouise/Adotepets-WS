package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.AnuncioDoacao;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnuncioDoacaoRepository extends JpaRepository<AnuncioDoacao, Long> {

    @Query("from AnuncioDoacao ad where ad.animal.usuario = :id")
    List<AnuncioDoacao> findByAnimalUsuario(Long id);

     @Query("from AnuncioDoacao")
     Page<AnuncioDoacao> findByFilters(@Param("filter") String filter, Pageable pageable);
}
