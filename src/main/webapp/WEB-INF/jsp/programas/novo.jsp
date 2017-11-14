<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Novo </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

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
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <span><c:out value="${usuario_nome } " /></span> <span class="glyphicon glyphicon-user"></span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/login/sair'/>">Sair</a></li>
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
				<li><a href="<c:url value='/menu/cadastros'/>"> Cadastros </a></li>
				<li class="active"><a href="<c:url value='/menu/configuracoes'/>"> Configura��es <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h3 class="page-header"><span class="glyphicon glyphicon-chevron-right"></span> Pessoas </h3>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/programas'/>"> Programas </a></li>
				<li class="active"> Novo </li>
			</ol>
			<div class="row">
				<div class="tab-pane">
					<form role="form" method="post" action='<c:url value="/programas/salvar"/>'>
						<fieldset>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoPrograma">Programa</label>
									<input type="text" class="form-control" id="campoPrograma" name="programa" placeholder="Informe o programa">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoCaminho">Caminho</label>
									<input type="text" class="form-control" id="campoCaminho" name="endereco" placeholder="Informe o caminho">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label for="campoAtivo">Ativo</label>
									<select id="campoAtivo" name="ativo" class="form-control" >
										<option value="true" selected="selected">Sim</option>
										<option value="false">N�o</option>
									</select>
								</div>
							</div>
							<div class="box-actions">
								<button type="submit" class="btn btn-success">Salvar</button>
								<a href="<c:url value='/programa'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
							</div>
						</fieldset>
					</form>
				</div>
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