package br.com.adotepets.application.components;

import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

public abstract class Regras {

    public static final String ADMINISTRADOR = "administrador";
    public static final String CADASTRAR = "cadastrar";
    public static final String EDITAR = "editar";
    public static final String EXCLUIR = "excluir";
    public static final String VISUALIZAR = "visualizar";

    /**
     * Lista todas as regras definida nesta classe
     *
     * @return um {@link Set} com todas as regras de acesso
     */
    public static Set<String> listarRegras() {

        final Set<String> regras = new HashSet<>();

        for (Field field : Regras.class.getDeclaredFields()) {
            regras.add(String.valueOf(ReflectionUtils.getField(field, Regras.class)));
        }

        return regras;
    }
}
