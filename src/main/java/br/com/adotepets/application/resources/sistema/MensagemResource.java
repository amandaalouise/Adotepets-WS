package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.Mensagem;
import br.com.adotepets.domain.repositories.sistema.MensagemRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/mensagem")
@Api
public class MensagemResource extends AbstractResource<Mensagem> {
    /**
     * @param repository
     */
    public MensagemResource(MensagemRepository repository) {
        super(repository);
    }
}
