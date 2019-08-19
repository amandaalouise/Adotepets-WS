package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Prestador;
import br.com.adotepets.domain.repositories.sistema.PrestadorRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/prestador")
@Api
public class PrestadorResource extends AbstractResource<Prestador> {
    /**
     * @param repository
     */
    public PrestadorResource(PrestadorRepository repository) {
        super(repository);
    }
}
