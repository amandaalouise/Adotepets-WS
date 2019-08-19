package br.com.adotepets.domain.model.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends ApplicationRuntimeException {

    /**
     *
     */
    public ResourceNotFoundException() {
        this(null, new Object() {
        });
    }

    /**
     * @param message
     */
    public ResourceNotFoundException(String message) {
        this(message, new Object() {
        });
    }

    /**
     * @param message
     * @param parameters
     */
    public ResourceNotFoundException(String message, Object... parameters) {
        super(message, 404, parameters);
    }
}