<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

<style type="text/css">
body {
background-color: #eee;
}
</style>
</head>
<body class="hold-transition login-page">

<div class="login-box">
	<div class="login-logo">
		<b>Sistema </b> Isac
	</div>
	<div class="login-box-body">
		<p class="login-box-msg">Faça seu login para começar sua sessão</p>
		<form method="post" action='<c:url value="/login/logar"/>'>
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="user" placeholder="Login" autofocus>
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" class="form-control" name="pass" placeholder="Senha">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox icheck">
						<input id="loginCheck" type="checkbox" /> 
						<label>Lembrar-Me</label>
					</div>
				</div>
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
				</div>
			</div>
		</form>
		
		<a href="<c:url value='/login/senha' />" >Esqueci minha senha</a><br>
		
		<br>
		<c:if test="${var == 'N' }">
			Usuário ou senha inválidos 
		</c:if>
		
		<c:if test="${var == 'D' }">
			Deslogado com sucesso 
		</c:if>
	</div>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>