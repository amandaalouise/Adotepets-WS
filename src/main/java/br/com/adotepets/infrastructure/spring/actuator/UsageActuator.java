package br.com.adotepets.infrastructure.spring.actuator;

import br.com.adotepets.domain.model.entities.auditoria.RegistroUso;
import br.com.adotepets.domain.repositories.auditoria.RegistroUsoRepository;
import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
@Endpoint(id = "uso")
public class UsageActuator {

    private RegistroUsoRepository registroUsoRepository;

    /**
     *
     * @param registroUsoRepository
     */
    public UsageActuator(RegistroUsoRepository registroUsoRepository) {
        this.registroUsoRepository = registroUsoRepository;
    }

    /**
     *
     * @return
     */
    @ReadOperation
    public List<RegistroUso> lerRegistroUso() {
        return this.registroUsoRepository.findAll();
    }
}