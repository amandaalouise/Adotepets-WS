package br.com.adotepets.infrastructure.spring.config;

import br.com.adotepets.infrastructure.i18n.MessageHolder;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.filter.CharacterEncodingFilter;

import java.util.Locale;

@Configuration
public class CommonConfiguration {

    /**
     * Configura o validador padrao para o Bean Validation
     *
     * @return {@link LocalValidatorFactoryBean} para uso
     */
    @Bean
    public Validator configureValidator() {
        return new LocalValidatorFactoryBean();
    }

    /**
     * Configura a parte de i18n da aplicacao
     *
     * @return a instancia {@link MessageSource} da aplicacao
     */
    @Bean
    public MessageSource configureMessages() {

        Locale.setDefault(new Locale("pt", "BR"));

        final ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

        messageSource.setCacheSeconds(0);
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setAlwaysUseMessageFormat(true);
        messageSource.setUseCodeAsDefaultMessage(true);

        messageSource.setBasenames(
                "classpath:i18n/enums",
                "classpath:i18n/messages"
        );

        // put this bundle inside the value holder
        MessageHolder.setSource(messageSource);

        return messageSource;
    }

    /**
     * Filtro de encoding para as requests http
     *
     * @return o {@link CharacterEncodingFilter} configurado para UTF-8
     */
    @Bean
    public CharacterEncodingFilter configureEncodingFilter() {

        final CharacterEncodingFilter filter = new CharacterEncodingFilter();

        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);

        return filter;
    }

    /**
     * Configura o bCrypt para uso como {@link PasswordEncoder} da aplicacao
     *
     * @return o {@link PasswordEncoder} padrao
     */
    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder(12);
    }
}