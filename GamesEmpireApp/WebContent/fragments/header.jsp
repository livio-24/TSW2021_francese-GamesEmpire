
<div class="header">
	<div class="left-header">
		<h2>Games Empire</h2>
	</div>
	<div class="right-header">
		<nav>
			<ul>
			<%if(request.getSession().getAttribute("currentSessionUser")!=null){ %>
							<li><a href="Logout">Logout</a></li>
			<%}else{ %>
				<li><a href="Login.jsp">Login</a></li>
				<li><a href="Registrazione.jsp">Registrati</a></li><%} %>
				<li><a href="Carrello.jsp">Carrello</a></li>
			</ul>
		</nav>
	</div>
</div>

