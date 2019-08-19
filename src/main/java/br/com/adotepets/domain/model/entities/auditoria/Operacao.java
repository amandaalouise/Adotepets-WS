package br.com.adotepets.domain.model.entities.auditoria;

import lombok.Getter;

public enum Operacao {

    LEITURA("Leitura"),
    ESCRITA("Escrita"),
    ATUALIZACAO("Atualização"),
    EXCLUSAO("Exclusão"),
    OTHER("Outros");

    @Getter
    private String descricao;

    /**
     *
     * @param descricao
     */
    Operacao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * {@inheritDoc}
     *
     * @return
     */
    @Override
    public String toString() {
        return this.descricao;
    }

    /**
     * Faz o parse do tipo de request para um objeto deste enum
     *
     * @param method o metodo http em formato {@link String} (POST, PUT...)
     * @return a Operacao correspondente
     */
    public static Operacao parse(String method) {
        switch (method) {
            case "GET": return LEITURA;
            case "POST": return ESCRITA;
            case "PUT": return ATUALIZACAO;
            case "DELETE": return EXCLUSAO;
            default: return OTHER;
        }
    }
}
