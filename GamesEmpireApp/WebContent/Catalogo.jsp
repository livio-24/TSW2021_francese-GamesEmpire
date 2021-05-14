<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="it.unisa.model.ProdottoBean, java.util.*"%>

<%
	ArrayList<?> products = (ArrayList<?>) request.getSession().getAttribute("products");
	if(products == null) {
		response.sendRedirect("./catalogo");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<title>Catalogo</title>
</head>

<body>

	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	<div id="main" class="clear">
	
	<table>
		<tr>
		
			<th>Nome</th>
			<th>Descrizione</th>
			<th></th>
		
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProdottoBean bean = (ProdottoBean) it.next();
		%>
		<tr>
		
			<td><%=bean.getNome()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td><img src="<%=bean.getImmagine()%>" height="100" width="100"><br>
			<a href="dettagli?id=<%=bean.getIdProdotto()%>"><button>Dettagli</button></a> <a href="carrello?action=addC&id=<%=bean.getIdProdotto()%>"><button>Aggiungi al carrello</button></a></td>
			
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
	
	
	</div>
	
		<%@ include file="./fragments/footer.jsp" %>
	
</body>
</html>