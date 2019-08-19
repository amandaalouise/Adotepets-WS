package br.com.adotepets.domain.model.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;

public interface IPersistentEntity<T extends Serializable> {

    /**
     * @return the ID of the entity
     */
    T getId();

    /**
     * @return if the entity is saved or not
     */
    @JsonIgnore
    boolean isSaved();

    /**
     * @return ther inverse of {@link #isSaved()}
     */
    @JsonIgnore
    default boolean isNotSaved() {
        return !this.isSaved();
    }
}
