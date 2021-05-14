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



<div class="login">
	<h2>Registrazione</h2>
	<form action="Registrazione" method="post">
	
		<%if(request.getParameter("action")!=null){ %>
		<p class="error"> Email o username già utilizzati</p> <%} %>
		
		Nome:<input type="text" name="nome"/><br><br>	
		Cognome:<input type="text" name="cognome"/><br><br>
		Email:<input type="email" name="email"/><br><br>	
		Data nascita:<input type="date" name="nascita"/><br><br>
		Username:<input type="text" name="un"/><br><br>	
		Password:<input type="password" name="pw"/><br><br>
		
		<input type="submit" value="Registrati">			
		
	</form>
	</div>
</body>
</html>