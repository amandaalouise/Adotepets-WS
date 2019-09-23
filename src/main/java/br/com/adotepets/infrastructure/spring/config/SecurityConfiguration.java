package br.com.adotepets.infrastructure.spring.config;

import br.com.adotepets.domain.services.AutenticacaoService;
import br.com.adotepets.application.components.Regras;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import java.util.Arrays;

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
        web.ignoring().antMatchers("/resources/**", "/api/arquivo**");
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("authorization", "content-type", "x-auth-token"));
        configuration.setExposedHeaders(Arrays.asList("x-auth-token"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
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
        http.cors();
        http.csrf()
                .disable()
                .authorizeRequests()
                .antMatchers("/actuator/health")
                .permitAll()
                .antMatchers("/actuator/**")
                .hasAnyAuthority(Regras.ADMINISTRADOR)
                .antMatchers("/swagger/**")
                .hasAnyAuthority(Regras.EXCLUIR, Regras.ADMINISTRADOR)
                .antMatchers(HttpMethod.POST, "/api/usuario/upload*")
                .permitAll()
                .antMatchers(HttpMethod.GET, "/api/doacao/*")
                .permitAll()
                .antMatchers(HttpMethod.GET, "/api/perdido/*")
                .permitAll()
                .antMatchers(HttpMethod.GET, "/api/encontrado/*")
                .permitAll()
                .antMatchers(HttpMethod.POST, "/api/usuario")
                .permitAll()
                .antMatchers(HttpMethod.POST, "/api/usuario/autenticar")
                .permitAll()
                .antMatchers(HttpMethod.POST, "/api/prestador/upload*")
                .permitAll()
                .antMatchers(HttpMethod.GET, "/api/arquivo/**")
                .permitAll()
                .antMatchers("/resources/**")
                .permitAll()
                .antMatchers("/**")
                .authenticated()
                .and()
                .httpBasic();
    }
}