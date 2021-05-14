<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Dettagli ordine</title>
</head>
<body>
	<%@ include file="./fragments/header.jsp" %>
	<%@ include file="./fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	
		<%ArrayList<ComposizioneBean> composizione = (ArrayList<ComposizioneBean>) request.getSession().getAttribute("composizione");
			ArrayList<ProdottoBean> prodotti = (ArrayList<ProdottoBean>) request.getSession().getAttribute("products");
	
		if(composizione!=null){
		%>
		
		<table class = "ordini">
		<tr>
			<th>Id ordine</th>
			<th>Prodotto</th>
			<th>Quantità</th>
			<th>Prezzo Unitario</th>
			<th>Prezzo totale</th>
			<th>Iva</th>
		</tr>
		<%	String nomeP = null;
			double prezzoUnitario = 0;
		   for(ComposizioneBean comp : composizione){ 
			   for(ProdottoBean p: prodotti){
				   if(p.getIdProdotto()==comp.getIdProdotto()){
					   nomeP = p.getNome();
					   prezzoUnitario = p.getPrezzo();
				   }
			   }
		%>
		
		<tr>
			<td> <%= comp.getIdOrdine() %></td>
			<td> <%= nomeP%></td>
			<td> <%= comp.getQuantità()%></td>
			<td> &euro;<%= prezzoUnitario%></td>
			<td>  &euro;<%= comp.getPrezzoTotale()%></td>
			<td> <%= comp.getIva()%></td>
		</tr>
		
		<%}} %>
		</table>
	</div>
	
	<%@ include file="./fragments/footer.jsp" %>
</body>
</html>