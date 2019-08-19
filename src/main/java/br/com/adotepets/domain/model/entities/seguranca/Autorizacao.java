package br.com.adotepets.domain.model.entities.seguranca;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.envers.Audited;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Audited
@NoArgsConstructor
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Autorizacao extends PersistentEntity implements GrantedAuthority {

    @Getter
    @ManyToOne(optional = false)
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;
    @Getter
    @ManyToOne(optional = false)
    @JoinColumn(name = "id_permissao", nullable = false)
    private Permissao permissao;

    /**
     * @param usuario
     * @param permissao
     */
    public Autorizacao(Usuario usuario, Permissao permissao) {
        this.usuario = usuario;
        this.permissao = permissao;
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public String getAuthority() {
        return this.permissao.getRegra();
    }
}