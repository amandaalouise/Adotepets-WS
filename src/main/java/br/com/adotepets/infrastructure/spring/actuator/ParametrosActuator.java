package br.com.adotepets.infrastructure.spring.actuator;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Endpoint(id = "parametros")
public class ParametrosActuator {

    @Value("${adotepets_db_host:nao-definido}")
    private String dbHost;
    @Value("${adotepets_db_port:nao-definido}")
    private String dbPorta;
    @Value("${adotepets_db_name:nao-definido}")
    private String dbNome;
    @Value("${adotepets_db_user:nao-definido}")
    private String dbUsuario;
    @Value("${adotepets_log_path:nao-definido}")
    private String logPath;

    /**
     *
     * @return
     */
    @ReadOperation
    public Map<String, String> lerParametros() {
        return Map.of(
                "adotepets_db_host", this.dbHost,
                "adotepets_db_port", this.dbPorta,
                "adotepets_db_name", this.dbNome,
                "adotepets_db_user", this.dbUsuario,
                "adotepets_log_path", this.logPath);
    }
}
