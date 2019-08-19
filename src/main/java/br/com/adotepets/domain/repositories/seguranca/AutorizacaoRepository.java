package br.com.adotepets.domain.repositories.seguranca;

import br.com.adotepets.domain.model.entities.seguranca.Autorizacao;
import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.DefaultRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AutorizacaoRepository extends DefaultRepository<Autorizacao> { }