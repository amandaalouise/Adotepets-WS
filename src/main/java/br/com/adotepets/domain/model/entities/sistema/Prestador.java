package br.com.adotepets.domain.model.entities.sistema;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.br.CPF;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class Prestador extends Usuario {

    @Getter
    @Setter
    private String responsavel;

    @Getter
    @Setter
    @CPF
    private String cpfResponsavel;

    @Getter
    @Setter
    private String tipo;

    @Getter
    @Setter
    private String cep;

    @Getter
    @Setter
    private String logradouro;

    @Getter
    @Setter
    private String numero;

    @Getter
    @Setter
    private String cidade;

    @Getter
    @Setter
    private String estado;

    @Getter
    @Setter
    private String banco;

    @Getter
    @Setter
    private String conta;

    @Getter
    @Setter
    private String agencia;

}