<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Configurações </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/dashboard.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/select/dist/css/bootstrap-select.min.css' />" />

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
					<div class="navbar-form">
						<select id="campoPesquisa" class="selectpicker form-control" data-live-search="true" data-size="auto" title="Pesquisar..." onchange="location = this.value;">
							<c:forEach var="prog" items="${programas }">
								<option value="/lista${prog.endereco  }">${prog.descricao }</option>
							</c:forEach>
						</select>
					</div>
				</li>
				<li><a href="<c:url value='/menu'/>"> Inicio </a></li>
				<li><a href="<c:url value='/menu/cadastros'/>"> Cadastros </a></li>
				<li class="active"><a href="<c:url value='/menu/configuracoes'/>"> Configurações <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Configurações </h3><hr>
     		<ul class="nav nav-tabs responsive">
				<li class="active"><a data-toggle="tab" href="#pessoa">Pessoa</a></li>
				<li><a data-toggle="tab" href="#produto">Produto</a></li>
				<li><a data-toggle="tab" href="#outros">Outros</a></li>
			</ul>
			<div class="tab-content responsive">
				<br>
				<div id="pessoa" class="tab-pane active">
		     		<div class="row">
						<div class="col-sm-1"></div>
						<a href="<c:url value='/usuario' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Usuario<br><br> </button></a>
						<div class="col-sm-2"></div>
						<a href="<c:url value='/perfil_acesso' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Perfil de Acesso<br><br> </button></a>
						<div class="col-sm-1"></div>
					</div>
				</div>
				<div id="produto" class="tab-pane">
		     		<div class="row">
						<div class="col-sm-1"></div>
						<a href="<c:url value='/cor' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Cor<br><br> </button></a>
						<div class="col-sm-2"></div>
						<a href="<c:url value='/departamento' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Departamento<br><br> </button></a>
						<div class="col-sm-1"></div>
					</div>
		     	</div>
		     	<div id="outros" class="tab-pane">
		     		<div class="row">
		     			<div class="col-sm-1"></div>
		     			<a href="<c:url value='/configuracoes' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Geral<br><br> </button></a>
						<div class="col-sm-2"></div>
						<a href="<c:url value='/programas' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Programas<br><br> </button></a>
						<div class="col-sm-1"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-1"></div>
						<a href="<c:url value='/acessos' />" ><button class="btn btn-success btn-lg col-sm-4"> <br>Acessos<br><br> </button></a>
						<div class="col-sm-2"></div>
						<div class="col-sm-4"></div>
						<div class="col-sm-1"></div>
					</div>
		     	</div>
			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/i18n/defaults-pt_BR.js'/>"></script>

</body>
</html>