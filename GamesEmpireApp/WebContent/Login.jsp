<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	
	<title>Login</title>
</head>
<body>
	<div class="login">
	
	<h2>Login</h2>

	<form action="Login">
			<%if(request.getParameter("action")!=null && request.getParameter("action").equalsIgnoreCase("error") ){ %>
				<p class="error">Username o password errati!</p> 
			
			<%}else if(request.getParameter("action")!=null && request.getParameter("action").equalsIgnoreCase("checkout")){ %>
					<input type="hidden" name="checkout"/><br><br>		
				
			<%}%>
			
			Username: 		
			<input type="text" name="un" required placeholder="inserisci username"/><br><br>		
		
			Password: 
			<input type="password" name="pw" required placeholder="inserisci password"/><br><br>
			
			<input type="submit" value="login">			
		
		</form>
	</div>
</body>
</html>
