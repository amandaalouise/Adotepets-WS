package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.MetaMensal;
import br.com.adotepets.domain.repositories.sistema.MetaMensalRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/meta-mensal")
@Api
public class MetaMensalResource extends AbstractResource<MetaMensal> {
    /**
     * @param repository
     */
    public MetaMensalResource(MetaMensalRepository repository) {
        super(repository);
    }
}
