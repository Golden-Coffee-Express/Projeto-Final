/**
 * Confirmar a exclusao de um contato
 * 
 * @guilherme gomes da silva
 * @param id
 */

function confirmar(id) {
	let resposta = confirm("Confirma a exclusão deste item?")
	if (resposta === true) {
		window.location.href = "delete?id=" + id
	}
}