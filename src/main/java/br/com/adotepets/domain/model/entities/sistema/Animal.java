package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.util.List;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Animal extends PersistentEntity {

    @Getter
    @Setter
    private String tipo;

    @Getter
    @Setter
    private String idade;

    @Getter
    @Setter
    @ElementCollection
    private List<String> imagens;

    @Getter
    @Setter
    private String sexo;

    @Getter
    @Setter
    private String nome;

    @Getter
    @Setter
    private String descricao;

    @Getter
    @Setter
    private String raca;

    @Getter
    @Setter
    private String cor;

    @Getter
    @Setter
    private String porte;

    @Getter
    @Setter
    private boolean vacinado;

    @Getter
    @Setter
    private boolean castrado;

    @Getter
    @Setter
    @OneToOne
    private Usuario usuario;

}
