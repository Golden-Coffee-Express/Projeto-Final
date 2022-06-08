<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="pt-br">
<meta charset="utf-8">
<title>Editar</title>
<link rel="icon" href="imagens/lista.png">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>editar item</h1>
	<form name="frmItem" action="update">
		<table>
			<tr>
				<td><input type="text" name="id" id="caixa3" readonly
					value="<%out.print(request.getAttribute("id"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="item" class="Caixa1"
					value="<%out.print(request.getAttribute("item"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="distribuidora" class="Caixa1"
					value="<%out.print(request.getAttribute("distribuidora"));%>"></td>
			</tr>
			<tr>
				<td><input type="text" name="quantidade" class="Caixa2"
					value="<%out.print(request.getAttribute("quantidade"));%>"></td>
			</tr>
		</table>
		<input type="button" value="Salvar" class="Botao1" onclick="validar()">
	</form>
	<script src="Scripts/validador.js"></script>
</body>
</html>