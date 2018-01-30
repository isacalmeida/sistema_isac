<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Footer </title>

</head>
<body>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='/bower_components/jquery/dist/jquery.min.js' />"></script>
<script src="<c:url value='/bower_components/jquery-ui/jquery-ui.min.js' />"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/bower_components/select2/dist/js/select2.full.min.js'/>"></script>
<script src="<c:url value='/bower_components/select2/dist/js/i18n/pt-BR.js'/>"></script>
<script src="<c:url value='/bower_components/datatables.net/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js'/>"></script>
<script src="<c:url value='/bower_components/raphael/raphael.min.js' />"></script>
<script src="<c:url value='/bower_components/morris.js/morris.min.js' />"></script>
<script src="<c:url value='/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js' />"></script>
<script src="<c:url value='/bower_components/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'/>"></script>
<script src="<c:url value='/bower_components/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'/>"></script>
<script src="<c:url value='/bower_components/jquery-knob/dist/jquery.knob.min.js'/>"></script>
<script src="<c:url value='/bower_components/moment/min/moment.min.js'/>"></script>
<script src="<c:url value='/bower_components/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
<script src="<c:url value='/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js'/>"></script>
<script src="<c:url value='/bower_components/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'/>"></script>
<script src="<c:url value='/bower_components/jquery-slimscroll/jquery.slimscroll.min.js'/>"></script>
<script src="<c:url value='/bower_components/fastclick/lib/fastclick.js'/>"></script>
<script src="<c:url value='/bower_components/defaults/js/adminlte.min.js'/>"></script>
<script src="<c:url value='/bower_components/defaults/js/demo.js'/>"></script>
<script src="<c:url value='/bower_components/jquery-toast/dist/jquery.toast.min.js'/>"></script>

<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2({
    	placeholder: "",
    	language: "pt-BR",
    	width: '100%'
    });
  });
  $( "button[data-select2-open]" ).click( function() {
		$( "#" + $( this ).data( "select2-open" ) ).select2( "open" );
  });
  $( ".select2-single, .select2-multiple, .select2-allow-clear, .js-data-example-ajax" ).on( "select2:open", function() {
		if ( $( this ).parents( "[class*='has-']" ).length ) {
			var classNames = $( this ).parents( "[class*='has-']" )[ 0 ].className.split( /\s+/ );

			for ( var i = 0; i < classNames.length; ++i ) {
				if ( classNames[ i ].match( "has-" ) ) {
					$( "body > .select2-container" ).addClass( classNames[ i ] );
				}
			}
		}
	});
</script>

<script>
function toastSuccess() {
	$(document).ready(function () {
		$.toast({
		    text: "Dados Salvos", // Text that is to be shown in the toast
		    heading: 'Sucesso', // Optional heading to be shown on the toast
		    icon: 'success', // Type of toast icon
		    showHideTransition: 'fade', // fade, slide or plain
		    allowToastClose: true, // Boolean value true or false
		    hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
		    stack: 2, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
		    position: 'bottom-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
		
		    textAlign: 'left',  // Text alignment i.e. left, right or center
		    loader: true,  // Whether to show loader or not. True by default
		    loaderBg: '#00A65A',  // Background color of the toast loader
		});
	});
};
function toastDanger() {
	$(document).ready(function () {
		$.toast({
		    text: "Algum erro ocorreu", // Text that is to be shown in the toast
		    heading: 'Ops', // Optional heading to be shown on the toast
		    icon: 'error', // Type of toast icon
		    showHideTransition: 'fade', // fade, slide or plain
		    allowToastClose: true, // Boolean value true or false
		    hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
		    stack: 2, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
		    position: 'bottom-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
		
		    textAlign: 'left',  // Text alignment i.e. left, right or center
		    loader: true,  // Whether to show loader or not. True by default
		    loaderBg: '#FF6849',  // Background color of the toast loader
		});
	});
};
</script>

<script src="<c:url value='/assets/scripts/checkbox_button.js' />"></script>
<script src="<c:url value='/bower_components/plugins/iCheck/icheck.min.js' />"></script>
<script>
  $(function () {
    $("[id='loginCheck']").iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '10%' // optional
    });
  });
</script>

<script src="<c:url value='/bower_components/bootstrap-switch/dist/js/bootstrap-switch.js'/>"></script>
<script>
$("[id='checkSwitch']").bootstrapSwitch();
</script>

<script>
  function filterGlobal () {
	    $('#tabela_principal').DataTable().search(
	        $('#global_filter').val(),
	        $('#global_regex').prop('checked'),
	        $('#global_smart').prop('checked')
	    ).draw();
	}
	 
	function filterColumn ( i ) {
	    $('#tabela_principal').DataTable().column( i ).search(
	        $('#col'+i+'_filter').val(),
	        $('#col'+i+'_regex').prop('checked'),
	        $('#col'+i+'_smart').prop('checked')
	    ).draw();
	}
	 
	$(document).ready(function() {
		$('#tabela_principal').DataTable({
		      'paging'      : true,
		      'lengthChange': true,
		      'searching'   : true,
		      'ordering'    : true,
		      'info'        : true,
		      'autoWidth'   : true,
		      'pagingType'  : "full_numbers",
		      'language'    : {
		    	    "sEmptyTable": "Nenhum registro encontrado",
		    	    "sInfo": "Mostrando de _START_ at� _END_ de _TOTAL_ registros",
		    	    "sInfoEmpty": "Mostrando 0 at� 0 de 0 registros",
		    	    "sInfoFiltered": "(Filtrados de _MAX_ registros)",
		    	    "sInfoPostFix": "",
		    	    "sInfoThousands": ".",
		    	    "sLengthMenu": "_MENU_ resultados por p�gina",
		    	    "sLoadingRecords": "Carregando...",
		    	    "sProcessing": "Processando...",
		    	    "sZeroRecords": "Nenhum registro encontrado",
		    	    "sSearch": "Pesquisar",
		    	    "oPaginate": {
		    	        "sNext": "&rsaquo;",
		    	        "sPrevious": "&lsaquo;",
		    	        "sFirst": "&laquo;",
		    	        "sLast": "&raquo;"
		    	    },
		    	    "oAria": {
		    	        "sSortAscending": ": Ordenar colunas de forma ascendente",
		    	        "sSortDescending": ": Ordenar colunas de forma descendente"
		    	    }
		    	}
		    });
	 
	    $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    });
	 
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });
	});
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('#campoTipo').on('change', function() {
		var tipo = this.value;
		
		$('#campoNome, #campoCpf').each(function() {
			if(tipo == 'F') this.required = true;
			else this.required = false;
		});
		$('#campoRazao, #campoCnpj').each(function() {
			if(tipo == 'J') this.required = true;
			else this.required = false;
		});
	});
});

function fisicaJuridica(fisica, juridica, fisica1, juridica1) {
	var display1 = document.getElementById(fisica).style.display;
	var display2 = document.getElementById(juridica).style.display;
	
	if(display1 == "none"){
		document.getElementById(fisica).style.display = 'block';
		document.getElementById(juridica).style.display = 'none';
		document.getElementById(fisica1).style.display = 'block';
		document.getElementById(juridica1).style.display = 'none';
	}
	else{
		document.getElementById(fisica).style.display = 'none';
		document.getElementById(juridica).style.display = 'block';
		document.getElementById(fisica1).style.display = 'none';
		document.getElementById(juridica1).style.display = 'block';
	}
}
</script>

<script type="text/javascript">
function recebeendereco(variavel){
	if(variavel == 0){
		localStorage.setItem("varendereco", 1);
	}
	else{
		localStorage.setItem("varendereco", variavel);
	}
}
function recebecontato(variavel){
	if(variavel == 0){
		localStorage.setItem("varcontato", 1);
	}
	else{
		localStorage.setItem("varcontato", variavel);
	}
}
</script>

<script type="text/javascript">
$(function () {
	var divContent = $('#formendereco');
	var botaoAdicionar = $('a[data-id="2"]');
	var i = 1;
	
	$(botaoAdicionar).click(function () {
		i = localStorage.getItem("varendereco");
		if(i == 0){
			$('<div class="enderecoIndividual"><div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2"><br><a data-toggle="tab" href="#endereco" class="removerEndereco"><button class="btn btn-warning btn-flat" type="button">Remover Endere�o</button></a></div><div class="col-xs-hidden col-sm-7 col-md-7 col-lg-7"></div><div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3"><label for="campoPrincipal">Principal</label><div id="campoPrincipal"><input id="checkSwitch" name="pessoa.endereco['+i+'].principal" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="N�o" data-on-color="success" data-off-color="danger"></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoEndereco'+i+'">Tipo*</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoEndereco'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoEndereco'+i+'" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoMoradia'+i+'">Tipo Moradia</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoMoradia'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoMoradia'+i+'" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="P">Pr�pria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep" required></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoCidade">Cidade*</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade" required></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoBairro">Bairro*</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro" required></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoUf">UF*</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf" required></div><div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8"><label for="campoLogradouro">Logradouro*</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro" required></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoNumero">N�mero*</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero" required></div><div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div>').appendTo(divContent);
		}
		else{
			$('<div class="enderecoIndividual"><div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2"><br><a data-toggle="tab" href="#endereco" class="removerEndereco"><button class="btn btn-warning btn-flat" type="button">Remover Endere�o</button></a></div><div class="col-xs-hidden col-sm-7 col-md-7 col-lg-7"></div><div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3"><label for="campoPrincipal">Principal</label><div id="campoPrincipal"><input id="checkSwitch" name="pessoa.endereco['+i+'].principal" type="checkbox" data-on-text="Sim" data-off-text="N�o" data-on-color="success" data-off-color="danger"></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoEndereco'+i+'">Tipo*</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoEndereco'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoEndereco'+i+'" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoMoradia'+i+'">Tipo Moradia</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoMoradia'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoMoradia'+i+'" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="P">Pr�pria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep"></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoCidade">Cidade</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade"></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoBairro">Bairro</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro"></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoUf">UF</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf"></div><div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8"><label for="campoLogradouro">Logradouro</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro"></div><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoNumero">N�mero</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero"></div><div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div>').appendTo(divContent);
		}
		$('.select2').select2({
	    	placeholder: "",
	    	language: "pt-BR",
	    	width: '100%'
	    });
		$( "button[data-select2-open]" ).click( function() {
			$( "#" + $( this ).data( "select2-open" ) ).select2( "open" );
		});
		$("[id='checkSwitch']").bootstrapSwitch();
		$('#removehidden').remove();
		i++;
		localStorage.setItem("varendereco", i);
	});
	
	$('#formendereco').on('click', '.removerEndereco', function () {
		i = localStorage.getItem("varendereco");
		$(this).parents('.enderecoIndividual').remove();
		i--;
		localStorage.setItem("varendereco", i);
	});
});
</script>

<script type="text/javascript">
$(function () {
	var divContent = $('#formcontato');
	var botaoAdicionar = $('a[data-id="1"]');
	var i = 1;
	
	$(botaoAdicionar).click(function () {
		i = localStorage.getItem("varcontato");
		if(i == 0){
			$('<div class="contatoIndividual"><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoContato'+i+'">Tipo Contato*</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoContato'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoContato'+i+'" name="pessoa.contato['+i+'].tipo_contato" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div></div><div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6"><label for="campoContato">Contato*</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control" required></div><div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning btn-flat" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
		else{
			$('<div class="contatoIndividual"><div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4"><label for="campoTipoContato'+i+'">Tipo Contato</label><div class="input-group"><span class="input-group-btn"><button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoContato'+i+'"><span class="glyphicon glyphicon-search"></span></button></span><select id="campoTipoContato'+i+'" name="pessoa.contato['+i+'].tipo_contato" class="form-control select2"><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div></div><div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6"><label for="campoContato">Contato</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control"></div><div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning btn-flat" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
		$('.select2').select2({
	    	placeholder: "",
	    	language: "pt-BR",
	    	width: '100%'
	    });
		$( "button[data-select2-open]" ).click( function() {
			$( "#" + $( this ).data( "select2-open" ) ).select2( "open" );
		});
		$("[id='checkSwitch']").bootstrapSwitch();
		$('#removehidden').remove();
		i++;
		localStorage.setItem("varcontato", i);
	});

	$('#formcontato').on('click', '.removerContato', function () {
		i = localStorage.getItem("varcontato");
		$(this).parents('.contatoIndividual').remove();
		i--;
		localStorage.setItem("varcontato", i);
	});
});
</script>




</body>
</html>