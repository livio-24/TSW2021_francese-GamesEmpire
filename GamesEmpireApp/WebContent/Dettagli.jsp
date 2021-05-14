<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%@ include file="./fragments/header.jsp" %>
	<%@ include file="./fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	
	<%
		ProdottoBean product = (ProdottoBean) request.getAttribute("product");
	
		if (product != null) {
	%>
	<table >
		<tr>
			<td><img src="<%=product.getImmagine()%>" height="200" width="200"> <br><br>
				 <a href="carrello?action=addC&id=<%=product.getIdProdotto()%>"><button>Aggiungi al carrello</button></a></td>
			<td>
				<ul id="listDettagli">	
					<li><span class="dettagli"><%=product.getNome()%></span></li>
					<li><span class="dettagli">Genere</span>: <%=product.getGenere()%></li>
					<li><span class="dettagli">Piattaforma</span>: <%=product.getPiattaforma()%></li>
					<li><span class="dettagli">Prezzo</span>: &euro;<%=product.getPrezzo()%></li>
					<li><span class="dettagli">Disponibile dal</span>: <%=product.getDataUscita()%></li>
					<% if(product.isInVendita()) {%>
						<li><span class="dettagli">Disponibilità Immediata</span></li>
					<%}else{ %>
						<li><span class="dettagli">Non disponibile</span></li>
					<%} %>
				</ul>
			</td>
		</tr>
		
	</table>
	<% } %>

	<br>
	
	</div>
			<%@ include file="./fragments/footer.jsp" %>
	
</body>
</html>