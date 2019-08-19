package br.com.adotepets.domain.model.entities;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Date;

public class RevisionListener implements org.hibernate.envers.RevisionListener {

    /**
     * {@inheritDoc }
     *
     * @param revisionEntity
     */
    @Override
    public void newRevision(Object revisionEntity) {

        final Revision revision = (Revision) revisionEntity;

        revision.setCreatedOn(new Date());
        revision.setCreatedBy(this.getLoggedUser());
    }

    /**
     * Get the username of the logged user
     *
     * @return the username of the logged user
     */
    private String getLoggedUser() {

        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication instanceof UsernamePasswordAuthenticationToken) {
            return authentication.getName();
        }
        return "unknow";
    }
}
