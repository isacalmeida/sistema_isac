<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

</head>

<body class="hold-transition skin-blue sidebar-mini">

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
				<li class="active">Novo</li>
			</ol>
		</section>
		<section class="content">
			<c:if test="${permissao == 1 }">
				<div class="box">
					<div class="box-header">
						<i class="fa fa-bullhorn"></i>
						<h3 class="box-title">Alertas</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
							<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
						</div>
					</div>
					<div class="box-body">
						<div class="callout callout-danger">
							<h4><i class="icon fa fa-ban"></i> Ops!</h4>
							<p>Você não possui permissão para visualizar este programa</p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${permissao != 1 }">
				<div class="box">
					<form role="form" method="post" action='<c:url value="/produto/salvar"/>'>
						<div class="box-header with-border">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">	
									<img class="img-thumbnail" id="imagemProduto" src="<c:url value="/imagem/produto/avatar_default.png" />">
								</div>
								<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
									<label for="campoImagem">Imagem</label>
									<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" name="produto.imagem">
								</div>
								<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
									<label for="campoCodigo">Codigo</label>
									<input type="text" id="campoCodigo" class="form-control" name="produto.codigo" disabled>
								</div>
							</div>
						</div>
						<div class="box-body">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoDescricao">Descrição*</label>
								<input id="campoDescricao" class="form-control" name="produto.descricao" required>
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCodigoBarras">Codigo de Barras</label>
								<input type="text" id="campoCodigoBarras" class="form-control" name="produto.codigo_barras">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoDepartamento">Departamento*</label>
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-default btn-flat" type="button" data-select2-open="campoDepartamento">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
									<select id="campoDepartamento" class="form-control select2" name="produto.departamento.codigo" required>
										<option value="" selected>Selecione</option>
										<c:forEach var="d" items="${departamentos }">
											<option value="${d.codigo }">${d.descricao }</option>
										</c:forEach>
									</select>
									<span class="input-group-btn">
										<button class="btn btn-default btn-flat" type="button" data-toggle="modal" data-target="#departamento">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoFornecedor">Fornecedor*</label>
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-default btn-flat" type="button" data-select2-open="campoFornecedor">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
									<select id="campoFornecedor" class="form-control select2" name="produto.fornecedor.codigo" required>
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
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCor">Cor*</label>
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-default btn-flat" type="button" data-select2-open="campoCor">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
									<select multiple id="campoCor" class="form-control select2" name="produto.cor.codigo" required>
										<c:forEach var="c" items="${cores }">
											<option value="${c.codigo  }">${c.descricao }</option>
										</c:forEach>
									</select>
									<span class="input-group-btn">
										<button id="btncor" class="btn btn-default btn-flat" data-toggle="modal" data-target="#myModal">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<label for="campoAtivo">Ativo</label>
								</div>
								<div id="campoAtivo" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<input id="checkSwitch" name="produto.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/produto' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							</div>
						</div>
					</form>
				</div>
			</c:if>
		</section>
	</div>
		
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
   <div class="modal-dialog" style="width: 100%; height: 90%;">
     <div class="modal-content" style="width: 100%; height: 90%;" >
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">&times;</span>
		</button>
	  </div>
	  <div class="modal-body" style="width: 100%; height: 80%; margin: 0px; padding: 0px;">
	  	<iframe src="/admin/modal/cor/novo" style="border: 0px; width: 100%; height: 80%;"></iframe>
	  </div>
	</div>
  </div> 
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>