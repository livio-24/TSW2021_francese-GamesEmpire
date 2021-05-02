<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
<link href="css/Style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<% 	Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		if(cart != null){%>
		<h2>Carrello</h2>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Quantità</th>
			<th>Prezzo totale</th>
			<th>Azione</th>
		</tr>
		<% 
			ArrayList<ItemCarrello> prodcart = cart.getProdotti(); 	
		   for(ItemCarrello itemcart: prodcart){
		%>
		<tr>
			<td><%=itemcart.getProdotto().getNome()%></td>
			<td> <a href="carrello?action=rimuoviUnita&id=<%=itemcart.getId()%>"><button> - </button></a> <%=itemcart.getQuantitàCarrello()%> <a href="carrello?action=aggiungiUnita&id=<%=itemcart.getId()%>"><button> + </button></a>
			</td>
			<td><%=itemcart.getTotalPrice() %></td>
			<td><a href="carrello?action=deleteC&id=<%=itemcart.getId()%>">Elimina dal carrello</a></td>
		</tr>
		<% } %>
	</table><br>	
	Totale provvisorio: <%=cart.calcolaCosto()%> &euro; 
	<%}else{%> 
		<h2>Carrello vuoto</h2>
		<%} %>
				
		<br><br>
		<div class="center">
			<a href="carrello?action=checkout"> <button>Checkout</button> </a>
		</div>
</body>
</html>