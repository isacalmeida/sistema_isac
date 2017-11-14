<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/dashboard.css' />" />

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/menu'/>" >Trabalho Isac</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/'/>">Sair</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li>
					<form class="navbar-form" method="GET" action="<c:url value='/menu'/>" >
						<input type="text" class="form-control" placeholder="Pesquisar ...">
					</form>
				</li>
				<li><a href="<c:url value='/menu'/>"> Inicio </a></li>
				<li class="active"><a href="<c:url value='/menu/cadastros'/>"> Cadastros <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h3 class="page-header"><span class="glyphicon glyphicon-chevron-right"></span> Pessoas </h3>
			<c:choose>
				<c:when test="${var == 0}">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       				<strong>Ops!</strong> Algum erro ocorreu.
	      			</div>
				</c:when>
				<c:when test="${var == 2}">
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        			<strong>Sucesso!</strong> Cadastro efetuado.
	      			</div>
				</c:when>
			</c:choose>
			<div class="row">
				<div class="box-actions">
					<a href="<c:url value='/pessoa/novo'/>" ><button type="button" class="btn btn-primary"> Novo </button></a>
					<a href="<c:url value='/menu/cadastros'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
				</div>
			</div>
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Data de Cadastro</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${pessoas }">
							<tr>
								<td>${p.codigo }</td>
								<td>${p.nome }</td>
								<td>${p.data }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>