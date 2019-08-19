package br.com.adotepets.domain.repositories;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DefaultRepository<T extends PersistentEntity> extends JpaRepository<T, Long> { }
