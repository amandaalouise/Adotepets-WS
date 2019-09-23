package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Animal;
import io.swagger.annotations.Api;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/animal")
@Api
public class AnimalResource extends AbstractResource<Animal> {


    /**
     * @param repository
     */
    public AnimalResource(JpaRepository<Animal, Long> repository) {
        super(repository);
    }

    /**
     * @param value
     * @return
     */
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.CREATED)
    public Animal edit(@PathVariable Long id, @RequestBody @Valid Animal value) {

        return repository.findById(id)
                .map(animal -> {
                    animal.setCastrado(value.isCastrado());
                    animal.setCor(value.getCor());
                    animal.setDescricao(value.getDescricao());
                    animal.setIdade(value.getIdade());
                    animal.setNome(value.getNome());
                    animal.setPorte(value.getPorte());
                    animal.setRaca(value.getRaca());
                    animal.setSexo(value.getSexo());
                    animal.setTipo(value.getTipo());
                    animal.setVacinado(value.isVacinado());

                    return repository.save(animal);
                })
                .orElseGet(() -> repository.save(value));

    }
}
