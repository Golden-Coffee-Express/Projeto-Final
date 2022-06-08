<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%
 @ SuppressWarnings ("unchecked")
	ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>) 
	request.getAttribute("item");


%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Estoque</title>
<link rel="icon" href="imagens/lista.png">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1>Estoque</h1>
	<a href="novo.html" class="Botao1">Novo item </a>
	<a href="report" class="Botao2">Relatorio</a>
	<table id="tabela">
		<thead>
			<tr>
				<th>id</th>
				<th>item</th>
				<th>distribuidora</th>
				<th>quantidade</th>
				<th>opçoes</th> 
			</tr>
		</thead>
		<tbody>
			<%for (int i = 0; i < lista.size(); i++) { %>
				<tr>
					<td><%=lista.get(i).getId() %></td>
					<td><%=lista.get(i).getItem() %></td>
					<td><%=lista.get(i).getDistribuidora() %></td>
					<td><%=lista.get(i).getQuantidade() %></td>
					<td><a href="select?id=<%=lista.get(i).getId()  %>"
class="Botao1">editar</a>
						<a href="javascript: confirmar(<%=lista.get(i).getId() %>)" class="Botao2">excluir</a>
					</td>
				</tr>
			<%} %>
		
		</tbody>
	</table>
	<script src="Scripts/confirmador.js"></script>
</body>
</html>