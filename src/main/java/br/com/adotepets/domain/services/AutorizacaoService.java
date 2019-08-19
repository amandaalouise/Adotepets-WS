package br.com.adotepets.domain.services;

import br.com.adotepets.domain.model.entities.seguranca.Autorizacao;
import br.com.adotepets.domain.model.entities.seguranca.Permissao;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.AutorizacaoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class AutorizacaoService {

    private AutorizacaoRepository autorizacaoRepository;

    /**
     *
     * @param autorizacaoRepository
     */
    public AutorizacaoService(AutorizacaoRepository autorizacaoRepository) {
        this.autorizacaoRepository = autorizacaoRepository;
    }

    /**
     * @param usuario
     * @param permissoes
     */
    @Transactional
    public void autorizar(Usuario usuario, Permissao... permissoes) {
        this.autorizar(usuario, List.of(permissoes));
    }

    /**
     * @param usuario
     * @param permissoes
     */
    @Transactional
    public void autorizar(Usuario usuario, List<Permissao> permissoes) {
        permissoes.forEach(permissao -> this.autorizacaoRepository.save(new Autorizacao(usuario, permissao)));
    }
}
