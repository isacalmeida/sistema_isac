<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script type="text/javascript">
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
			<h3 class="page-header"><span class="glyphicon glyphicon-chevron-right"></span> Pessoas </h3>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/pessoa'/>"> Pessoas </a></li>
				<li class="active"> Novo </li>
			</ol>
			<form role="form" method="post" action='<c:url value="/pessoa/salvar"/>'>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="form-group col-lg-8">
						<label for="campoCodigo">Codigo</label>
						<input type="number" id="campoCodigo" class="form-control" name="codigo" disabled>
					</div>
					<div class="col-lg-2"></div>
				</div>
				<fieldset>
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
								<div class="col-sm-1">
								</div>
								<div class="col-sm-10">
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoTipo">Tipo de Pessoa</label>
											<select id="campoTipo" class="form-control" name="tipo" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');">
												<option value="F" selected="selected">Física</option>
												<option value="J">Jurídica</option>
											</select>
										</div>
									</div>
									<div id="fisica" style="display: block">
										<div class="row" >
											<div class="form-group col-lg-12">
												<label for="campoNome">Nome Completo</label>
												<input type="text" id="campoNome" class="form-control" name="nome" placeholder="Informe o nome">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCpf">CPF</label>
												<input type="text" id="campoNome" class="form-control" name="cpf" placeholder="Informe o cpf">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIdentidade">Identidade</label>
												<input type="text" id="campoIdentidade" class="form-control" name="identidade" placeholder="Informe a identidade">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoEmisIden">Data Emissão Identidade</label>
												<input type="date" id="campoEmisIden" class="form-control" name="dtemissident" placeholder="Informe a data de emissão">
											</div>
										</div>
									</div>
									<div id="juridica" style="display: none">
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoRazao">Razão Social</label>
												<input type="text" id="campoRazao" class="form-control" name="razao" placeholder="Informe a razão social">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoFantasia">Nome Fantasia</label>
												<input type="text" id="campoFantasia" class="form-control" name="fantasia" placeholder="Informe o nome fantasia">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoCnpj">CNPJ</label>
												<input type="text" id="campoCnpj" class="form-control" name="cnpj" placeholder="Informe o cnpj">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-lg-12">
												<label for="campoIe">Inscrição Estadual</label>
												<input type="text" id="campoIe" class="form-control" name="ie" placeholder="Informe a inscrição estadual">
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-1">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-lg-4">
									<label for="campoCliente">Cliente</label>
									<select id="campoCliente" name="cliente" class="form-control" >
										<option value="true" selected="selected">Sim</option>
										<option value="false">Não</option>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoFornecedor">Fornecedor</label>
									<select id="campoFornecedor" name="fornecedor" class="form-control" >
										<option value="true">Sim</option>
										<option value="false" selected="selected">Não</option>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoAtivo">Ativo</label>
									<select id="campoAtivo" name="ativo" class="form-control" >
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
											<input type="date" id="campoDataNascimento" class="form-control" name="data_nascimento" placeholder="Informe a data de nascimento">
										</div>
									</div>
									<div class="row" >
										<div class="form-group col-lg-12">
											<label for="campoSexo">Sexo</label>
											<select id="campoSexo" name="nome" class="form-control">
												<option value="null" selected="selected">Selecione</option>
												<option value="M">Masculino</option>
												<option value="F">Feminino</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoEstCivil">Estado Civil</label>
											<select id="campoEstCivil" name="estado_civil" class="form-control">
												<option value="null" selected="selected">Selecione</option>
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
											<input type="date" id="campoDataFundacao" class="form-control" name="data_fundacao" placeholder="Informe a data de fundação">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
											<label for="campoFinalidade">Finalidade</label>
											<select id="campoFinalidade" name="finalidade" class="form-control">
												<option value="R" selected="selected">Revendedor</option>
												<option value="C">Consumidor</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<div id="endereco" class="tab-pane">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<div class="row">
									<div class="form-group col-lg-4">
										<button>Novo Endereço</button>
									</div>
									<div class="form-group col-lg-4">
										<button>Remover Endereço</button>
									</div>
									<div class="form-group col-lg-4">
										<label for="campoPrincipal">Principal</label>
										<select id="campoPrincipal" name="principal" class="form-control" >
											<option value="true" selected="selected">Sim</option>
											<option value="false">Não</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-lg-4">
										<label for="campoTipoEndereco">Tipo</label>
										<select id="campoTipoEndereco" name="tipo_endereco" class="form-control" >
											<option value="null" selected="selected">Selecione</option>
											<option value="C">Comercial</option>
											<option value="R">Residencial</option>
										</select>
									</div>
									<div class="form-group col-lg-4">
										<label for="campoTipoMoradia">Tipo Moradia</label>
										<select id="campoTipoMoradia" name="tipo_moradia" class="form-control" >
											<option value="null" selected="selected">Selecione</option>
											<option value="P">Própria</option>
											<option value="A">Alugada</option>
											<option value="F">Financiada</option>
											<option value="O">Outros</option>
										</select>
									</div>
									<div class="form-group col-lg-4">
										<label for="campoCep">CEP</label>
										<input type="text" id="campoCep" class="form-control" name="cep" placeholder="Informe o cep">
									</div>
								</div>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<div id="contato" class="tab-pane">	
							<br>
						</div>
						<div class="row">
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>