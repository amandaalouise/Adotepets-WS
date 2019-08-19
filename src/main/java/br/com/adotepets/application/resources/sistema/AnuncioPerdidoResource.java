package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioPerdido;
import br.com.adotepets.domain.repositories.sistema.AnuncioPerdidoRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/perdido")
@Api
public class AnuncioPerdidoResource extends AbstractResource<AnuncioPerdido> {
    /**
     * @param repository
     */
    public AnuncioPerdidoResource(AnuncioPerdidoRepository repository) {
        super(repository);
    }
}
