<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

</head>
<body>

<div class="modal fade in" id="modalCadEstado" tabindex="-1" role="dialog" aria-labelledby="CadastroDeEstado" aria-hidden="true"> 
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
					<div class="content-wrapper" style="margin: 0;">
						<section class="content-header">
							<h1>
								Estado
								<small>Cadastro de estado dos endereços</small>
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
									<form role="form-estado" method="post" action="<c:url value='/estado/gravar' />">
										<div class="box-header with-border">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoCodigo">Codigo</label>
												<input type="text" class="form-control" id="campoCodigo" name="estado.codigo" autocomplete="no" disabled>
											</div>
										</div>
										<div class="box-body">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoDescricao">Descrição</label>
												<input type="text" class="form-control" id="campoDescricao" name="estado.descricao" autocomplete="no" required>
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoSigla">Sigla</label>
												<input type="text" class="form-control" id="campoSigla" name="estado.sigla" autocomplete="no" required>
											</div>
										</div>
										<div class="box-footer">
											<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
												<button id="submit-estado" type="button" class="btn btn-success btn-flat" data-dimiss="modal">Salvar</button>
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

<script type="text/javascript">
$('#submit-estado').on('click', function(e) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : '${pageContext.request.contextPath}/estado/gravar',
		dataType: 'json',
		data: JSON.stringify({
			"estado" : {
				"codigo" : ( $('input[name=\'estado.codigo\']').val() != "" ? $('input[name=\'estado.codigo\']').val() : null ),
				"descricao" : $('input[name=\'estado.descricao\']').val(),
				"sigla" : $('input[name=\'estado.sigla\']').val()
			}
		}),
		success : function(json) {
			toastSuccess();
			$('input[name*=\'estado.codigo\']').val(json.codigo);
			$('input[name*=\'estado.descricao\']').val(json.descricao + " - " + json.sigla);
			$('input[name=\'estado.codigo\']').val("");
			$('input[name=\'estado.descricao\']').val("");
			$('input[name=\'estado.sigla\']').val("");
			$("#modalCadEstado").modal('toggle');
		},
		error : function(txt) {
			toastDanger();
		}
	});
});
</script>

<div class="modal fade in" id="modalPesqEstado" tabindex="-1" role="dialog" aria-labelledby="PesquisaDeEstado" aria-hidden="true"> 
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
					<div class="content-wrapper" style="margin: 0;">
						<section class="content-header">
							<h1>
								Estado
								<small>Cadastro de estado dos endereços</small>
							</h1>
						</section>
						<section class="content">
							<div class="box">
								<div class="box-header with-border">
									<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<button type="button" class="btn btn-info btn-flat" data-dismiss="modal">Voltar</button>
									</div>
									<div class="box-body">
										<table id="tabela_principal" class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>Descrição</th>
													<th>Sigla</th>
													<th>Data de Cadastro</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="e" items="${estados }">
													<c:if test="${!empty(e)}" >
														<tr>
															<td>${e.codigo }</td>
															<td><a href="#" data-toggle="tab" onclick="selecionaEstado('${e.codigo }','${e.descricao }', '${e.sigla }');" >${e.descricao }</a></td>
															<td>${e.sigla }</td>
															<td>${e.criacao }</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function selecionaEstado(codigo, descricao, sigla){
	$('input[name*=\'estado.codigo\']').val(codigo);
	$('input[name*=\'estado.descricao\']').val(descricao + " - " + sigla);
	$('input[name=\'estado.codigo\']').val("");
	$('input[name=\'estado.descricao\']').val("");
	$("#modalPesqEstado").modal('toggle');
}

</script>

</body>
</html>