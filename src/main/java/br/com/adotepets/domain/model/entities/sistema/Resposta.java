package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Resposta extends PersistentEntity implements Serializable {


    @Getter
    @Setter
    private String texto;

    @Getter
    @Setter
    private LocalDate data;

    public Resposta() {
        this.data = LocalDate.now();
    }
}