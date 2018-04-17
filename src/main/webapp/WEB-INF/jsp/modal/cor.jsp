<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

</head>
<body>

<div class="modal fade in" id="modalCadCor" tabindex="-1" role="dialog" aria-labelledby="CadastroDeCor" aria-hidden="true"> 
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
					<div class="content-wrapper" style="margin: 0;">
						<section class="content-header">
							<h1>
								Cor
								<small>Cadastro de cores dos produtos</small>
							</h1>
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
									<form id="form-cor" method="post" action='<c:url value="/cor/gravar"/>'>
										<div class="box-header with-border">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoCodigo">Codigo</label>
												<input type="text" class="form-control" id="campoCodigo" name="cor.codigo" autocomplete="no" disabled>
											</div>
										</div>
										<div class="box-body">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoDescricao">Descricao*</label>
												<input type="text" class="form-control" id="campoDescricao" name="cor.descricao" autocomplete="no" required>
											</div>
										</div>
										<div class="box-footer">
											<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
												<button id="submit-cor" type="button" class="btn btn-success btn-flat" data-dimiss="modal">Salvar</button>
												<button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Voltar</button>
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