package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class ItemMeta extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    private String tipo;

    @Getter
    @Setter
    private int quantidade;

    @Getter
    @Setter
    private String unidade;

    @Getter
    @Setter
    private int progresso;

    @Getter
    @Setter
    private boolean ativo;

}