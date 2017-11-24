<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Editar </title>

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
			<ol class="breadcrumb">
				<li><a href="<c:url value='/produto'/>"> Produtos </a></li>
				<li class="active"> Editar </li>
			</ol>
			<form id="formPessoa" role="form" method="post" action='<c:url value="/produto/salvar"/>'>
				<fieldset>
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3">
								<div class="col-lg-1"></div>
								<div class="col-lg-9">
									<img class="img-thumbnail" id="imagemProduto" src="<c:url value='${produto.imagem }' />">
									<input type="text" name="produto.imagem" value="${produto.imagem }" hidden="hidden"></div>
								<div class="col-lg-2"></div>
							</div>
							<div class="form-group col-lg-6">
								<div class="row">
									<label for="campoImagem">Imagem</label>
									<input id="campoImagem" class="form-control" type="file" data-max-size="10485760">
								</div>
								<br>
								<div class="row">
									<label for="campoCodigo">Codigo</label>
									<input type="text" id="campoCodigo" class="form-control" value="${produto.codigo}" disabled>
									<input type="hidden" name="produto.codigo" value="${produto.codigo}">
								</div>
							</div>
							<div class="col-lg-3">
								<div class="col-lg-11">
									<div class="row">
										<label for="campoCriacao">Criado em:</label>
										<input type="datetime" id="campoCriacao" class="form-control" value="${produto.criacao }" disabled>
										</div>
									<br>
									<div class="row">
										<label for="campoAlteracao">Última alteração em:</label>
										<input type="datetime" id="campoAlteracao" class="form-control" value="${produto.alteracao }" disabled>
									</div>
								</div>
								<div class="col-lg-1"></div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="form-group col-lg-12">
								<label for="campoDescricao">Descrição*</label>
								<input value="${produto.descricao }" id="campoDescricao" class="form-control" name="produto.descricao" required>
							</div>
						</div>
						<div class="row" >
							<div class="form-group col-lg-12">
								<label for="campoCodigoBarras">Codigo de Barras</label>
								<input value="${produto.codigo_barras }"type="text" id="campoCodigoBarras" class="form-control" name="produto.codigo_barras">
							</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-12">
								<label for="campoDepartamento">Departamento*</label>
								<select id="campoDepartamento" class="selectpicker form-control" data-live-search="true" data-size="auto" name="produto.departamento.codigo" required>
									<option value="" selected>Selecione</option>
									<c:forEach var="d" items="${departamentos }">
										<option value="${d.codigo }" <c:if test="${produto.departamento.codigo == d.codigo }">selected="selected"</c:if>>${d.descricao }</option>
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
										<option value="${f.codigo }" <c:if test="${produto.fornecedor.codigo == f.codigo }">selected="selected"</c:if>>
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
										<option value="${c.codigo  }"
											<c:forEach var="co" items="${produto.cor }">
												<c:if test="${c.codigo == co.codigo }">selected="selected"</c:if>
											</c:forEach>
										>${c.descricao }</option>
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
									<c:choose>
										<c:when test="${produto.ativo == true }">
											<label class="btn btn-default btn-on active">
											<input type="radio" value="true" name="produto.ativo" checked="checked">Sim</label>
											<label class="btn btn-default btn-off">
											<input type="radio" value="false" name="produto.ativo">Não</label>
										</c:when>
										<c:when test="${produto.ativo == false }">
											<label class="btn btn-default btn-on">
											<input type="radio" value="true" name="produto.ativo" >Sim</label>
											<label class="btn btn-default btn-off active">
											<input type="radio" value="false" name="produto.ativo" checked="checked">Não</label>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="box-actions">
							<br>
							<c:if test="${editar != 1 }">
								<button type="submit" class="btn btn-success">Salvar</button>
							</c:if>
							<a href="<c:url value='/produto'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
							<c:if test="${excluir != 1 }">
								<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm"> Excluir </button>
							</c:if>
							<br>
							<br>
						</div>
						<div class="modal fade" id="confirm" role="dialog">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<div class="modal-body">
										<p> Tem certeza que deseja excluir? </p>
									</div>
									<div class="modal-footer">
										<button type="button" data-dismiss="modal" class="btn btn-default"> Voltar </button>
										<a href="<c:url value='/produto/${produto.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete"> Confirmar </button></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
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