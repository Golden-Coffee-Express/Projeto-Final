/**
 * Validar campos obrigatorios
 * 
 * @guilherme gomes da silva
 */

function validar() {
	let item = frmItem.item.value
	let distribuidora = frmItem.distribuidora.value
	let quantidade = frmItem.quantidade.value
	if (item === "") {
		alert('Preencha o campo item')
		frmItem.item.focus()
		return false
	} else if (distribuidora === "") {
		alert('Preencha o campo distribuidora')
		frmItem.distribuidora.focus()
		return false
	}
	else if (quantidade === "") {
		alert('Preencha o campo quantidade')
		frmItem.quantidade.focus()
		return false
	} else {
		document.forms["frmItem"].submit()
	}
}