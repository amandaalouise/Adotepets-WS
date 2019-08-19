package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Denuncia extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    @OneToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private Anuncio anuncioDenunciado;

    @Getter
    @Setter
    @OneToOne
    private Usuario usuarioDenunciante;

}