<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

</head>
<body>

<div class="modal fade in" id="modalCadCidade" tabindex="-1" role="dialog" aria-labelledby="CadastroDeCidade" aria-hidden="true"> 
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
					<div class="content-wrapper" style="margin: 0;">
						<section class="content-header">
							<h1>
								Cidade
								<small>Cadastro de cidade dos endereços</small>
							</h1>
							<ol class="breadcrumb">
								<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
								<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
								<li><a href="<c:url value='/cidade' />" >Cidade</a></li>
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
									<form role="form-cidade" method="post" action='<c:url value="/cidade/gravar"/>'>
										<div class="box-header with-border">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoCodigo">Codigo</label>
												<input type="text" class="form-control" id="campoCodigo" name="cidade.codigo" disabled>
											</div>
										</div>
										<div class="box-body">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoDescricao">Descrição</label>
												<input type="text" class="form-control" id="campoDescricao" name="cidade.descricao">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoEstado">Estado</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default btn-flat" type="button" data-select2-open="campoEstado">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<select id="campoEstado" class="form-control select2" name="cidade.estado.codigo">
														<option value="" selected>Selecione</option>
														<c:forEach var="e" items="${estados }" >
															<option value="${e.codigo }">${e.descricao } - ${e.sigla }</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="box-footer">
											<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
												<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
												<a href="<c:url value='/cidade' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
											</div>
										</div>
									</form>
								</div>
							</c:if>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>