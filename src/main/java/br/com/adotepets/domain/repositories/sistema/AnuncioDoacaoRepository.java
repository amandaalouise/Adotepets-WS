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

    @Query("from AnuncioDoacao ad where ad.animal.usuario.id = :id")
    Page<AnuncioDoacao> findByAnimalUsuarioId(Long id, Pageable pageable);

     @Query("from AnuncioDoacao ad where " +
             "(:tipo = '' or upper(ad.animal.tipo) = upper(:tipo)) AND " +
             "(:sexo = '' or upper(ad.animal.sexo) = upper(:sexo)) AND " +
             "(:porte = '' or upper(ad.animal.porte) = upper(:porte)) AND " +
             "(:idade = '' or upper(ad.animal.idade) = upper(:idade))")
     Page<AnuncioDoacao> findByFilters(
             Pageable pageable,
             String tipo,
             String sexo,
             String porte,
             String idade);
}
