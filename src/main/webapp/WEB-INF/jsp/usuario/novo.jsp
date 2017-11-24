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
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/select/dist/css/bootstrap-select.min.css' />" />

<style type="text/css">
.btn-default.btn-on.active{background-color: #5BB75B;color: white;}
.btn-default.btn-off.active{background-color: #DA4F49;color: white;}
</style>

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
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Usuarios </h3><hr>
			<c:choose>
				<c:when test="${permissao != 1}">
					<ol class="breadcrumb">
						<li><a href="<c:url value='/usuario'/>"> Usuarios </a></li>
						<li class="active"> Novo </li>
					</ol>
					<form role="form" method="post" action='<c:url value="/usuario/salvar"/>'>
						<fieldset>	
							<div class="col-lg-12">
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoCodigo">Codigo</label>
										<input type="text" class="form-control" id="campoCodigo" disabled>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoLogin">Login</label>
										<input type="text" class="form-control" id="campoLogin" name="usuario.usuario">
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoSenha">Senha</label>
										<input type="password" class="form-control" id="campoSenha" name="usuario.senha">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-12">
										<label for="campoPessoa">Pessoa</label>
									</div>
									<div class="col-lg-12">
										<select id="campoPessoa" class="selectpicker form-control" data-live-search="true" data-size="5" name="usuario.pessoa.codigo" >
											<c:forEach var="p" items="${pessoas }">
												<option value="${p.codigo  }">${p.nome }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoPerfil">Perfil de Acesso</label>
										<select id="campoPerfil" class="selectpicker form-control" name="usuario.perfil.codigo">
											<c:forEach var="pa" items="${perfis }">
												<option value="${pa.codigo }">${pa.descricao}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-12">
										<label for="campoAtivo">Ativo</label>
									</div>
									<div id="campoAtivo" class="col-lg-12">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default btn-on active">
											<input type="radio" value="true" name="usuario.ativo" checked="checked">Sim</label>
											<label class="btn btn-default btn-off">
											<input type="radio" value="false" name="usuario.ativo">Não</label>
										</div>
									</div>
								</div>
								<div class="box-actions">
									<br>
									<button type="submit" class="btn btn-success">Salvar</button>
									<a href="<c:url value='/usuario'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
									<br>
									<br>
									<br>
								</div>
							</div>
						</fieldset>
					</form>
				</c:when>
				<c:otherwise>
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       				<strong>Ops!</strong> Sem permissão para visualizar o programa.
	      			</div>
				</c:otherwise>
			</c:choose>
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