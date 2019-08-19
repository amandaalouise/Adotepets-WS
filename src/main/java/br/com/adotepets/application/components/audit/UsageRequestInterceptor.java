package br.com.adotepets.application.components.audit;

import br.com.adotepets.domain.model.entities.auditoria.Operacao;
import br.com.adotepets.domain.model.entities.auditoria.RegistroUso;
import br.com.adotepets.domain.repositories.auditoria.RegistroUsoRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class UsageRequestInterceptor extends HandlerInterceptorAdapter {

    private RegistroUsoRepository registroUsoRepository;

    /**
     *
     * @param registroUsoRepository
     */
    public UsageRequestInterceptor(RegistroUsoRepository registroUsoRepository) {
        this.registroUsoRepository = registroUsoRepository;
    }

    /**
     * {@inheritDoc}
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        final Operacao operacao = Operacao.parse(request.getMethod());

        this.registroUsoRepository.findByOperacao(operacao)
                .ifPresentOrElse(
                        registro -> this.registroUsoRepository.save(registro.atualizar()),
                        () -> this.registroUsoRepository.save(new RegistroUso(operacao, request.getMethod())));

        return true;
    }
}
