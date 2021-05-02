<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="it.unisa.model.ProdottoBean, java.util.*"%>

<%
	ArrayList<?> products = (ArrayList<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./catalogo");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/Style.css" rel="stylesheet" type="text/css">
	<title>Catalogo</title>
</head>

<body>
	<h2>Catalogo</h2>
	<table border="1">
		<tr>
			<th>ID <a href="catalogo?sort=idProdotto">Ordina</a></th>
			<th>Nome <a href="catalogo?sort=nome">Ordina</a></th>
			<th>Descrizione<a href="catalogo?sort=descrizione">Ordina</a></th>
			<th>Azione</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProdottoBean bean = (ProdottoBean) it.next();
		%>
		<tr>
			<td><%=bean.getIdProdotto()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td>
				<a href="dettagli?id=<%=bean.getIdProdotto()%>" target="_parent">Dettagli</a><br>
				<a href="carrello?action=addC&id=<%=bean.getIdProdotto()%>">Aggiungi al carrello</a>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
		
	<div class="center">
		<a href="CarrelloView.jsp"> <img src="images/carrello.jpg" alt="carrello" width="50" height="50" ></img> </a>
	</div>
	
</body>
</html>