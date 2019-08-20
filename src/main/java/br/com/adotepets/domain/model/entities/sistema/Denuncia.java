package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Denuncia extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    @OneToOne(targetEntity = Anuncio.class)
    @JoinColumn(referencedColumnName = "id")
    private Anuncio anuncioDenunciado;

    @Getter
    @Setter
    @OneToOne(targetEntity = Usuario.class)
    @JoinColumn(referencedColumnName = "id")
    private Usuario usuarioDenunciante;

}