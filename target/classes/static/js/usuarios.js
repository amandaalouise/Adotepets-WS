/**
 * Metodo usado para buscar usuarios e atualizar a tabela
 */
function buscarUsuarios() {

    const filtro = $('#inFiltro').val();

    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/usuarios/buscar?filtro=" + filtro,
        dataType: 'html',
        cache: false,
        timeout: 600000,
        success: function (data) {
            console.log(data);
            $('#usuariosTable').replaceWith(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

/**
 * Funcao ajax usada para desativar um usuario
 *
 * @param id do usuario para desativar
 */
function desativar(id) {
    $.ajax({
        type: "PUT",
        contentType: "application/json",
        url: "/usuarios/desativar",
        data: JSON.stringify(id),
        dataType: 'html',
        cache: false,
        timeout: 600000,
        success: function (data) {
            $('#usuariosTable').replaceWith(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

/**
 * Funcao ajax usada para ativar um usuario
 *
 * @param id do usuario a ser ativado
 */
function ativar(id) {
    $.ajax({
        type: "PUT",
        contentType: "application/json",
        url: "/usuarios/ativar",
        data: JSON.stringify(id),
        dataType: 'html',
        cache: false,
        timeout: 600000,
        success: function (data) {
            $('#usuariosTable').replaceWith(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

/**
 * Funcao ajax utilizada para trocar a senha do usuario
 *
 * @param id do usuario que queremos trocar a senha
 */
function trocarSenha(id) {
    $.ajax({
        type: "PUT",
        contentType: "application/json",
        url: "/usuarios/trocarSenha",
        data: JSON.stringify(id),
        dataType: 'html',
        cache: false,
        timeout: 600000,
        success: function (data) {
            $('#campoNovaSenha').replaceWith(data);
            $('#dialogNovaSenha').modal('show');
        },
        error: function (e) {
            console.log(e);
        }
    });
}