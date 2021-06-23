<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Registrazione</title>
</head>
<body>

<script> src="Registrazione.js"></script>

<div class="login">
	<h2>Registrazione</h2>
	<form action="Registrazione" method="post" onsubmit="event.preventDefault(); validate(this)">
	
		<%if(request.getParameter("action")!=null){ %>
		<p class="error"> Email o username già utilizzati</p> <%} %>
		
		Nome:<input type="text" name="nome" placeholder="Mario" onfocus="myFunction(this)" required/><br><br>	
		Cognome:<input type="text" name="cognome" placeholder="Rossi" onfocus="myFunction(this)" required/><br><br>
		Email:<input type="email" name="email" placeholder="MarioRossi@gmail.com" onfocus="myFunction(this)" required/><br><br>	
		Data nascita:<input type="date" name="nascita" placeholder="23/10/1987" onfocus="myFunction(this)" required/><br><br>
		Username:<input type="text" name="un" placeholder="MarioR87" onfocus="myFunction(this)" required/><br><br>	
		Password:<input type="password" name="pw" placeholder="********" onfocus="myFunction(this)" required/><br><br>
		
		<input type="submit" value="Registrati">			
		
	</form>
	</div>
	
</body>
</html>