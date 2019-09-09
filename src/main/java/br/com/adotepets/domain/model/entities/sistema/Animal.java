package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;
import org.springframework.data.annotation.Persistent;

import javax.persistence.*;
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
    @ElementCollection(fetch = FetchType.EAGER)
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
    @JoinColumn(name = "usuario_id")
    @JsonIdentityReference(alwaysAsId = true)
    private Usuario usuario;

}
