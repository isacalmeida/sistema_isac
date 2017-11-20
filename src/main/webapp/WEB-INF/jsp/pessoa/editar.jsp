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
function endereco() {
	var divContent = $('#formendereco');
	var botaoAdicionar = $('a[data-id="2"]');
	var i = 1;
	i = localStorage.getItem("varendereco");
	$(botaoAdicionar).click(function () {
		$('<div class="enderecoIndividual row"><div class="row"><div class="form-group col-lg-4" style="margin-top: 5px;"><br><a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button">Remover Endereço</button></a></div><div class="form-group col-lg-4"></div><div class="form-group col-lg-4"><label for="campoPrincipal">Principal</label><select id="campoPrincipal" name="pessoa.endereco['+i+'].principal" class="form-control" ><option value="true">Sim</option><option value="false" selected="selected">Não</option></select></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoTipoEndereco">Tipo</label><select id="campoTipoEndereco" name="pessoa.endereco['+i+'].tipo_endereco" class="form-control" ><option value="" selected="selected">Selecione</option><option value="C">Comercial</option><option value="R">Residencial</option></select></div><div class="form-group col-lg-4"><label for="campoTipoMoradia">Tipo Moradia</label><select id="campoTipoMoradia" name="pessoa.endereco['+i+'].tipo_moradia" class="form-control" ><option value="" selected="selected">Selecione</option><option value="P">Própria</option><option value="A">Alugada</option><option value="F">Financiada</option><option value="O">Outros</option></select></div><div class="form-group col-lg-4"><label for="campoCep">CEP</label><input type="text" id="campoCep" class="form-control" name="pessoa.endereco['+i+'].cep"></div></div><div class="row"><div class="form-group col-lg-4"><label for="campoCidade">Cidade</label><input type="text" id="campoCidade" class="form-control" name="pessoa.endereco['+i+'].cidade"></div><div class="form-group col-lg-4"><label for="campoBairro">Bairro</label><input type="text" id="campoBairro" class="form-control" name="pessoa.endereco['+i+'].bairro"></div><div class="form-group col-lg-4"><label for="campoUf">UF</label><input type="text" id="campoUf" class="form-control" name="pessoa.endereco['+i+'].uf"></div></div><div class="row"><div class="form-group col-lg-8"><label for="campoLogradouro">Logradouro</label><input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco['+i+'].logradouro"></div><div class="form-group col-lg-4"><label for="campoNumero">Número</label><input type="text" id="campoNumero" class="form-control" name="pessoa.endereco['+i+'].numero"></div></div><div class="row"><div class="form-group col-lg-12"><label for="campoComplemento">Complemento</label><textarea id="campoComplemento" class="form-control" name="pessoa.endereco['+i+'].complemento"></textarea></div></div></div>').appendTo(divContent);    	
		$('#removehidden').remove();
		i++;
	});
	
	$('#formendereco').on('click', '.removerEndereco', function () {
		$(this).parents('.enderecoIndividual').remove();
		i--;
	});
}
</script>

<script type="text/javascript">
function contato() {
	var divContent = $('#formcontato');
	var botaoAdicionar = $('a[data-id="1"]');
	var i = 1;
	i = localStorage.getItem("varcontato");
	$(botaoAdicionar).click(function () {
		$('<div class="contatoIndividual row"><div class="form-group col-lg-4"><label for="campoTipoContato">Tipo Contato</label><select id="campoTipoContato" name="pessoa.contato['+i+'].tipo_contato" class="form-control" ><option value="" selected="selected">Selecione</option><option value="R">Telefone Residencial</option><option value="C">Telefone Comercial</option><option value="F">Celular</option><option value="E">Email</option></select></div><div class="form-group col-lg-6"><label for="campoContato">Contato</label><input type="text" id="campoContato" name="pessoa.contato['+i+'].valor_contato" class="form-control"></div><div class="form-group col-lg-2" style="margin-top: 5px;"><br><a data-toggle="tab" href="#contato" class="removerContato"><button class="btn btn-warning" type="button">Remover</button></a></div></div>').appendTo(divContent);
		$('#removehidden').remove();
		i++;
	});
	$('#formcontato').on('click', '.removerContato', function () {
		$(this).parents('.contatoIndividual').remove();
		i--;
	});
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
							<c:choose>
								<c:when test="${pessoa.imagem == null }">
									<img class="img-thumbnail" id="imagemPessoa" src="<c:url value="/bootstrap/img/avatarpadrao.png" />">
								</c:when>
								<c:otherwise>
									<c:set var="imagem" value="data:image/bin;base64,${pessoa.imagem }" />
									<img class="img-thumbnail" id="imagemPessoa" src="${imagem }">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-lg-2"></div>
					</div>
					<div class="form-group col-lg-6">
						<div class="row">
							<label for="campoImagem">Imagem</label>
							<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" name="pessoa.imagem" >
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
											<select id="campoTipo" class="form-control" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');" disabled>
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
								<div class="form-group col-lg-4">
									<label for="campoCliente">Cliente</label>
									<select id="campoCliente" name="pessoa.cliente" class="form-control" >
										<c:choose>
											<c:when test="${pessoa.cliente == true}">
												<option value="true" selected="selected">Sim</option>
												<option value="false">Não</option>
											</c:when>
											<c:when test="${pessoa.cliente == false}">
												<option value="true">Sim</option>
												<option value="false" selected="selected">Não</option>
											</c:when>
										</c:choose>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoFornecedor">Fornecedor</label>
									<select id="campoFornecedor" name="pessoa.fornecedor" class="form-control" >
										<c:choose>
											<c:when test="${pessoa.fornecedor == true}">
												<option value="true" selected="selected">Sim</option>
												<option value="false">Não</option>
											</c:when>
											<c:when test="${pessoa.fornecedor == false}">
												<option value="true">Sim</option>
												<option value="false" selected="selected">Não</option>
											</c:when>
										</c:choose>
									</select>
								</div>
								<div class="form-group col-lg-4">
									<label for="campoAtivo">Ativo</label>
									<select id="campoAtivo" name="pessoa.ativo" class="form-control" >
										<c:choose>
											<c:when test="${pessoa.ativo == true}">
												<option value="true" selected="selected">Sim</option>
												<option value="false">Não</option>
											</c:when>
											<c:when test="${pessoa.ativo == false}">
												<option value="true">Sim</option>
												<option value="false" selected="selected">Não</option>
											</c:when>
										</c:choose>
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
											<input value="${pessoa.data_nascimento }" type="text" id="campoDataNascimento" class="form-control" name="pessoa.data_nascimento">
										</div>
									</div>
									<div class="row" >
										<div class="form-group col-lg-12">
											<label for="campoSexo">Sexo</label>
											<select id="campoSexo" name="pessoa.sexo" class="form-control">
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
											<select id="campoEstCivil" name="pessoa.estado_civil" class="form-control">
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
											<select id="campoFinalidade" name="pessoa.finalidade" class="form-control">
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
									<a data-toggle="tab" href="#endereco" data-id="2" id="adicionarEndereco" ><button class="btn btn-default" type="button" onclick="endereco();">Novo</button></a>
								</div>
							</div>
							<div class="col-sm-10">
								<div id="formendereco">
									<c:if test="${qtdendereco == 0 }">
										<div class="enderecoIndividual row">
											<div class="row">
												<div class="form-group col-lg-4" style="margin-top: 5px;">
													<br>
													<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button" onclick="endereco();">Remover Endereço</button></a>
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
									</c:if>
									<c:set var="var" value="-1" />
									<c:forEach var="end" items="${pessoa.endereco }">
										<c:if test="${end.codigo != null}">
											<c:set var="var" value="${var=var+1 }" />
											<div class="enderecoIndividual row">
												<%-- <input type="hidden" name="pessoa.endereco[${var }].codigo" value="${end.codigo}"> --%>
												<div class="row">
													<div class="form-group col-lg-4" style="margin-top: 5px;">
														<br>
														<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning" type="button" onclick="endereco();">Remover Endereço</button></a>
													</div>
													<div class="form-group col-lg-4"></div>
													<div class="form-group col-lg-4">
														<label for="campoPrincipal">Principal</label>
														<select id="campoPrincipal" name="pessoa.endereco[${var }].principal" class="form-control" >
															<c:choose>
																<c:when test="${end.principal == true}">
																	<option value="true" selected="selected">Sim</option>
																	<option value="false">Não</option>
																</c:when>
																<c:when test="${end.principal == false}">
																	<option value="true">Sim</option>
																	<option value="false" selected="selected">Não</option>
																</c:when>
															</c:choose>
														</select>
													</div>
												</div>
												<div class="row">
													<div class="form-group col-lg-4">
														<label for="campoTipoEndereco">Tipo</label>
														<select id="campoTipoEndereco" name="pessoa.endereco[${var }].tipo_endereco" class="form-control" >
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
														<select id="campoTipoMoradia" name="pessoa.endereco[${var }].tipo_moradia" class="form-control" >
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
									<a data-toggle="tab" href="#contato" data-id="1" onclick="recebevar(${var})" id="adicionarContato"><button class="btn btn-default" type="button" onclick="contato();">Novo</button></a>
								</div>
							</div>
							<div class="col-sm-10">
								<div id="formcontato">
									<c:if test="${qtdcontato == 0 }">
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
												<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning" type="button" onclick="contato();">Remover</button></a>
											</div>
										</div>
									</c:if>
									<c:set var="var" value="-1" />
									<c:forEach var="cont" items="${pessoa.contato }">
										<c:set var="var" value="${var=var+1}" />
										<div class="contatoIndividual row">
											<%-- <input type="hidden" name="pessoa.contato[${var }].codigo" value="${cont.codigo}"> --%>
											<div class="form-group col-lg-4">
												<label for="campoTipoContato">Tipo Contato</label>
												<select id="campoTipoContato" name="pessoa.contato[${var }].tipo_contato" class="form-control" >
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
												<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning" type="button" onclick="contato();">Remover</button></a>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div class="row">
							<br>
							<div class="box-actions col-lg-12">
								<button type="submit" class="btn btn-success">Salvar</button>
								<a href="<c:url value='/pessoa'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
								<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirm"> Excluir </button>
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

</body>
</html>