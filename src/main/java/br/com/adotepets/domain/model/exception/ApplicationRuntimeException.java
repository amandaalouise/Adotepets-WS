package br.com.adotepets.domain.model.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class ApplicationRuntimeException extends RuntimeException {

    @Getter
    protected Object[] parameters;

    /**
     * Constructor...
     */
    public ApplicationRuntimeException() {
        this.parameters = new Object[]{};
    }

    /**
     * Constructor...
     *
     * @param message the message to describe the error
     */
    public ApplicationRuntimeException(String message) {
        super(message);
    }

    /**
     * Constructor...
     *
     * @param message    the message to describe the error
     * @param parameters the parameters to fill in the message
     */
    public ApplicationRuntimeException(String message, Object... parameters) {
        super(message);
        this.parameters = parameters;
    }

    /**
     * Constructor...
     *
     * @param message    the message to describe the error
     * @param throwable  the instance of the exception to compose the stack
     * @param parameters the parameters to fill in the message
     */
    public ApplicationRuntimeException(String message, Throwable throwable, Object... parameters) {
        super(message, throwable);
        this.parameters = parameters;
    }
}
