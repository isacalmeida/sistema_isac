<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Editar </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" 	href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
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
				<li class="active"><a href="<c:url value='/menu/configuracoes'/>"> Configurações <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Programas </h3>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/programas'/>"> Programas </a></li>
				<li class="active"> Editar </li>
			</ol>
			<div class="row">
				<div class="tab-pane">
					<form role="form" method="post" action='<c:url value="/programas/salvar"/>'>
						<fieldset>
							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-6">
										<label for="campoCriacao">Criado em:</label>
										<input type="datetime" id="campoCriacao" class="form-control" value="${programa.criacao }" disabled>
									</div>
									<div class="col-lg-6">
										<label for="campoAlteracao">Última alteração em:</label>
										<input type="datetime" id="campoAlteracao" class="form-control" value="${programa.alteracao }" disabled>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoCodigo">Codigo</label>
									<input type="text" class="form-control" id="campoCodigo" value="${programa.codigo}" disabled>
									<input type="hidden" name="programa.codigo" value="${programa.codigo}">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoDescricao">Descricao</label>
									<input type="text" class="form-control" id="campoDescricao" value="${programa.descricao}" name="programa.descricao">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoEndereco">Endereço</label>
									<input type="text" class="form-control" id="campoEndereco" value="${programa.endereco}" name="programa.endereco">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-12">
									<label for="campoGrupo">Grupo</label>
									<select id="campoGrupo" name="programa.grupo" class="form-control">
										<c:choose>
											<c:when test="${programa.grupo == 1}">
												<option value="1" selected="selected">Geral</option>
												<option value="2">Pessoa</option>
												<option value="3">Produto</option>
											</c:when>
											<c:when test="${programa.grupo == 2}">
												<option value="1">Geral</option>
												<option value="2" selected="selected">Pessoa</option>
												<option value="3">Produto</option>
											</c:when>
											<c:when test="${programa.grupo == 3}">
												<option value="1">Geral</option>
												<option value="2">Pessoa</option>
												<option value="3" selected="selected">Produto</option>
											</c:when>
										</c:choose>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-2">
									<label for="campoAtivo">Ativo</label>
									<select id="campoAtivo" name="programa.ativo" class="form-control" >
										<c:choose>
											<c:when test="${programa.ativo == true }">
												<option value="true" selected="selected">Sim</option>
												<option value="false">Não</option>
											</c:when>
											<c:when test="${programa.ativo == false }">
												<option value="true">Sim</option>
												<option value="false" selected="selected">Não</option>
											</c:when>
										</c:choose>
									</select>
								</div>
							</div>
							<div class="box-actions">
								<c:if test="${editar != 1 }">
									<button type="submit" class="btn btn-success">Salvar</button>
								</c:if>
								<a href="<c:url value='/programas'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
								<c:if test="${excluir != 1 }">
									<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm"> Excluir </button>
								</c:if>
							</div>
							<div class="modal fade" id="confirm" role="dialog">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-body">
											<p> Tem certeza que deseja excluir? </p>
										</div>
										<div class="modal-footer">
											<button type="button" data-dismiss="modal" class="btn btn-default"> Voltar </button>
											<a href="<c:url value='/programas/${programa.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete"> Confirmar </button></a>
										</div>
									</div>							
								</div>
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