package br.com.adotepets.domain.repositories;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;

public interface DefaultRepository<T extends PersistentEntity> extends JpaRepository<T, Long> {
}
