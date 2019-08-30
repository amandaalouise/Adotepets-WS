package br.com.adotepets.domain.repositories.seguranca;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.DefaultRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    /**
     * Filtra os usuarios para a tabela de usuarios
     *
     * @param filtro a ser usado
     * @return a lista de usuarios
     */
    @Query("FROM Usuario us " +
            "WHERE UPPER(us.nome) LIKE CONCAT('%', UPPER(:filtro), '%') " +
            "OR UPPER(us.email) LIKE CONCAT('%', UPPER(:filtro), '%')")
    List<Usuario> findUsuariosPor(String filtro);

    Optional<Usuario> findByEmail(String email);
}
