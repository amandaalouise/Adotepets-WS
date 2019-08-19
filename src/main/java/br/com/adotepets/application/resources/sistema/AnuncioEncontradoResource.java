package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioEncontrado;
import br.com.adotepets.domain.repositories.sistema.AnuncioEncontradoRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/encontrado")
@Api
public class AnuncioEncontradoResource extends AbstractResource<AnuncioEncontrado> {
    /**
     * @param repository
     */
    public AnuncioEncontradoResource(AnuncioEncontradoRepository repository) {
        super(repository);
    }
}
