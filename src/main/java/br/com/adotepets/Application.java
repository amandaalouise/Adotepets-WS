package br.com.adotepets;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = {
        "br.com.adotepets.domain.model.entities"
})
@SpringBootApplication(scanBasePackages = {
        "br.com.adotepets.application",
        "br.com.adotepets.domain.services",
        "br.com.adotepets.infrastructure.spring"
})
public class Application {

    /**
     * Start the application
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}