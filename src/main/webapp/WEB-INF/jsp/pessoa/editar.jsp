<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Editar </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/dashboard.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/select/dist/css/bootstrap-select.min.css' />" />

<style type="text/css">
.btn-default.btn-on.active{background-color: #5BB75B;color: white;}
.btn-default.btn-off.active{background-color: #DA4F49;color: white;}
</style>

<%-- jQuery (necessary for Bootstrap's JavaScript plugins) --%>
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/jquery.maskedinput.min.js' />"></script>

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
$(function() {
	var divContent = $('#formendereco');
	var botaoAdicionar = $('a[data-id="2"]');
	var i = 1;
	$(botaoAdicionar).click(function() {
		i = localStorage.getItem("varendereco");
		if(i == 0){
			$('<div class="enderecoIndividual row"><div class="row"><div class="form-group col-lg-4" style="margin-top: 5px;"><br><a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a></div><div class="form-group col-lg-4"></div><div class="form-group col-lg-4"><div class="form-group row"><div class="col-lg-12"><label for="campoPrincipal">Principal</label></div><div id="campoPrincipal" class="col-lg-12"><div class="btn-group" data-toggle="buttons"><label class="btn btn-default btn-on active"><input type="radio" value="true" name="pessoa.endereco['+i+'].principal" checked="checked">Sim</label><label class="btn btn-default btn-off"><input type="radio" value="false" name="pessoa.endereco['+i+'].principal">Não</label></div></div></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoTipoEndereco">Tipo*</label><select id="campoTipoEndereco" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control"><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div><div class="form-group col-lg-4"><label for="campoTipoMoradia">Tipo Moradia</label><select id="campoTipoMoradia" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control"><option value="" selected="selected">Selecione</option><option value="P">Própria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div><div class="form-group col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep" required></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoCidade">Cidade*</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade" required></div><div class="form-group col-lg-4"><label for="campoBairro">Bairro*</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro" required></div><div class="form-group col-lg-4"><label for="campoUf">UF*</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf" required></div></div><div class="row"><div class="form-group col-lg-8"><label for="campoLogradouro">Logradouro*</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro" required></div><div class="form-group col-lg-4"><label for="campoNumero">Número*</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero" required></div></div><div class="row"><div class="form-group col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div></div>').appendTo(divContent);    	
		}
		else{
			$('<div class="enderecoIndividual row"><div class="row"><div class="form-group col-lg-4" style="margin-top: 5px;"><br><a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a></div><div class="form-group col-lg-4"></div><div class="form-group col-lg-4"><div class="form-group row"><div class="col-lg-12"><label for="campoPrincipal">Principal</label></div><div id="campoPrincipal" class="col-lg-12"><div class="btn-group" data-toggle="buttons"><label class="btn btn-default btn-on"><input type="radio" value="true" name="pessoa.endereco['+i+'].principal">Sim</label><label class="btn btn-default btn-off active"><input type="radio" value="false" name="pessoa.endereco['+i+'].principal" checked="checked">Não</label></div></div></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoTipoEndereco">Tipo*</label><select id="campoTipoEndereco" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control"><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div><div class="form-group col-lg-4"><label for="campoTipoMoradia">Tipo Moradia</label><select id="campoTipoMoradia" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control"><option value="" selected="selected">Selecione</option><option value="P">Própria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div><div class="form-group col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep"></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoCidade">Cidade</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade"></div><div class="form-group col-lg-4"><label for="campoBairro">Bairro</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro"></div><div class="form-group col-lg-4"><label for="campoUf">UF</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf"></div></div><div class="row"><div class="form-group col-lg-8"><label for="campoLogradouro">Logradouro</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro"></div><div class="form-group col-lg-4"><label for="campoNumero">Número</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero"></div></div><div class="row"><div class="form-group col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div></div>').appendTo(divContent);    	
		}
		$('#removehidden').remove();
		i++;
		localStorage.setItem("varendereco", i);
	});
	
	$('#formendereco').on('click', '.removerEndereco', function() {
		i = localStorage.getItem("varendereco");
		$(this).parents('.enderecoIndividual').remove();
		i--;
		localStorage.setItem("varendereco", i);
	});
});
</script>

<script type="text/javascript">
$(function() {
	var divContent = $('#formcontato');
	var botaoAdicionar = $('a[data-id="1"]');
	var i = 1;
	
	$(botaoAdicionar).click(function () {
		i = localStorage.getItem("varcontato");
		if(i == 0){
			$('<div class="contatoIndividual row"><div class="form-group col-lg-4"><label for="campoTipoContato">Tipo Contato*</label><select id="campoTipoContato" name="pessoa.contato['+i+'].tipo_contato" class="form-control"><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div><div class="form-group col-lg-6"><label for="campoContato">Contato*</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control" required></div><div class="form-group col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
		else{
			$('<div class="contatoIndividual row"><div class="form-group col-lg-4"><label for="campoTipoContato">Tipo Contato</label><select id="campoTipoContato" name="pessoa.contato['+i+'].tipo_contato" class="form-control"><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div><div class="form-group col-lg-6"><label for="campoContato">Contato</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control"></div><div class="form-group col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
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

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/menu'/>" >Trabalho Isac</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <span><c:out value="${usuario_nome } " /></span> <span class="glyphicon glyphicon-user"></span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/login/sair'/>">Sair</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li>
					<div class="navbar-form">
						<select id="campoPesquisa" class="selectpicker form-control" data-live-search="true" data-size="auto" title="Pesquisar..." onchange="location = this.value;">
							<c:forEach var="prog" items="${programas }">
								<option value="/lista${prog.endereco  }">${prog.descricao }</option>
							</c:forEach>
						</select>
					</div>
				</li>
				<li><a href="<c:url value='/menu'/>"> Inicio </a></li>
				<li class="active"><a href="<c:url value='/menu/cadastros'/>"> Cadastros <span class="sr-only">(current)</span></a></li>
				<li><a href="<c:url value='/menu/configuracoes'/>"> Configurações </a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Pessoas </h3><hr>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/pessoa'/>"> Pessoas </a></li>
				<li class="active"> Editar </li>
			</ol>
			<form name="formPessoa" data-toggle="validator" role="form" method="post" action='<c:url value="/pessoa/salvar"/>'>
				<div class="row">
					<div class="col-lg-3">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<img class="img-thumbnail" id="imagemPessoa" src="<c:url value='${pessoa.imagem }' />">
							<input type="text" name="pessoa.imagem" value="${pessoa.imagem }" hidden="hidden">
						</div>
						<div class="col-lg-2"></div>
					</div>
					<div class="form-group col-lg-6">
						<div class="row">
							<label for="campoImagem">Imagem</label>
							<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" >
						</div>
						<br>
						<div class="row">
							<label for="campoCodigo">Codigo</label>
							<input type="text" id="campoCodigo" class="form-control" value="${pessoa.codigo}" disabled>
							<input type="hidden" name="pessoa.codigo" value="${pessoa.codigo}">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="col-lg-11">
							<div class="row">
								<label for="campoCriacao">Criado em:</label>
								<input type="datetime" id="campoCriacao" class="form-control" value="${pessoa.criacao }" disabled>
								<%-- <input type="hidden" name="pessoa.criacao" value="${pessoa.criacao }"> --%>
							</div>
							<br>
							<div class="row">
								<label for="campoAlteracao">Última alteração em:</label>
								<input type="datetime" id="campoAlteracao" class="form-control" value="${pessoa.alteracao }" disabled>
								<%-- <input type="hidden" name="pessoa.alteracao" value="${pessoa.alteracao }"> --%>
							</div>
						</div>
						<div class="col-lg-1"></div>
					</div>
					<div class="col-lg-1"></div>
				</div>
				<fieldset>
					<br>
					<ul class="nav nav-tabs responsive">
						<li class="active"><a data-toggle="tab" href="#basico">Basico</a></li>
						<li><a data-toggle="tab" href="#adicional">Adicional</a></li>
						<li><a data-toggle="tab" href="#endereco" onclick="recebeendereco(${qtdendereco})">Endereco</a></li>
						<li><a data-toggle="tab" href="#contato" onclick="recebecontato(${qtdcontato})">Contato</a></li>
					</ul>
					<div class="tab-content responsive">
						<br>
						<div id="basico" class="tab-pane active">
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-10">
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoTipo">Tipo de Pessoa</label>
											<input type="hidden" name="pessoa.tipo" value="${pessoa.tipo.toString() }">
											<select id="campoTipo" class="selectpicker form-control" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');" disabled>
												<c:choose>
													<c:when test="${pessoa.tipo.toString() eq 'F'}">
														<option value="F" selected="selected">Física</option>
														<option value="J">Jurídica</option>
													</c:when>
													<c:when test="${pessoa.tipo.toString() eq 'J'}">
														<option value="F">Física</option>
														<option value="J" selected="selected">Jurídica</option>
													</c:when>
												</c:choose>
											</select>
										</div>
									</div>
									<div id="fisica" style="display: block">
										<div class="row" >
											<div class="form-group col-lg-12">
												<label for="campoNome">Nome Completo</label>
												<input value="${pessoa.nome }" type="text" id="campoNome" class="form-control" name="pessoa.nome">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCpf">CPF</label>
												<input value="${pessoa.cpf }"type="text" id="campoCpf" class="form-control" name="pessoa.cpf">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIdentidade">Identidade</label>
												<input value="${pessoa.identidade }" type="text" id="campoIdentidade" class="form-control" name="pessoa.identidade">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoEmisIden">Data Emissão Identidade</label>
												<input value="${pessoa.data_emissao }" type="text" id="campoEmisIden" class="form-control" name="pessoa.data_emissao">
											</div>
										</div>
									</div>
									<div id="juridica" style="display: none">
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoRazao">Razão Social</label>
												<input value="${pessoa.razao }" type="text" id="campoRazao" class="form-control" name="pessoa.razao">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoFantasia">Nome Fantasia</label>
												<input value="${pessoa.fantasia }" type="text" id="campoFantasia" class="form-control" name="pessoa.fantasia">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCnpj">CNPJ</label>
												<input value="${pessoa.cnpj }" type="text" id="campoCnpj" class="form-control" name="pessoa.cnpj">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIe">Inscrição Estadual</label>
												<input value="${pessoa.inscricao_estadual }" type="text" id="campoIe" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
							</div>
							<div class="row">
								<div class="col-sm-2"></div>
								<div class="col-sm-3">
									<div class="col-sm-12">
										<label for="campoCliente">Cliente</label>
									</div>
									<div id="campoCliente" class="col-xs-12 col-sm-8">
										<div class="btn-group" data-toggle="buttons">
											<c:choose>
												<c:when test="${pessoa.cliente == true}">
													<label class="btn btn-default btn-on active">
													<input type="radio" value="true" name="pessoa.cliente" checked="checked">Sim</label>
													<label class="btn btn-default btn-off">
													<input type="radio" value="false" name="pessoa.cliente">Não</label>
												</c:when>
												<c:when test="${pessoa.cliente == false}">
													<label class="btn btn-default btn-on">
													<input type="radio" value="true" name="pessoa.cliente">Sim</label>
													<label class="btn btn-default btn-off active">
													<input type="radio" value="false" name="pessoa.cliente" checked="checked">Não</label>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="col-sm-12">
										<label for="campoFornecedor">Fornecedor</label>
									</div>
									<div id="campoFornecedor" class="col-xs-12 col-sm-8">
										<div class="btn-group" data-toggle="buttons">
											<c:choose>
												<c:when test="${pessoa.fornecedor == true}">
													<label class="btn btn-default btn-on active">
													<input type="radio" value="true" name="pessoa.fornecedor" checked="checked">Sim</label>
													<label class="btn btn-default btn-off">
													<input type="radio" value="false" name="pessoa.fornecedor">Não</label>
												</c:when>
												<c:when test="${pessoa.fornecedor == false}">
													<label class="btn btn-default btn-on">
													<input type="radio" value="true" name="pessoa.fornecedor">Sim</label>
													<label class="btn btn-default btn-off active">
													<input type="radio" value="false" name="pessoa.fornecedor" checked="checked">Não</label>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="col-sm-12">
										<label for="campoAtivo">Ativo</label>
									</div>
									<div id="campoAtivo" class="col-xs-12 col-sm-8">
										<div class="btn-group" data-toggle="buttons">
											<c:choose>
												<c:when test="${pessoa.ativo == true}">
													<label class="btn btn-default btn-on active">
													<input type="radio" value="true" name="pessoa.ativo" checked="checked">Sim</label>
													<label class="btn btn-default btn-off">
													<input type="radio" value="false" name="pessoa.ativo">Não</label>
												</c:when>
												<c:when test="${pessoa.ativo == false}">
													<label class="btn btn-default btn-on">
													<input type="radio" value="true" name="pessoa.ativo">Sim</label>
													<label class="btn btn-default btn-off active">
													<input type="radio" value="false" name="pessoa.ativo" checked="checked">Não</label>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="adicional" class="tab-pane">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<div id="fisica1" style="display: block">
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoDataNascimento">Data de Nascimento</label>
											<input value="${pessoa.data_nascimento }" type="text" id="campoDataNascimento" class="form-control" name="pessoa.data_nascimento">
										</div>
									</div>
									<div class="row" >
										<div class="form-group col-lg-12">
											<label for="campoSexo">Sexo</label>
											<select id="campoSexo" name="pessoa.sexo" class="selectpicker form-control">
												<c:choose>
													<c:when test="${pessoa.sexo.toString() == 'M'}">
														<option value="">Selecione</option>
														<option value="M" selected="selected">Masculino</option>
														<option value="F">Feminino</option>
													</c:when>
													<c:when test="${pessoa.sexo.toString() == 'F'}">
														<option value="">Selecione</option>
														<option value="M">Masculino</option>
														<option value="F" selected="selected">Feminino</option>
													</c:when>
													<c:otherwise>
														<option value="" selected="selected">Selecione</option>
														<option value="M">Masculino</option>
														<option value="F">Feminino</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoEstCivil">Estado Civil</label>
											<select id="campoEstCivil" name="pessoa.estado_civil" class="selectpicker form-control">
												<c:choose>
													<c:when test="${pessoa.estado_civil.toString() == 'S'}">
														<option value="">Selecione</option>
														<option value="S" selected="selected">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O">Outros</option>
													</c:when>
													<c:when test="${pessoa.estado_civil.toString() == 'C'}">
														<option value="">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C" selected="selected">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O">Outros</option>
													</c:when>
													<c:when test="${pessoa.estado_civil.toString() == 'D'}">
														<option value="">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D" selected="selected">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O">Outros</option>
													</c:when>
													<c:when test="${pessoa.estado_civil.toString() == 'V'}">
														<option value="">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V" selected="selected">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O">Outros</option>
													</c:when>
													<c:when test="${pessoa.estado_civil.toString() == 'U'}">
														<option value="">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U" selected="selected">União Estável</option>
														<option value="O">Outros</option>
													</c:when>
													<c:when test="${pessoa.estado_civil.toString() == 'O'}">
														<option value="">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O" selected="selected">Outros</option>
													</c:when>
													<c:otherwise>
														<option value="" selected="selected">Selecione</option>
														<option value="S">Solteiro(a)</option>
														<option value="C">Casado(a)</option>
														<option value="D">Divorciado(a)</option>
														<option value="V">Viúvo(a)</option>
														<option value="U">União Estável</option>
														<option value="O">Outros</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
								</div>
								<div id="juridica1" style="display: none">
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoDataFundacao">Data de Fundação</label>
											<input value="${pessoa.data_fundacao }" type="text" id="campoDataFundacao" class="form-control" name="pessoa.data_fundacao">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoFinalidade">Finalidade</label>
											<select id="campoFinalidade" name="pessoa.finalidade" class="selectpicker form-control">
												<c:choose>
													<c:when test="${pessoa.finalidade.toString() == 'C'}">
														<option value="C" selected="selected">Consumidor</option>
														<option value="R">Revendedor</option>
													</c:when>
													<c:when test="${pessoa.finalidade.toString() == 'R'}">
														<option value="C">Consumidor</option>
														<option value="R" selected="selected">Revendedor</option>
													</c:when>
												</c:choose>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<div id="endereco" class="tab-pane">
							<div class="col-sm-1">
								<div class="form-group col-lg-12" style="margin-top: 5px;">
									<br>
									<a data-toggle="tab" href="#endereco" data-id="2" id="adicionarEndereco" ><button class="btn btn-default" type="button">Novo</button></a>
								</div>
							</div>
							<div class="col-sm-10">
								<div id="formendereco">
									<c:if test="${qtdendereco == 0 }">
										<div class="enderecoIndividual row">
											<div class="row">
												<div class="form-group col-lg-4" style="margin-top: 5px;">
													<br>
													<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a>
												</div>
												<div class="form-group col-lg-4"></div>
												<div class="form-group col-lg-4">
													<div class="form-group row">
														<div class="col-lg-12">
															<label for="campoPrincipal">Principal</label>
														</div>
														<div id="campoPrincipal" class="col-lg-12">
															<div class="btn-group" data-toggle="buttons">
																<label class="btn btn-default btn-on active">
																<input type="radio" value="true" name="pessoa.endereco[0].principal" checked="checked">Sim</label>
																<label class="btn btn-default btn-off">
																<input type="radio" value="false" name="pessoa.endereco[0].principal">Não</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="form-group col-lg-4">
													<label for="campoTipoEndereco">Tipo*</label>
													<select id="campoTipoEndereco" name="pessoa.endereco[0].tipo_endereco" class="selectpicker form-control">
														<option value="" selected="selected">Selecione</option>
														<option value="C">Comercial</option>
														<option value="R">Residencial</option>
													</select>
												</div>
												<div class="form-group col-lg-4">
													<label for="campoTipoMoradia">Tipo Moradia</label>
													<select id="campoTipoMoradia" name="pessoa.endereco[0].tipo_moradia" class="selectpicker form-control">
														<option value="" selected="selected">Selecione</option>
														<option value="P">Própria</option>
														<option value="A">Alugada</option>
														<option value="F">Financiada</option>
														<option value="O">Outros</option>
													</select>
												</div>
												<div class="form-group col-lg-4">
													<label for="campoCep">CEP</label>
													<input type="text" id="campoCep" class="form-control" name="pessoa.endereco[0].cep">
												</div>
											</div>
											<div class="row">
												<div class="form-group col-lg-4">
													<label for="campoCidade">Cidade</label>
													<input type="text" id="campoCidade" class="form-control" name="pessoa.endereco[0].cidade">
												</div>
												<div class="form-group col-lg-4">
													<label for="campoBairro">Bairro</label>
													<input type="text" id="campoBairro" class="form-control" name="pessoa.endereco[0].bairro">
												</div>
												<div class="form-group col-lg-4">
													<label for="campoUf">UF</label>
													<input type="text" id="campoUf" class="form-control" name="pessoa.endereco[0].uf">
												</div>
											</div>
											<div class="row">
												<div class="form-group col-lg-8">
													<label for="campoLogradouro">Logradouro</label>
													<input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco[0].logradouro">
												</div>
												<div class="form-group col-lg-4">
													<label for="campoNumero">Número</label>
													<input type="text" id="campoNumero" class="form-control" name="pessoa.endereco[0].numero">
												</div>
											</div>
											<div class="row">
												<div class="form-group col-lg-12">
													<label for="campoComplemento">Complemento</label>
													<textarea id="campoComplemento" class="form-control" name="pessoa.endereco[0].complemento"></textarea>
												</div>
											</div>
										</div>
									</c:if>
									<c:set var="var" value="-1" />
									<c:forEach var="end" items="${pessoa.endereco }">
										<c:if test="${end.codigo != null}">
											<c:set var="var" value="${var=var+1 }" />
											<div class="enderecoIndividual row">
												<div class="row">
													<div class="form-group col-lg-4" style="margin-top: 5px;">
														<br>
														<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a>
													</div>
													<div class="form-group col-lg-4"></div>
													<div class="form-group col-lg-4">
														<div class="form-group row">
															<div class="col-lg-12">
																<label for="campoPrincipal">Principal</label>
															</div>
															<div id="campoPrincipal" class="col-lg-12">
																<div class="btn-group" data-toggle="buttons">
																	<c:choose>
																		<c:when test="${end.principal == true}">
																			<label class="btn btn-default btn-on active">
																			<input type="radio" value="true" name="pessoa.endereco[${var }].principal" checked="checked">Sim</label>
																			<label class="btn btn-default btn-off">
																			<input type="radio" value="false" name="pessoa.endereco[${var }].principal">Não</label>
																		</c:when>
																		<c:when test="${end.principal == false}">
																			<label class="btn btn-default btn-on">
																			<input type="radio" value="true" name="pessoa.endereco[${var }].principal">Sim</label>
																			<label class="btn btn-default btn-off active">
																			<input type="radio" value="false" name="pessoa.endereco[${var }].principal" checked="checked">Não</label>
																		</c:when>
																	</c:choose>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="form-group col-lg-4">
														<label for="campoTipoEndereco">Tipo</label>
														<select id="campoTipoEndereco" name="pessoa.endereco[${var }].tipo_endereco" class="selectpicker form-control">
															<c:choose>
																<c:when test="${end.tipo_endereco.toString() eq 'C' }" >
																	<option value="">Selecione</option>
																	<option value="C" selected="selected">Comercial</option>
																	<option value="R">Residencial</option>
																</c:when>
																<c:when test="${end.tipo_endereco.toString() eq 'R' }" >
																	<option value="">Selecione</option>
																	<option value="C">Comercial</option>
																	<option value="R" selected="selected">Residencial</option>
																</c:when>
																<c:otherwise>
																	<option value="" selected="selected">Selecione</option>
																	<option value="C">Comercial</option>
																	<option value="R">Residencial</option>
																</c:otherwise>
															</c:choose>
														</select>
													</div>
													<div class="form-group col-lg-4">
														<label for="campoTipoMoradia">Tipo Moradia</label>
														<select id="campoTipoMoradia" name="pessoa.endereco[${var }].tipo_moradia" class="selectpicker form-control">
															<c:choose>
																<c:when test="${end.tipo_moradia.toString() eq 'P' }">
																	<option value="">Selecione</option>
																	<option value="P" selected="selected">Própria</option>
																	<option value="A">Alugada</option>
																	<option value="F">Financiada</option>
																	<option value="O">Outros</option>
																</c:when>
																<c:when test="${end.tipo_moradia.toString() eq 'A' }">
																	<option value="">Selecione</option>
																	<option value="P">Própria</option>
																	<option value="A" selected="selected">Alugada</option>
																	<option value="F">Financiada</option>
																	<option value="O">Outros</option>
																</c:when>
																<c:when test="${end.tipo_moradia.toString() eq 'F' }">
																	<option value="">Selecione</option>
																	<option value="P">Própria</option>
																	<option value="A">Alugada</option>
																	<option value="F" selected="selected">Financiada</option>
																	<option value="O">Outros</option>
																</c:when>
																<c:when test="${end.tipo_moradia.toString() eq 'O' }">
																	<option value="">Selecione</option>
																	<option value="P">Própria</option>
																	<option value="A">Alugada</option>
																	<option value="F">Financiada</option>
																	<option value="O" selected="selected">Outros</option>
																</c:when>
																<c:otherwise>
																	<option value="" selected="selected">Selecione</option>
																	<option value="P">Própria</option>
																	<option value="A">Alugada</option>
																	<option value="F">Financiada</option>
																	<option value="O">Outros</option>
																</c:otherwise>
															</c:choose>
														</select>
													</div>
													<div class="form-group col-lg-4">
														<label for="campoCep">CEP</label>
														<input value="${end.cep}" type="text" id="campoCep" class="form-control" name="pessoa.endereco[${var }].cep">
													</div>
												</div>
												<div class="row">
													<div class="form-group col-lg-4">
														<label for="campoCidade">Cidade</label>
														<input value="${end.cidade}" type="text" id="campoCidade" class="form-control" name="pessoa.endereco[${var }].cidade">
													</div>
													<div class="form-group col-lg-4">
														<label for="campoBairro">Bairro</label>
														<input value="${end.bairro}" type="text" id="campoBairro" class="form-control" name="pessoa.endereco[${var }].bairro">
													</div>
													<div class="form-group col-lg-4">
														<label for="campoUf">UF</label>
														<input value="${end.uf}" type="text" id="campoUf" class="form-control" name="pessoa.endereco[${var }].uf">
													</div>
												</div>
												<div class="row">
													<div class="form-group col-lg-8">
														<label for="campoLogradouro">Logradouro</label>
														<input value="${end.logradouro}" type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco[${var }].logradouro">
													</div>
													<div class="form-group col-lg-4">
														<label for="campoNumero">Número</label>
														<input value="${end.numero}" type="text" id="campoNumero" class="form-control" name="pessoa.endereco[${var }].numero">
													</div>
												</div>
												<div class="row">
													<div class="form-group col-lg-12">
														<label for="campoComplemento">Complemento</label>
														<textarea id="campoComplemento" class="form-control" name="pessoa.endereco[${var }].complemento"><c:out value="${end.complemento}" /></textarea>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<div id="contato" class="tab-pane">	
							<div class="col-sm-1">
								<div class="form-group col-lg-12" style="margin-top: 5px;">
									<br>
									<a data-toggle="tab" href="#contato" data-id="1" onclick="recebevar(${var})" id="adicionarContato"><button class="btn btn-default" type="button">Novo</button></a>
								</div>
							</div>
							<div class="col-sm-10">
								<div id="formcontato">
									<c:if test="${qtdcontato == 0 }">
										<div class="contatoIndividual row">
											<div class="form-group col-lg-4">
												<label for="campoTipoContato">Tipo Contato</label>
												<select id="campoTipoContato" name="pessoa.contato[0].tipo_contato" class="selectpicker form-control">
													<option value="" selected="selected">Selecione</option>
													<option value="R">Telefone Residencial</option>
													<option value="C">Telefone Comercial</option>
													<option value="F">Celular</option>
													<option value="E">Email</option>
												</select>
											</div>
											<div class="form-group col-lg-6">
												<label for="campoContato">Contato</label>
												<input type="text" id="campoContato" name="pessoa.contato[0].valor_contato" class="form-control">
											</div>
											<div class="form-group col-lg-2" style="margin-top: 5px;">
												<br>
												<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning" type="button">Remover</button></a>
											</div>
										</div>
									</c:if>
									<c:set var="var" value="-1" />
									<c:forEach var="cont" items="${pessoa.contato }">
										<c:set var="var" value="${var=var+1}" />
										<div class="contatoIndividual row">
											<div class="form-group col-lg-4">
												<label for="campoTipoContato">Tipo Contato</label>
												<select id="campoTipoContato" name="pessoa.contato[${var }].tipo_contato" class="selectpicker form-control">
													<c:choose>
														<c:when test="${cont.tipo_contato.toString() == 'R' }">
															<option value="">Selecione</option>
															<option value="R" selected="selected">Telefone Residencial</option>
															<option value="C">Telefone Comercial</option>
															<option value="F">Celular</option>
															<option value="E">Email</option>
														</c:when>
														<c:when test="${cont.tipo_contato.toString() == 'C' }">
															<option value="">Selecione</option>
															<option value="R">Telefone Residencial</option>
															<option value="C" selected="selected">Telefone Comercial</option>
															<option value="F">Celular</option>
															<option value="E">Email</option>
														</c:when>
														<c:when test="${cont.tipo_contato.toString() == 'F' }">
															<option value="">Selecione</option>
															<option value="R">Telefone Residencial</option>
															<option value="C">Telefone Comercial</option>
															<option value="F" selected="selected">Celular</option>
															<option value="E">Email</option>
														</c:when>
														<c:when test="${cont.tipo_contato.toString() == 'E' }">
															<option value="">Selecione</option>
															<option value="R">Telefone Residencial</option>
															<option value="C">Telefone Comercial</option>
															<option value="F">Celular</option>
															<option value="E" selected="selected">Email</option>
														</c:when>
														<c:otherwise>
															<option value="" selected="selected">Selecione</option>
															<option value="R">Telefone Residencial</option>
															<option value="C">Telefone Comercial</option>
															<option value="F">Celular</option>
															<option value="E">Email</option>
														</c:otherwise>
													</c:choose>
												</select>
											</div>
											<div class="form-group col-lg-6">
												<label for="campoContato">Contato</label>
												<input value="${cont.valor_contato }" type="text" id="campoContato" name="pessoa.contato[${var }].valor_contato" class="form-control">
											</div>
											<div class="form-group col-lg-2" style="margin-top: 5px;">
												<br>
												<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning" type="button">Remover</button></a>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div class="row">
							<br>
							<br>
							<div class="box-actions col-lg-12">
								<c:if test="${editar != 1 }">
									<button type="submit" class="btn btn-success">Salvar</button>
								</c:if>
								<a href="<c:url value='/pessoa'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
								<c:if test="${excluir != 1 }">
									<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm"> Excluir </button>
								</c:if>
								<br>
								<br>
								<br>
							</div>
							<div class="modal fade" id="confirm" role="dialog">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-body">
											<p> Tem certeza que deseja excluir? </p>
										</div>
										<div class="modal-footer">
											<button type="button" data-dismiss="modal" class="btn btn-default"> Voltar </button>
											<a href="<c:url value='/pessoa/${pessoa.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete"> Confirmar </button></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<%-- Include all compiled plugins (below), or include individual files as needed --%>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='/bootstrap/select/dist/js/i18n/defaults-pt_BR.js'/>"></script>

</body>
</html>