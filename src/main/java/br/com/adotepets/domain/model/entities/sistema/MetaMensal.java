package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class MetaMensal extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    @OneToMany(targetEntity = ItemMeta.class, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<ItemMeta> itens;

    @Getter
    @Setter
    private int mes;

    @Getter
    @Setter
    private int ano;

    @Getter
    @Setter
    @OneToOne(targetEntity = Prestador.class)
    @JoinColumn(referencedColumnName = "id")
    private Long prestador;

    @Getter
    @Setter
    private BigDecimal progressoTotal;


}