package br.com.adotepets.application.controllers;

import br.com.adotepets.domain.model.entities.seguranca.Usuario;
import br.com.adotepets.domain.repositories.seguranca.UsuarioRepository;
import br.com.adotepets.domain.services.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.List;

import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.springframework.http.HttpStatus.OK;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    private UsuarioService usuarioService;

    private UsuarioRepository usuarioRepository;

    /**
     * Construtor...
     *
     * @param usuarioService service de usuarios
     * @param usuarioRepository repositorio de usuarios
     */
    public UsuarioController(UsuarioService usuarioService, UsuarioRepository usuarioRepository) {
        this.usuarioService = usuarioService;
        this.usuarioRepository = usuarioRepository;
    }

    /**
     *
     * @param model
     * @return
     */
    @GetMapping
    public String listar(Model model) {
        model.addAttribute("usuarios", this.usuarioRepository.findAll());
        model.addAttribute("filtro", "");
        return "listar-usuarios";
    }

    /**
     *
     * @param model
     * @return
     */
    @GetMapping("/cadastrar")
    public String cadastrar(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "cadastrar-usuario";
    }

    /**
     *
     * @param filtro
     * @return
     */
    @ResponseStatus(OK)
    @GetMapping("/buscar")
    public String buscar(@RequestParam("filtro") String filtro, Model model) {

        final List<Usuario> usuarios;

        if (isBlank(filtro)) {
            usuarios = this.usuarioRepository.findAll();
        } else {
            usuarios = this.usuarioRepository.findUsuariosPor(filtro);
        }

        model.addAttribute("usuarios", usuarios);

        return "listar-usuarios :: #usuariosTable";
    }

    /**
     *
     * @param usuario
     * @return
     */
    @PostMapping("/cadastrar")
    public String cadastrar(@ModelAttribute @Valid Usuario usuario, Model model) {
        model.addAttribute("usuarios", this.usuarioService.cadastrar(usuario));
        return "redirect:/usuarios";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @ResponseStatus(OK)
    @PutMapping("/desativar")
    public String desativar(@RequestBody @NotNull Long id, Model model) {
        model.addAttribute("usuarios", this.usuarioService.desativar(id));
        return "listar-usuarios :: #usuariosTable";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @ResponseStatus(OK)
    @PutMapping("/ativar")
    public String ativar(@RequestBody @NotNull Long id, Model model) {
        model.addAttribute("usuarios", this.usuarioService.ativar(id));
        return "listar-usuarios :: #usuariosTable";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @ResponseStatus(OK)
    @PutMapping("/trocarSenha")
    public String trocarSenha(@RequestBody @NotNull Long id, Model model) {
        model.addAttribute("novaSenha", this.usuarioService.trocarSenha(id));
        return "listar-usuarios :: #campoNovaSenha";
    }
}
