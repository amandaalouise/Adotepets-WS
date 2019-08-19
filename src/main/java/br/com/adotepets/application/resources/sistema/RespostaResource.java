package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Resposta;
import br.com.adotepets.domain.repositories.sistema.RespostaRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/resposta")
@Api
public class RespostaResource extends AbstractResource<Resposta> {
    /**
     * @param repository
     */
    public RespostaResource(RespostaRepository repository) {
        super(repository);
    }
}
