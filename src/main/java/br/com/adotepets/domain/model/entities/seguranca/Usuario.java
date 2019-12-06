package br.com.adotepets.domain.model.entities.seguranca;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import com.fasterxml.jackson.annotation.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.EAGER;

@Entity
@Audited
@Table
public class Usuario extends PersistentEntity implements UserDetails {

    @Getter
    @Setter
    private String nome;

    @Getter
    @Setter
    @Column(unique = true, nullable = false)
    private String email;

    @JsonIgnore
    private String senha;

    @Getter
    @Setter
    private String imagem;

    @Getter
    @Setter
    private String telefone;

    @Getter
    @Setter
    private String celular;

    @Getter
    @Setter
    private String authToken;

    @Getter
    @Setter
    private String facebook;

    @Getter
    @Setter
    private boolean ativo = false;

    @Getter
    @Setter
    private String codConfirmacao;

    @JsonIgnore
    public String getSenha() {
        return senha;
    }

    @JsonProperty
    public void setSenha(final String senha) {
        this.senha = senha;
    }

    /**
     * Construtor...
     */
    public Usuario() {
        this.ativo = true;
    }

    /**
     * @return
     */
    public Usuario desativar() {
        this.ativo = false;
        return this;
    }

    /**
     * @return
     */
    public Usuario ativar() {
        this.ativo = true;
        return this;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    @JsonIgnore
    public String getPassword() {
        return this.getSenha();
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public String getUsername() {
        return this.getNome();
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public boolean isAccountNonExpired() {
        return this.isAtivo();
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        return this.isAtivo();
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return this.isAtivo();
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public boolean isEnabled() {
        return this.isAtivo();
    }
}