<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

</head>
<body>

<div class="modal fade in" id="modalCalcFrete" tabindex="-1" role="dialog" aria-labelledby="CalculoDeCidade" aria-hidden="true"> 
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
					<div class="content-wrapper" style="margin: 0;">
						<section class="content-header">
							<h1>
								Frete
								<small>Calculo de fretes</small>
							</h1>
						</section>
						<section class="content">
							<div class="box">
								<div class="box-header">
									<form role="form-cidade" method="post" action='<c:url value="/frete/calcula_frete"/>'>
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<label for="modalUFOrigem">UF Origem</label>
											<input type="text" class="form-control" name="uf_origem" id="modalUFOrigem" autocomplete="no">
										</div>
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<label for="modalUFDestino">UF Destino</label>
											<input type="text" class="form-control" name="uf_destino" id="modalUFDestino" autocomplete="no">
										</div>
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<label for="campoQuiloDe">Peso do produto</label>
											<div class="input-group">
												<input type="text" class="form-control mask_numero" id="campoQuiloDe" name="peso" autocomplete="no">
												<span class="input-group-addon">
													Kg
												</span>
											</div>
										</div>
									</form>
								</div>
								<div class="box-footer">
									<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
										<button id="submit-frete" type="button" class="btn btn-success btn-flat">Calcular</button>
										<button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Voltar</button>
									</div>
								</div>
							</div>
							<div id="resultadoCalcFrete" class="box hidden">
								<div class="box-header">
									<h3 class="box-title">Resultado:</h3>
									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
										<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
									</div>
								</div>
								<div class="box-body">
									<p class="msgValor">O valor é: <span class="valor">0</span> reais</p>
									<p class="msgPrazo">O prazo é: <span class="prazo">0</span> dias</p>
									<p hidden="hidden" class="msgErro"></p>
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
$('#submit-frete').on('click', function(e) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : '${pageContext.request.contextPath}/frete/calcula_frete',
		dataType: 'json',
		data: JSON.stringify({
			"uf_origem" : ( $('input[name=\'uf_origem\']').val() != "" ? $('input[name=\'uf_origem\']').val() : "" ),
			"uf_destino" : ( $('input[name=\'uf_destino\']').val() != "" ? $('input[name=\'uf_destino\']').val() : "" ),
			"peso" : ( $('input[name=\'peso\']').val() != "" ? $('input[name=\'peso\']').val() : null )
		}),
		success : function(json) {
			if(json == 0){
				$('.msgErro').prop('hidden', '');
				$('.msgErro').html(json);
				$('.msgValor').prop('hidden', 'hidden');
				$('.msgPrazo').prop('hidden', 'hidden');
			}
			else{
				$('div[id=\'resultadoCalcFrete\']').removeClass("hidden");
				$('.msgValor').prop('hidden', '');
				$('.msgPrazo').prop('hidden', '');
				$('.valor').html(json.valor_quilo);
				$('.prazo').html(json.previsao);
				$('.msgErro').prop('hidden', 'hidden');
			}
		},
		error : function(txt) {
			toastDanger();
		}
	});
});
</script>

<script type="text/javascript">
$('input[name=\'uf_origem\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: '${pageContext.request.contextPath}/busca/estado?term='+  $('input[name=\'uf_origem\']').val(),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['descricao'] +" - "+ item['sigla'],
						value: item['descricao']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'uf_origem\']').val(item['value']);
	}
});

$('input[name=\'uf_destino\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: '${pageContext.request.contextPath}/busca/estado?term='+  $('input[name=\'uf_destino\']').val(),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['descricao'] +" - "+ item['sigla'],
						value: item['descricao']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'uf_destino\']').val(item['value']);
	}
});
</script>

</body>
</html>