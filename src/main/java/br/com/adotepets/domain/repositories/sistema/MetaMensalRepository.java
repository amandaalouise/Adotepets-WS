package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.MetaMensal;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MetaMensalRepository extends JpaRepository<MetaMensal, Long> {

    @Query("from MetaMensal")
    Page<MetaMensal> findByFilters(@Param("filter") String filter, Pageable pageable);
}
