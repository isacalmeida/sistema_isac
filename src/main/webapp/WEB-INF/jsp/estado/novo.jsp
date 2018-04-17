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
				Estado
				<small>Cadastro de estado dos endereços</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li><a href="<c:url value='/estado' />" >Estado</a></li>
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
					<form role="form" method="post" action='<c:url value="/estado/salvar"/>'>
						<div class="box-header with-border">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCodigo">Codigo</label>
								<input type="text" class="form-control" id="campoCodigo" disabled>
							</div>
						</div>
						<div class="box-body">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoDescricao">Descrição</label>
								<input type="text" class="form-control" id="campoDescricao" name="estado.descricao" required>
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoSigla">Sigla</label>
								<input type="text" class="form-control" id="campoDescricao" name="estado.sigla" required>
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/estado' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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

</body>
</html>