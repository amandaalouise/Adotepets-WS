package br.com.adotepets.domain.model.entities.sistema;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class AnuncioPerdido extends Anuncio {

    @Getter
    @Setter
    @Column(columnDefinition = "NUMERIC")
    private float lat;

    @Getter
    @Setter
    @Column(columnDefinition = "NUMERIC")
    private float lng;

}