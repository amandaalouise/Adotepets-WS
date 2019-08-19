package br.com.adotepets.application.components.validation;

import br.com.caelum.stella.validation.CNPJValidator;
import br.com.caelum.stella.validation.CPFValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

public class DocumentosValidator implements ConstraintValidator<CpfOuCnpj, String> {

    private CPFValidator cpfValidator;
    private CNPJValidator cnpjValidator;

    private Logger logger;

    /**
     *
     */
    public DocumentosValidator() {
        this.cpfValidator = new CPFValidator(false);
        this.cnpjValidator = new CNPJValidator(false);
        this.logger = LoggerFactory.getLogger(DocumentosValidator.class);
    }

    /**
     * {@inheritDoc}
     *
     * @param value
     * @param context
     * @return
     */
    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        // PS 1: nao me orgulho desse codigo mas precisava resolver o problema rapido
        // PS 2: os validator do HBM poderiam ser usados aqui mas nao funcionaram e eu nao tenho tempo pra saber pq
        // PS 3: se vc tiver tempo, remova o stella e use os nativos do HBM, ou nao mexa em nada e seja feliz

        boolean cpfValid = true;
        boolean cnpjValid = true;

        if (isNotBlank(value)) {

            try {
                this.cnpjValidator.assertValid(value.replace("\\w", ""));
            } catch (Exception ex) {
                cnpjValid = false;
                this.logger.debug("{} nao e um CNPJ valido", value);
            }

            try {
                this.cpfValidator.assertValid(value.replace("\\w", ""));
            } catch (Exception ex) {
                cpfValid = false;
                this.logger.debug("{} nao e um CPF valido", value);
            }
        }

        return cpfValid || cnpjValid;
    }
}
