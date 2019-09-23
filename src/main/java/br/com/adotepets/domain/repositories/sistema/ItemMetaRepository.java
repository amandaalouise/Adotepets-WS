package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.ItemMeta;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemMetaRepository extends JpaRepository<ItemMeta, Long> {

     @Query("from ItemMeta")
     Page<ItemMeta> findByFilters(@Param("filter") String filter, Pageable pageable);
}
