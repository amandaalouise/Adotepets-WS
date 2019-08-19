package br.com.adotepets.infrastructure.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger.web.UiConfigurationBuilder;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static springfox.documentation.builders.PathSelectors.any;
import static springfox.documentation.builders.RequestHandlerSelectors.basePackage;

@Configuration
@EnableSwagger2
@Import(BeanValidatorPluginsConfiguration.class)
public class SwaggerConfiguration {

    /**
     * @return
     */
    @Bean
    public Docket greetingApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .paths(any())
                .apis(basePackage("br.com.adotepets.application.resources"))
                .build()
                .apiInfo(this.metaData());

    }

    /**
     *
     * @return
     */
    @Bean
    public UiConfiguration tryItOutConfig() {
        return UiConfigurationBuilder.builder()
                .supportedSubmitMethods(new String[]{"get"})
                .build();
    }

    /**
     * @return
     */
    private ApiInfo metaData() {
        return new ApiInfoBuilder()
                .title("Adote Pets")
                .description("")
                .version("1.0.0")
                .contact(new Contact("Amanda Morais", "", "amandaalouise@live.com"))
                .build();
    }
}
