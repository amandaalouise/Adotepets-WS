package br.com.adotepets.domain.model.entities.auditoria;

import br.com.adotepets.domain.model.entities.PersistentEntity;
import lombok.*;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@ToString(callSuper = true)
@Table(name = "th_registros_usos")
@EqualsAndHashCode(callSuper = true)
public class RegistroUso extends PersistentEntity {

    @Getter
    @Setter
    @Enumerated(EnumType.STRING)
    @Column(name = "operacao", length = 45, nullable = false)
    private Operacao operacao;
    @Getter
    @Setter
    @Column(name = "verbo_http", length = 45)
    private String verboHttp;
    @Getter
    @Setter
    @Column(name = "quantidade", length = 6, nullable = false)
    private int quantidade;

    /**
     * Construtor...
     *
     * @param operacao qual operacao estamos registrando
     * @param verboHttp qual o verbo http utilizado
     */
    public RegistroUso(Operacao operacao, String verboHttp) {
        this.operacao = operacao;
        this.verboHttp = verboHttp;
        this.quantidade = 1;
    }

    /**
     * Atualiza o registro de uso
     *
     * @return esta classe
     */
    public RegistroUso atualizar() {
        this.quantidade++;
        return this;
    }
}
