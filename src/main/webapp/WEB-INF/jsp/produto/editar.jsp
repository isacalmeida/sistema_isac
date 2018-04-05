<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

</head>

<body class="hold-transition skin-blue sidebar-mini" <c:if test="${var == 2 }" >onload="toastSuccess()"</c:if><c:if test="${var == 0 }" >onload="toastDanger()"</c:if> >

<div class="wrapper">
	<jsp:include page="../defaults/main.jsp"></jsp:include>
	
	<jsp:include page="../defaults/menu.jsp"></jsp:include>
	
	<div class="content-wrapper">
		<section class="content-header">
			<h1>
				Produto
				<small>Cadastro de produtos</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/cadastros' />" >Cadastros</a></li>
				<li><a href="<c:url value='/produto' />" >Produto</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/produto/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${produto.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">Última alteração em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${produto.alteracao }" disabled>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">	
								<img class="img-thumbnail" id="imagemProduto" src="<c:url value='${produto.imagem }' />">
								<input type="text" name="produto.imagem" value="${produto.imagem }" hidden="hidden">
							</div>
							<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
								<label for="campoImagem">Imagem</label>
								<input id="campoImagem" class="form-control" type="file" data-max-size="10485760">
							</div>
							<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
								<label for="campoCodigo">Codigo</label>
								<input type="text" id="campoCodigo" class="form-control" value="${produto.codigo}" disabled>
								<input type="hidden" name="produto.codigo" value="${produto.codigo}">
							</div>
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoDescricao">Descrição*</label>
							<input value="${produto.descricao }" id="campoDescricao" class="form-control" name="produto.descricao" required>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoCodigoBarras">Codigo de Barras</label>
							<input value="${produto.codigo_barras }"type="text" id="campoCodigoBarras" class="form-control" name="produto.codigo_barras">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoDepartamento">Departamento*</label>
							<select id="campoDepartamento" class="form-control select2" name="produto.departamento.codigo" required>
								<option value="" selected>Selecione</option>
								<c:forEach var="d" items="${departamentos }">
									<option value="${d.codigo }" <c:if test="${produto.departamento.codigo == d.codigo }">selected="selected"</c:if>>${d.descricao }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoFornecedor">Fornecedor*</label>
							<select id="campoFornecedor" class="form-control select2" name="produto.fornecedor.codigo" required>
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
						<div class="form-group col-lg-12">
							<label for="campoCor">Cor*</label>
							<select multiple id="campoCor" class="form-control select2" name="produto.cor.codigo" required>
								<c:forEach var="c" items="${cores }">
									<option value="${c.codigo  }"
										<c:forEach var="co" items="${produto.cor }">
											<c:if test="${c.codigo == co.codigo }">selected="selected"</c:if>
										</c:forEach>
									>${c.descricao }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoAtivo">Ativo</label>
							</div>
							<div id="campoAtivo" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<c:choose>
									<c:when test="${produto.ativo == true}">
										<input id="checkSwitch" name="produto.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
									</c:when>
									<c:when test="${produto.ativo == false}">
										<input id="checkSwitch" name="produto.ativo" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/produto' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							<c:if test="${excluir != 1 }">
								<button type="button" class="btn btn-danger btn-flat" data-toggle="modal" data-target="#confirm">Excluir</button>
							</c:if>
						</div>
					</div>
					<div class="modal fade" id="confirm">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Confirmação</h4>
								</div>
								<div class="modal-body">
									<p>Tem certeza que deseja excluir?</p>
								</div>
								<div class="modal-footer">
									<button type="button" data-dismiss="modal" class="btn btn-default pull-left">Voltar</button>
									<a href="<c:url value='/produto/${produto.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>
	
<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>