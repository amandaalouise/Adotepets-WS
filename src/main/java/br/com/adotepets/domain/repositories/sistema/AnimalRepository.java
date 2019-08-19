package br.com.adotepets.domain.repositories.sistema;

import br.com.adotepets.domain.model.entities.sistema.Animal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnimalRepository extends JpaRepository<Animal, Long> {
}
