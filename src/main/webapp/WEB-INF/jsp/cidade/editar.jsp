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
				Cidade
				<small>Cadastro de cidade dos endere�os</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> In�cio</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configura��es</a></li>
				<li><a href="<c:url value='/cidade' />" >Cidade</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/cidade/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${cidade.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">�ltima altera��o em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${cidade.alteracao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoCodigo">Codigo</label>
							<input value="${cidade.codigo }" type="text" class="form-control" id="campoCodigo" disabled>
							<input value="${cidade.codigo }" name="cidade.codigo" type="hidden">
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoDescricao">Descri��o</label>
							<input value="${cidade.descricao }" type="text" class="form-control" id="campoDescricao" name="cidade.descricao">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoEstado">Estado*</label>
							<select id="campoEstado" class="form-control select2" name="cidade.estado.codigo" required>
								<option value="" selected>Selecione</option>
								<c:forEach var="e" items="${estados }">
									<option value="${e.codigo }" <c:if test="${cidade.estado.codigo == e.codigo }">selected="selected"</c:if>>${e.descricao } - ${e.sigla }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/cidade' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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
									<h4 class="modal-title">Confirma��o</h4>
								</div>
								<div class="modal-body">
									<p>Tem certeza que deseja excluir?</p>
								</div>
								<div class="modal-footer">
									<button type="button" data-dismiss="modal" class="btn btn-default pull-left">Voltar</button>
									<a href="<c:url value='/cidade/${cidade.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
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