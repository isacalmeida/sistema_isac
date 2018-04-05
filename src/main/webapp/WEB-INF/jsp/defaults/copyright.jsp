<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Copyright </title>

</head>
<body>

<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Versão</b> <c:out value="${versao_sistema }" /> -
		<b>Licenciado a: </b><c:out value="${licenciamento }" />
	</div>
	<strong>Copyright &copy; 2018 <a href="">Isac Sistemas</a>.</strong>
	Todos direitos reservados.
</footer>

</body>
</html>