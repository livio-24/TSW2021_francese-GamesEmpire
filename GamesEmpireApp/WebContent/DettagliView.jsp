<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli</title>
<link href="css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<h2>Dettagli</h2>
	<%
		ProdottoBean product = (ProdottoBean) request.getAttribute("product");
	
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Azione</th>
		</tr>
		<tr>
			<td><%=product.getIdProdotto()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getQuantità()%></td>
			<td> <a href="dettagli?action=addC&id=<%=product.getIdProdotto()%>">Aggiungi al carrello</a></td>
		</tr>
	</table>
	<% } %>

	<br>
	
	<div class="center">
		<a href="CarrelloView.jsp"> <img  src="images/carrello.jpg" alt="carrello" width="50" height="50" ></img> </a>
	</div>
</body>
</html>