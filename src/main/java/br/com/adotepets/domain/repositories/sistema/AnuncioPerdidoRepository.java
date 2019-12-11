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

         @Query("from AnuncioPerdido ad where " +
             "(:tipo = '' or upper(ad.animal.tipo) = upper(:tipo)) AND " +
             "(:sexo = '' or upper(ad.animal.sexo) = upper(:sexo)) AND " +
             "(:porte = '' or upper(ad.animal.porte) = upper(:porte)) AND " +
             "(:idade = '' or upper(ad.animal.idade) = upper(:idade))")
     Page<AnuncioPerdido> findByFilters(
             Pageable pageable,
             String tipo,
             String sexo,
             String porte,
             String idade);
}
