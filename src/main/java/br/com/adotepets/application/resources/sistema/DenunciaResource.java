package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Denuncia;
import br.com.adotepets.domain.repositories.sistema.DenunciaRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/denuncia")
@Api
public class DenunciaResource extends AbstractResource<Denuncia> {
    /**
     * @param repository
     */
    public DenunciaResource(DenunciaRepository repository) {
        super(repository);
    }
}
