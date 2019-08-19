package br.com.adotepets.domain.model.entities.sistema;

import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.envers.Audited;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Audited
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Table
public class AnuncioDoacao extends Anuncio {

}