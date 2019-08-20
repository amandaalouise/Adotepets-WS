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
import java.time.LocalDate;
import java.util.List;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Mensagem extends PersistentEntity implements Serializable {

    @Getter
    @Setter
    private String texto;

    @Getter
    @Setter
    @OneToMany(targetEntity = Resposta.class, cascade = CascadeType.ALL)
    private List<Resposta> respostas;

    @Getter
    @Setter
    @OneToOne(targetEntity = Usuario.class)
    @JoinColumn(referencedColumnName = "id")
    private Long usuarioPergunta;

    @Getter
    @Setter
    @OneToOne
    private Anuncio anuncio;

    @Getter
    @Setter
    private LocalDate dataPergunta;

    @Getter
    @Setter
    private boolean ativo;
}
