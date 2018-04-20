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
												<input type="text" class="form-control" id="campoCodigo" name="cidade.codigo" autocomplete="no" disabled>
											</div>
										</div>
										<div class="box-body">
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoDescricao">Descrição</label>
												<input type="text" class="form-control" id="campoDescricao" name="cidade.descricao" autocomplete="no" required>
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoEstado">Estado</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button id="btnPesqEstado" class="btn btn-default btn-flat" type="button" data-toggle="modal" data-target="#modalPesqEstado">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<input id="campoEstado" class="form-control" name="cidade.estado.codigo" autocomplete="no" type="hidden">
													<input type="text" class="form-control" name="cidade.estado.descricao" autocomplete="no" disabled>
													<span class="input-group-btn">
														<button id="btnCadEstado" class="btn btn-default btn-flat" type="button" data-toggle="modal" data-target="#modalCadEstado">
															<span class="glyphicon glyphicon-plus"></span>
														</button>
													</span>
												</div>
											</div>
										</div>
										<div class="box-footer">
											<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
												<button id="submit-cidade" type="button" class="btn btn-success btn-flat" data-dimiss="modal">Salvar</button>
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
$('#submit-cidade').on('click', function(e) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : '${pageContext.request.contextPath}/cidade/gravar',
		dataType: 'json',
		data: JSON.stringify({
			"cidade" : {
				"codigo" : ( $('input[name=\'cidade.codigo\']').val() != "" ? $('input[name=\'cidade.codigo\']').val() : null ),
				"descricao" : $('input[name=\'cidade.descricao\']').val(),
				"estado" : {
					"codigo" : $('input[name=\'cidade.estado.codigo\']').val()
				}
			}
		}),
		success : function(json) {
			toastSuccess();
			$('input[name*=\'cidade.codigo\']').val(json.codigo);
			$('input[name*=\'cidade.descricao\']').val(json.descricao + " - " + json.estado.sigla);
			$('input[name=\'cidade.codigo\']').val("");
			$('input[name=\'cidade.descricao\']').val("");
			$("#modalCadCidade").modal('toggle');
		},
		error : function(txt) {
			toastDanger();
		}
	});
});
</script>

<div class="modal fade in" id="modalPesqCidade" tabindex="-1" role="dialog" aria-labelledby="PesquisaDeCidade" aria-hidden="true"> 
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
						</section>
						<section class="content">
							<div class="box">
								<div class="box-header with-border">
									<div class="col-xs-10 col-sm-6 col-md-4 col-lg-4">
										<button type="button" class="btn btn-info btn-flat" data-dismiss="modal">Voltar</button>
									</div>
								</div>
								<div class="box-body">
									<table id="tabela_principal" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Descrição</th>
												<th>Estado</th>
												<th>Data de Cadastro</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="c" items="${cidades }">
												<c:if test="${!empty(c)}" >
													<tr>
														<td>${c.codigo }</td>
														<td><a href="#" data-toggle="tab" onclick="selecionaCidade('${c.codigo }', '${c.descricao }', '${c.estado.sigla }');" >${c.descricao }</a></td>
														<td>${c.estado.descricao } - ${c.estado.sigla }</td>
														<td>${c.criacao }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
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

function selecionaCidade(codigo, descricao, sigla){
	$('input[name*=\'cidade.codigo\']').val(codigo);
	$('input[name*=\'cidade.descricao\']').val(descricao + " - " + sigla);
	$('input[name=\'cidade.codigo\']').val("");
	$('input[name=\'cidade.descricao\']').val("");
	$("#modalPesqCidade").modal('toggle');
}

</script>

<jsp:include page="../modal/estado.jsp"></jsp:include>

</body>
</html>