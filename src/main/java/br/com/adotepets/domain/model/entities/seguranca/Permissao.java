package br.com.adotepets.domain.model.entities.seguranca;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.*;
import org.hibernate.envers.Audited;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Audited
@NoArgsConstructor
@ToString(callSuper = true)
@Table
@EqualsAndHashCode(callSuper = true)
public class Permissao extends PersistentEntity {

    @Getter
    @Setter
    @Column(name = "regra", nullable = false, length = 150)
    private String regra;

    /**
     * Construtor
     *
     * @param regra a ser utilizada nesta permissao
     */
    public Permissao(String regra) {
        this.regra = regra;
    }
}
