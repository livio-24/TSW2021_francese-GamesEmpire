
    
<nav id="menu">
	<ul id="tabs">
		<li><a href="<%= request.getContextPath() %>/Home.jsp">Home</a></li>
		<li><a href="<%= request.getContextPath() %>/Catalogo.jsp">Catalogo</a></li>
		<%if(request.getSession().getAttribute("currentSessionUser")!=null){ %>
		<li><a href="<%= request.getContextPath() %>/Ordine?action=mieiOrdini">Ordini</a></li>
		 <%} %>
	</ul>
</nav>
