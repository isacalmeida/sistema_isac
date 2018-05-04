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
				Frete
				<small>Cadastro de fretes das entregas</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> In�cio</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configura��es</a></li>
				<li><a href="<c:url value='/frete' />" >Frete</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/frete/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${frete.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">�ltima altera��o em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${frete.alteracao }" disabled>
						</div>
						<div class="form-group col-lg-12">
							<label for="campoCodigo">Codigo</label>
							<input value="${frete.codigo }" type="text" class="form-control" id="campoCodigo" disabled>
							<input value="${frete.codigo }" name="frete.codigo" type="hidden">
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoUFOrigem">UF Origem</label>
							<input type="text" class="form-control" id="campoUFOrigem" value="${frete.uf_origem.descricao } - ${frete.uf_origem.sigla }" autocomplete="off">
							<input type="hidden" id="valorUFOrigem" value="${frete.uf_origem.codigo }" name="frete.uf_origem.codigo">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoUFDestino">UF Destino</label>
							<input type="text" class="form-control" id="campoUFDestino" value="${frete.uf_destino.descricao } - ${frete.uf_destino.sigla }" autocomplete="off">
							<input type="hidden" id="valorUFDestino" value="${frete.uf_destino.codigo }" name="frete.uf_destino.codigo">
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoQuiloDe">Quilo: de</label>
							<div class="input-group">
								<input type="text" class="form-control mask_numero" id="campoQuiloDe" name="frete.quilo_de" value="${frete.quilo_de }" autocomplete="off">
								<span class="input-group-addon">
									Kg
								</span>
							</div>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoQuiloAte">Quilo: at�</label>
							<div class="input-group">
								<input type="text" class="form-control mask_numero" id="campoQuiloAte" name="frete.quilo_ate" value="${frete.quilo_ate }" autocomplete="off">
								<span class="input-group-addon">
									Kg
								</span>
							</div>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoValorQuilo">Valor do Quilo</label>
							<div class="input-group">
								<span class="input-group-addon">
									R$
								</span>
								<input type="text" class="form-control mask_dinheiro" id="campoValorQuilo" name="frete.valor_quilo" value="${frete.valor_quilo }" autocomplete="off">
							</div>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoPrevisaoEntrega">Previs�o de Entrega</label>
							<div class="input-group">
								<input type="text" class="form-control" id="campoPrevisaoEntrega" name="frete.previsao" value="${frete.previsao }" autocomplete="off">
								<span class="input-group-addon">
									dias
								</span>
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/frete' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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
									<a href="<c:url value='/frete/${frete.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
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