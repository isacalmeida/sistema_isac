<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Novo </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/dashboard.css' />" />

<%-- jQuery (necessary for Bootstrap's JavaScript plugins) --%>
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/jquery.maskedinput.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/validator.min.js' />"></script>


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
$(function () {
	var divContent = $('#formendereco');
	var botaoAdicionar = $('a[data-id="2"]');
	var i = 1;
	
	$(botaoAdicionar).click(function () {
		if(i == 0){
			$('<div class="enderecoIndividual row"><div class="row"><div class="form-group col-lg-4" style="margin-top: 5px;"><br><a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a></div><div class="form-group col-lg-4"></div><div class="form-group col-lg-4"><label for="campoPrincipal">Principal</label><select id="campoPrincipal" name="pessoa.endereco['+i+'].principal" class="form-control" ><option value="true" selected="selected">Sim</option><option value="false">Não</option></select></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoTipoEndereco">Tipo*</label><select id="campoTipoEndereco" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control" ><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div><div class="form-group col-lg-4"><label for="campoTipoMoradia">Tipo Moradia</label><select id="campoTipoMoradia" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control" ><option value="" selected="selected">Selecione</option><option value="P">Própria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div><div class="form-group col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep" required></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoCidade">Cidade*</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade" required></div><div class="form-group col-lg-4"><label for="campoBairro">Bairro*</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro" required></div><div class="form-group col-lg-4"><label for="campoUf">UF*</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf" required></div></div><div class="row"><div class="form-group col-lg-8"><label for="campoLogradouro">Logradouro*</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro" required></div><div class="form-group col-lg-4"><label for="campoNumero">Número*</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero" required></div></div><div class="row"><div class="form-group col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div></div>').appendTo(divContent);    	
		}
		else{
			$('<div class="enderecoIndividual row"><div class="row"><div class="form-group col-lg-4" style="margin-top: 5px;"><br><a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a></div><div class="form-group col-lg-4"></div><div class="form-group col-lg-4"><label for="campoPrincipal">Principal</label><select id="campoPrincipal" name="pessoa.endereco['+i+'].principal" class="form-control" ><option value="true">Sim</option><option value="false" selected="selected">Não</option></select></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoTipoEndereco">Tipo*</label><select id="campoTipoEndereco" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control" ><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div><div class="form-group col-lg-4"><label for="campoTipoMoradia">Tipo Moradia</label><select id="campoTipoMoradia" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control" ><option value="" selected="selected">Selecione</option><option value="P">Própria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div><div class="form-group col-lg-4"><label for="campoCep">CEP*</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep"></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoCidade">Cidade</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade"></div><div class="form-group col-lg-4"><label for="campoBairro">Bairro</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro"></div><div class="form-group col-lg-4"><label for="campoUf">UF</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf"></div></div><div class="row"><div class="form-group col-lg-8"><label for="campoLogradouro">Logradouro</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro"></div><div class="form-group col-lg-4"><label for="campoNumero">Número</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero"></div></div><div class="row"><div class="form-group col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div></div>').appendTo(divContent);    	
		}
		$('#removehidden').remove();
		i++;
	});
	
	$('#formendereco').on('click', '.removerEndereco', function () {
		$(this).parents('.enderecoIndividual').remove();
		i--;
	});
});
</script>

<script type="text/javascript">
$(function () {
	var divContent = $('#formcontato');
	var botaoAdicionar = $('a[data-id="1"]');
	var i = 1;
	
	$(botaoAdicionar).click(function () {
		if(i == 0){
			$('<div class="contatoIndividual row"><div class="form-group col-lg-4"><label for="campoTipoContato">Tipo Contato*</label><select id="campoTipoContato" name="pessoa.contato['+i+'].tipo_contato" class="form-control" ><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div><div class="form-group col-lg-6"><label for="campoContato">Contato*</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control" required></div><div class="form-group col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
		else{
			$('<div class="contatoIndividual row"><div class="form-group col-lg-4"><label for="campoTipoContato">Tipo Contato</label><select id="campoTipoContato" name="pessoa.contato['+i+'].tipo_contato" class="form-control" ><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div><div class="form-group col-lg-6"><label for="campoContato">Contato</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control"></div><div class="form-group col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning" type="button">Remover</button></a></div></div>').appendTo(divContent);
		}
		$('#removehidden').remove();
		i++;
	});

	$('#formcontato').on('click', '.removerContato', function () {
		$(this).parents('.contatoIndividual').remove();
		i--;
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
					<form class="navbar-form" method="GET" action="<c:url value='/menu'/>" >
						<input type="text" class="form-control" placeholder="Pesquisar ...">
					</form>
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
				<li class="active"> Novo </li>
			</ol>
			<form id="formPessoa" role="form" data-toggle="validator" method="post" action='<c:url value="/pessoa/salvar"/>'>
				<div class="row">
					<div class="col-lg-3">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<img class="img-thumbnail" id="imagemPessoa" src="<c:url value="/imagem/pessoa/avatarpadrao.png" />">
						</div>
						<div class="col-lg-2"></div>
					</div>
					<div class="form-group col-lg-6">
						<div class="row">
							<label for="campoImagem">Imagem</label>
							<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" name="pessoa.imagem">
						</div>
						<br>
						<div class="row">
							<label for="campoCodigo">Codigo</label>
							<input type="text" id="campoCodigo" class="form-control" name="pessoa.codigo" disabled>
						</div>
					</div>
					<div class="col-lg-3"></div>
				</div>
				<fieldset>
					<br>
					<ul class="nav nav-tabs responsive">
						<li class="active"><a data-toggle="tab" href="#basico">Basico</a></li>
						<li><a data-toggle="tab" href="#adicional">Adicional</a></li>
						<li><a data-toggle="tab" href="#endereco">Endereco</a></li>
						<li><a data-toggle="tab" href="#contato">Contato</a></li>
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
											<select id="campoTipo" class="form-control" name="pessoa.tipo" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');">
												<option value="F" selected="selected">Física</option>
												<option value="J">Jurídica</option>
											</select>
										</div>
									</div>
									<div id="fisica" style="display: block">
										<div class="row" >
											<div class="form-group col-lg-12">
												<label for="campoNome">Nome Completo*</label>
												<input type="text" id="campoNome" class="form-control" name="pessoa.nome" required>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCpf">CPF*</label>
												<input type="text" id="campoCpf" class="form-control cpf-mask" name="pessoa.cpf" required>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIdentidade">Identidade</label>
												<input type="text" id="campoIdentidade" class="form-control" name="pessoa.identidade">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoEmisIden">Data Emissão Identidade</label>
												<input type="text" id="campoEmisIden" class="form-control" name="pessoa.data_emissao">
											</div>
										</div>
									</div>
									<div id="juridica" style="display: none">
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoRazao">Razão Social*</label>
												<input type="text" id="campoRazao" class="form-control" name="pessoa.razao">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoFantasia">Nome Fantasia</label>
												<input type="text" id="campoFantasia" class="form-control" name="pessoa.fantasia">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCnpj">CNPJ*</label>
												<input type="text" id="campoCnpj" class="form-control" name="pessoa.cnpj">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIe">Inscrição Estadual</label>
												<input type="text" id="campoIe" class="form-control" name="pessoa.inscricao_estadual">
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
							</div>
							<div class="row">
								<div class="form-group col-lg-4">
									<label for="campoCliente">Cliente</label>
									<select id="campoCliente" name="pessoa.cliente" class="form-control" >
										<option value="true" selected="selected">Sim</option>
										<option value="false">Não</option>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoFornecedor">Fornecedor</label>
									<select id="campoFornecedor" name="pessoa.fornecedor" class="form-control" >
										<option value="true">Sim</option>
										<option value="false" selected="selected">Não</option>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoAtivo">Ativo</label>
									<select id="campoAtivo" name="pessoa.ativo" class="form-control" >
										<option value="true" selected="selected">Sim</option>
										<option value="false">Não</option>
									</select>
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
											<input type="text" id="campoDataNascimento" class="form-control" name="pessoa.data_nascimento">
										</div>
									</div>
									<div class="row" >
										<div class="form-group col-lg-12">
											<label for="campoSexo">Sexo</label>
											<select id="campoSexo" name="pessoa.sexo" class="form-control">
												<option value="" selected="selected">Selecione</option>
												<option value="M">Masculino</option>
												<option value="F">Feminino</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoEstCivil">Estado Civil</label>
											<select id="campoEstCivil" name="pessoa.estado_civil" class="form-control">
												<option value="" selected="selected">Selecione</option>
												<option value="S">Solteiro(a)</option>
												<option value="C">Casado(a)</option>
												<option value="D">Divorciado(a)</option>
												<option value="V">Viúvo(a)</option>
												<option value="U">União Estável</option>
												<option value="O">Outros</option>
											</select>
										</div>
									</div>
								</div>
								<div id="juridica1" style="display: none">
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoDataFundacao">Data de Fundação</label>
											<input type="date" id="campoDataFundacao" class="form-control" name="pessoa.data_fundacao">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoFinalidade">Finalidade</label>
											<select id="campoFinalidade" name="pessoa.finalidade" class="form-control">
												<option value="C" selected="selected">Consumidor</option>
												<option value="R">Revendedor</option>
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
									<div class="enderecoIndividual row">
										<div class="row">
											<div class="form-group col-lg-4" style="margin-top: 5px;">
												<br>
												<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a>
											</div>
											<div class="form-group col-lg-4"></div>
											<div class="form-group col-lg-4">
												<label for="campoPrincipal">Principal</label>
												<select id="campoPrincipal" name="pessoa.endereco[0].principal" class="form-control" >
													<option value="true" selected="selected">Sim</option>
													<option value="false">Não</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-4">
												<label for="campoTipoEndereco">Tipo*</label>
												<select id="campoTipoEndereco" name="pessoa.endereco[0].tipo_endereco" class="form-control">
													<option value="" selected="selected">Selecione</option>
													<option value="C">Comercial</option>
													<option value="R">Residencial</option>
												</select>
											</div>
											<div class="form-group col-lg-4">
												<label for="campoTipoMoradia">Tipo Moradia</label>
												<select id="campoTipoMoradia" name="pessoa.endereco[0].tipo_moradia" class="form-control" >
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
								</div>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<div id="contato" class="tab-pane">	
							<div class="col-sm-1">
								<div class="form-group col-lg-12" style="margin-top: 5px;">
									<br>
									<a data-toggle="tab" href="#contato" data-id="1" id="adicionarContato"><button class="btn btn-default" type="button">Novo</button></a>
								</div>
							</div>
							<div class="col-sm-10">
								<div id="formcontato">
									<div class="contatoIndividual row">
										<div class="form-group col-lg-4">
											<label for="campoTipoContato">Tipo Contato</label>
											<select id="campoTipoContato" name="pessoa.contato[0].tipo_contato" class="form-control" >
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
								</div>
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div class="row">
							<br>
							<div class="box-actions col-lg-12">
								<button type="submit" class="btn btn-success">Salvar</button>
								<a href="<c:url value='/pessoa'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<br>
<br>

<%-- Include all compiled plugins (below), or include individual files as needed --%>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>