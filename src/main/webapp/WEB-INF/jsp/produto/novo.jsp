<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
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
				<li class="active"><a href="<c:url value='/menu/cadastros'/>"> Cadastros <span class="sr-only">(current)</span></a></li>
				<li><a href="<c:url value='/menu/configuracoes'/>"> Configurações </a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Produtos </h3><hr>
			<c:choose>
				<c:when test="${permissao != 1}">
					<ol class="breadcrumb">
						<li><a href="<c:url value='/produto'/>"> Produtos </a></li>
						<li class="active"> Novo </li>
					</ol>
					<form id="formPessoa" role="form" method="post" action='<c:url value="/produto/salvar"/>'>
						<fieldset>
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-3">
										<div class="col-lg-1"></div>
										<div class="col-lg-9">
											<img class="img-thumbnail" id="imagemProduto" src="<c:url value="/imagem/produto/imagempadrao.png" />">
										</div>
										<div class="col-lg-2"></div>
									</div>
									<div class="form-group col-lg-6">
										<div class="row">
											<label for="campoImagem">Imagem</label>
											<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" name="produto.imagem">
										</div>
										<br>
										<div class="row">
											<label for="campoCodigo">Codigo</label>
											<input type="text" id="campoCodigo" class="form-control" name="produto.codigo" disabled>
										</div>
									</div>
									<div class="col-lg-3"></div>
								</div>
								<hr>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoDescricao">Descrição*</label>
										<input id="campoDescricao" class="form-control" name="produto.descricao" required>
									</div>
								</div>
								<div class="row" >
									<div class="form-group col-lg-12">
										<label for="campoCodigoBarras">Codigo de Barras</label>
										<input type="text" id="campoCodigoBarras" class="form-control" name="produto.codigo_barras">
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoDepartamento">Departamento*</label>
										<select id="campoDepartamento" class="selectpicker form-control" data-live-search="true" data-size="auto" name="produto.departamento.codigo" required>
											<option value="" selected>Selecione</option>
											<c:forEach var="d" items="${departamentos }">
												<option value="${d.codigo }">${d.descricao }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoFornecedor">Fornecedor*</label>
										<select id="campoFornecedor" class="selectpicker form-control" data-live-search="true" data-size="auto" name="produto.fornecedor.codigo" required>
											<option value="" selected>Selecione</option>
											<c:forEach var="f" items="${fornecedores }">
												<option value="${f.codigo }">
													<c:choose>
														<c:when test="${f.tipo.toString() == 'F' }">			
															${f.nome }
														</c:when>
														<c:when test="${f.tipo.toString() == 'J' }">
															${f.razao }
														</c:when>
													</c:choose>
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<label for="campoCor">Cor*</label>
										<select multiple id="campoCor" class="selectpicker form-control" data-actions-box="true" data-live-search="true" data-size="auto" name="produto.cor.codigo" required>
											<c:forEach var="c" items="${cores }">
												<option value="${c.codigo  }">${c.descricao }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<label for="campoAtivo">Ativo</label>
									</div>
									<div id="campoAtivo" class="col-xs-12 col-sm-8">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default btn-on active">
											<input type="radio" value="true" name="produto.ativo" checked="checked">Sim</label>
											<label class="btn btn-default btn-off">
											<input type="radio" value="false" name="produto.ativo">Não</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="box-actions col-lg-12">
										<br>
										<br>
										<button type="submit" class="btn btn-success">Salvar</button>
										<a href="<c:url value='/produto'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
									</div>
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
<br>
<br>

<%-- jQuery (necessary for Bootstrap's JavaScript plugins) --%>
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<%-- Include all compiled plugins (below), or include individual files as needed --%>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/i18n/defaults-pt_BR.js'/>"></script>

</body>
</html>