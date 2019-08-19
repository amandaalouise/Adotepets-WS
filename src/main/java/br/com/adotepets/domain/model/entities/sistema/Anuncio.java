package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public abstract class Anuncio extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Animal animal;

    @Getter
    @Setter
    private LocalDate dataPublicacao;

    @Getter
    @Setter
    private boolean ativo = true;

    @Getter
    @Setter
    private String cidade;

    @Getter
    @Setter
    private String estado;

}