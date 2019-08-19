package br.com.adotepets.infrastructure.spring.config;

import br.com.adotepets.domain.services.AutenticacaoService;
import br.com.adotepets.application.components.Regras;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AutenticacaoService autenticacaoService;

    /**
     * {@inheritDoc}
     *
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    /**
     * {@inheritDoc}
     *
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.autenticacaoService).passwordEncoder(this.passwordEncoder);
    }

    /**
     * {@inheritDoc}
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf()
                .disable()
                .authorizeRequests()
                    .antMatchers("/actuator/health")
                        .permitAll()
                    .antMatchers("/actuator/**")
                        .hasAnyAuthority(Regras.ADMINISTRADOR)
                    .antMatchers("/usuarios/**")
                        .hasAnyAuthority(Regras.ADMINISTRADOR)
                    .antMatchers("/swagger/**")
                        .hasAnyAuthority(Regras.VISUALIZAR, Regras.ADMINISTRADOR)
                    .antMatchers(HttpMethod.DELETE, "/api/**")
                        .hasAnyAuthority(Regras.EXCLUIR, Regras.ADMINISTRADOR)
                    .antMatchers(HttpMethod.POST, "/api/**")
                        .hasAnyAuthority(Regras.CADASTRAR, Regras.ADMINISTRADOR)
                    .antMatchers(HttpMethod.PUT, "/api/**")
                        .hasAnyAuthority(Regras.EDITAR, Regras.ADMINISTRADOR)
                    .antMatchers(HttpMethod.GET, "/api/**")
                        .hasAnyAuthority(Regras.VISUALIZAR, Regras.ADMINISTRADOR)
                    .antMatchers("/resources/**")
                        .permitAll()
                    .antMatchers("/**")
                        .authenticated()
                .and()
                    .httpBasic();
    }
}