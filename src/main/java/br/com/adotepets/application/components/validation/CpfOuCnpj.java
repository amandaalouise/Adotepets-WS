package br.com.adotepets.application.components.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Retention(RUNTIME)
@Target({METHOD, FIELD})
@Constraint(validatedBy = DocumentosValidator.class)
public @interface CpfOuCnpj {

    /**
     *
     * @return
     */
    String message() default "O documento informado não é um CPF ou CNPJ válido";

    /**
     *
     * @return
     */
    Class<?>[] groups() default {};

    /**
     *
     * @return
     */
    Class<? extends Payload>[] payload() default {};
}