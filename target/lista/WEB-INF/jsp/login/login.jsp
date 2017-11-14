<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/login.css' />" />

</head>
<body>

<div class="container">
	<form class="form-signin" method="post" action='<c:url value="/logar"/>'>
		<h2 class="form-signin-heading">Bem vindo!</h2>
		<label for="inputEmail" class="sr-only">Usu�rio</label>
		<input type="text" name="user" id="inputEmail" class="form-control" placeholder="Usu�rio" required autofocus>
		<label for="inputPassword" class="sr-only">Senha</label>
		<input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Senha" required>
		<div class="checkbox">
			<label>
				<input type="checkbox" value="remember-me"> Lembrar-me
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
	
	<c:if test="${var == 'N' }">
		<br>
		<div>
			 Usu�rio ou senha inv�lidos 
		</div>
		<div>
			<a href="senha"> Lembrar a senha! </a>
		</div>
	</c:if>
	</form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>