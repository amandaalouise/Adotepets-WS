package br.com.adotepets.infrastructure.spring.listeners;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.context.ApplicationListener;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import springfox.documentation.schema.configuration.ObjectMapperConfigured;

@Component
public class ObjectMapperConfigurerListener implements ApplicationListener<ObjectMapperConfigured>, Ordered {

    /**
     * {@inheritDoc}
     *
     * @param event
     */
    @Override
    public void onApplicationEvent(ObjectMapperConfigured event) {

        final ObjectMapper objectMapper = event.getObjectMapper();

        objectMapper
                .registerModule(new Jdk8Module())
                .registerModule(new JavaTimeModule())
                .enable(SerializationFeature.INDENT_OUTPUT)
                .disable(
                        DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES,
                        DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                .disable(
                        SerializationFeature.WRITE_DATES_AS_TIMESTAMPS,
                        SerializationFeature.FAIL_ON_EMPTY_BEANS);
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public int getOrder() {
        return LOWEST_PRECEDENCE;
    }
}