package br.com.adotepets.application.resources.sistema;

import br.com.adotepets.application.resources.AbstractResource;
import br.com.adotepets.domain.model.entities.sistema.ItemMeta;
import br.com.adotepets.domain.repositories.sistema.ItemMetaRepository;
import io.swagger.annotations.Api;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/item-meta")
@Api
public class ItemMetaResource extends AbstractResource<ItemMeta> {
    /**
     * @param repository
     */
    public ItemMetaResource(ItemMetaRepository repository) {
        super(repository);
    }
}
