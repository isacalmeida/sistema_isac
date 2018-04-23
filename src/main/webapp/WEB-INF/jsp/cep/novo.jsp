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
				Cep
				<small>Cadastro de cep dos endereços</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li><a href="<c:url value='/cep' />" >Cep</a></li>
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
					<form role="form" method="post" action='<c:url value="/cep/salvar"/>'>
						<div class="box-header with-border">
							<div id="divCampoCep" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCep">Cep</label>
								<input type="text" class="form-control" id="campoCep" name="cep.codigo">
							</div>
						</div>
						<div class="box-body">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoLogradouro">Logradouro</label>
								<input type="text" class="form-control" id="campoLogradouro" name="cep.logradouro">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoBairro">Bairro</label>
								<input type="text" class="form-control" id="campoBairro" name="cep.bairro">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCidade">Cidade</label>
								<div class="input-group">
									<span class="input-group-btn">
										<button id="btnPesqCidade" class="btn btn-default btn-flat" type="button" data-toggle="modal" data-target="#modalPesqCidade">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
									<select id="campoCidade" class="form-control" name="cep.cidade.codigo" style="display:none;" disabled></select>
									<input id="campoCidade" class="form-control" name="cep.cidade.codigo" autocomplete="no" type="hidden">
									<input type="text" class="form-control" name="cep.cidade.descricao" autocomplete="no" disabled>
									<span class="input-group-btn">
										<button id="btnCadCidade" class="btn btn-default btn-flat" type="button" data-toggle="modal" data-target="#modalCadCidade">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoIbge">IBGE</label>
								<input type="text" class="form-control" id="campoIbge" name="cep.ibge">
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="0" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/cep' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							</div>
						</div>
					</form>
				</div>
			</c:if>
		</section>
	</div>

	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

<jsp:include page="../modal/cidade.jsp"></jsp:include>

</body>
</html>