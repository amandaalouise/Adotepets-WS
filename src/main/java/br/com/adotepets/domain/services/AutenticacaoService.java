package br.com.adotepets.domain.services;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(readOnly = true)
public class AutenticacaoService implements UserDetailsService {

    private UsuarioRepository usuarioRepository;

    /**
     * Construtor...
     *
     * @param usuarioRepository repositorio de acesso aos dados do usuario
     */
    public AutenticacaoService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    /**
     * {@inheritDoc}
     *
     * @param nomeUsuario
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String nomeUsuario) throws UsernameNotFoundException {
        return this.usuarioRepository.findByEmail(nomeUsuario)
                .orElseThrow(() -> new UsernameNotFoundException("Não foi possível localizar o usuário"));
    }
}
