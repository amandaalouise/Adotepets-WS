package br.com.adotepets.infrastructure.spring.initializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Profile;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.AnnotationAwareOrderComparator;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;

@Service
@Profile("alpha")
public class ApplicationInitializer {

    private final Logger logger = LoggerFactory.getLogger(ApplicationInitializer.class);

    private List<InitialTask> tasks;

    /**
     * Construtor
     *
     * @param tasks a lista de {@link InitialTask} para execucao
     */
    public ApplicationInitializer(List<InitialTask> tasks) {
        this.tasks = tasks;
    }

    /**
     * Faz a ordenacao das tasks para que elas sejam executadas de maneira correta
     */
    @PostConstruct
    public void orderTasks() {
        this.tasks.sort(AnnotationAwareOrderComparator.INSTANCE);
        this.logger.info("Ordenando tarefas a serem executadas");
    }

    /**
     * {@inheritDoc}
     *
     * @param event
     */
    @EventListener
    public void onApplicationStart(ContextRefreshedEvent event) {
        this.logger.info("Executando tarefas de inicializacao");
        this.tasks.forEach(InitialTask::perform);
        this.logger.info("{} tarefas de inicializacao executas! Aplicacao inicializada...", this.tasks.size());
    }
}