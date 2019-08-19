package br.com.adotepets.domain.model.entities;

import io.swagger.annotations.ApiModelProperty;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@ToString
@MappedSuperclass
@NoArgsConstructor
@EqualsAndHashCode
public abstract class PersistentEntity implements IPersistentEntity<Long> {

    @Id
    @Getter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, updatable = false)
    @ApiModelProperty(hidden = true)
    private Long id;

    @Getter
    @Column(name = "created_on", nullable = false)
    @ApiModelProperty(hidden = true)
    private LocalDateTime createdOn;
    @Getter
    @Column(name = "updated_on")
    @ApiModelProperty(hidden = true)
    private LocalDateTime updatedOn;

    /**
     * Set the date of creation for this entity
     */
    @PrePersist
    protected void beforeInsert() {
        this.createdOn = LocalDateTime.now();
    }

    /**
     * Set the date of update for this entity
     */
    @PreUpdate
    protected void beforeUpdate() {
        this.updatedOn = LocalDateTime.now();
    }

    /**
     * {@inheritDoc }
     *
     * @return
     */
    @Override
    public boolean isSaved() {
        return this.id != null && this.id != 0;
    }
}