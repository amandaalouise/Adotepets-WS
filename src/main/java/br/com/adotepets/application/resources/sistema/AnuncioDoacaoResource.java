package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.AnuncioDoacao;
import br.com.adotepets.domain.repositories.sistema.AnuncioDoacaoRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/doacao")
@Api
public class AnuncioDoacaoResource extends AbstractResource<AnuncioDoacao> {
    /**
     * @param repository
     */
    public AnuncioDoacaoResource(AnuncioDoacaoRepository repository) {
        super(repository);
    }
}
