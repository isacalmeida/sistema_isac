<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

</head>

<body class="hold-transition skin-blue sidebar-mini" <c:if test="${var == 2 }" >onload="toastSuccess()"</c:if><c:if test="${var == 0 }" >onload="toastDanger()"</c:if> >

<div class="wrapper">
	<header class="main-header">
		<a href="<c:url value='/menu' />" class="logo">
			<span class="logo-mini"><b>S</b>I</span>
			<span class="logo-lg"><b>Sistema </b> Isac</span>
		</a>
    	<nav class="navbar navbar-static-top">
			<a href="" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
          			<li class="dropdown notifications-menu">
          				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
          					<i class="fa fa-bell-o"></i>
          					<span class="label label-warning">10</span>
          				</a>
          				<ul class="dropdown-menu">
          					<li class="header">You have 10 notifications</li>
          					<li>
          						<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li>
										<a href="#">
											<i class="fa fa-users text-aqua"></i> 5 new members joined today
										</a>
									</li>
								</ul>
							</li>
							<li class="footer"><a href="#">View all</a></li>
						</ul>
					</li>
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<c:url value='${usuario_foto }' />" class="user-image" alt="User Image">
							<span class="hidden-xs"><c:out value="${usuario_nome }" /></span>
						</a>
						<ul class="dropdown-menu">
							<li class="user-header">
								<img src="<c:url value='${usuario_foto }' />" class="img-circle" alt="User Image">
								<p>
									<c:out value="${usuario_nome }" /> - <c:out value="${usuario_perfil }" />
									<small>Colaborador desde <c:out value="${usuario_colaborador }" /></small>
								</p>
							</li>
							<li class="user-footer">
								<div class="pull-left">
									<a href="" class="btn btn-default btn-flat">Perfil</a>
								</div>
								<div class="pull-right">
									<a href="<c:url value='/login/sair'/>" class="btn btn-default btn-flat">Sair</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<aside class="main-sidebar">
		<section class="sidebar">
			<form action="<c:url value='/busca' />" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control" placeholder="Pesquisar ...">
					<span class="input-group-btn">
						<button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">MENU PRINCIPAL</li>
				<li class="treeview">
					<a href="<c:url value='/menu' />" >
						<i class="fa fa-folder"></i>
						<span>Início</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Dashboard</a></li>
						<li><a href="<c:url value='/menu/cadastros' />" ><i class="fa fa-pencil-square-o"></i> Cadastros</a></li>
						<li><a href="<c:url value='/menu/configuracoes' />" ><i class="fa fa-gear"></i> Configurações</a></li>
					</ul>
				</li>
				<li class="treeview">
					<a href="<c:url value='/menu/cadastros' />" >
						<i class="fa fa-pencil-square-o"></i>
						<span>Cadastros</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="<c:url value='/pessoa' />" ><i class="fa fa-user"></i> Pessoa</a></li>
						<li><a href="<c:url value='/produto' />" ><i class="fa fa-glass"></i> Produto</a></li>
					</ul>
				</li>
				<li class="treeview">
					<a href="<c:url value='/menu/configuracoes' />">
						<i class="fa fa-gear"></i>
						<span>Configurações</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="treeview">
							<a href=""><i class="fa fa-circle-o"></i> Pessoa
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">
								<li>
									<a href="<c:url value='/perfil_acesso' />">
										<i class="fa fa-sliders"></i>
										Perfil de Acesso
									</a>
								</li>
								<li>
									<a href="<c:url value='/usuario' />">
										<i class="fa fa-users"></i>
										Usuário
									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href=""><i class="fa fa-circle-o"></i> Produto
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">
								<li>
									<a href="<c:url value='/cor' />">
										<i class="fa fa-sliders"></i>
										Cor
									</a>
								</li>
								<li>
									<a href="<c:url value='/departamento' />">
										<i class="fa fa-users"></i>
										Departamento
									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href=""><i class="fa fa-circle-o"></i> Outros
								<span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">
								<li>
									<a href="<c:url value='/acessos' />">
										<i class="fa fa-sliders"></i>
										Acessos
									</a>
								</li>
								<li>
									<a href="<c:url value='/configuracoes' />">
										<i class="fa fa-users"></i>
										Geral
									</a>
								</li>
								<li>
									<a href="<c:url value='/programas' />">
										<i class="fa fa-users"></i>
										Programas
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</section>
	</aside>
	
	<div class="content-wrapper">
		<section class="content-header">
			<h1>
				Pessoa
				<small>Cadastro de pessoa física e jurídica</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/cadastros' />" >Cadastros</a></li>
				<li><a href="<c:url value='/pessoa' />" >Pessoa</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/pessoa/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${pessoa.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">Última alteração em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${pessoa.alteracao }" disabled>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">	
								<img class="img-thumbnail" id="imagemProduto" src="<c:url value='${pessoa.imagem }' />">
								<input type="text" name="pessoa.imagem" value="${pessoa.imagem }" hidden="hidden">
							</div>
							<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
								<label for="campoImagem">Imagem</label>
								<input id="campoImagem" class="form-control" type="file" data-max-size="10485760">
							</div>
							<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
								<label for="campoCodigo">Codigo</label>
								<input type="text" id="campoCodigo" class="form-control" value="${pessoa.codigo }" disabled>
								<input type="hidden" name="pessoa.codigo" value="${pessoa.codigo }">
							</div>
						</div>
					</div>
					<div class="box-body">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#basico">Basico</a></li>
								<li><a data-toggle="tab" href="#adicional">Adicional</a></li>
								<li><a data-toggle="tab" href="#endereco">Endereco</a></li>
								<li><a data-toggle="tab" href="#contato">Contato</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="basico">
									<div class="row">
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<label for="campoTipo">Tipo de Pessoa</label>
											<div class="input-group">
												<span class="input-group-btn">
													<button class="btn btn-default btn-flat" type="button">
														<span class="glyphicon glyphicon-search"></span>
													</button>
												</span>
												<select id="campoTipo" class="form-control select2" name="pessoa.tipo" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');" disabled>
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
												<input value="${pessoa.tipo }" id="campoTipo" class="hidden" name="pessoa.tipo">
											</div>
										</div>
										<div id="fisica" <c:if test="${pessoa.tipo.toString() eq 'J'}"> style="display: none" </c:if>>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoNome">Nome Completo</label>
												<input value="${pessoa.nome }" type="text" id="campoNome" class="form-control" name="pessoa.nome">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoCpf">CPF</label>
												<input value="${pessoa.cpf }"type="text" id="campoCpf" class="form-control" name="pessoa.cpf">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoIdentidade">Identidade</label>
												<input value="${pessoa.identidade }" type="text" id="campoIdentidade" class="form-control" name="pessoa.identidade">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoEmisIden">Data Emissão Identidade</label>
												<input value="${pessoa.data_emissao }" type="text" id="campoEmisIden" class="form-control" name="pessoa.data_emissao">
											</div>
										</div>
										<div id="juridica" <c:if test="${pessoa.tipo.toString() eq 'F'}"> style="display: none" </c:if>>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoRazao">Razão Social</label>
												<input value="${pessoa.razao }" type="text" id="campoRazao" class="form-control" name="pessoa.razao">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoFantasia">Nome Fantasia</label>
												<input value="${pessoa.fantasia }" type="text" id="campoFantasia" class="form-control" name="pessoa.fantasia">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoCnpj">CNPJ</label>
												<input value="${pessoa.cnpj }" type="text" id="campoCnpj" class="form-control" name="pessoa.cnpj">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoIe">Inscrição Estadual</label>
												<input value="${pessoa.inscricao_estadual }" type="text" id="campoIe" class="form-control">
											</div>
										</div>
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoCliente">Cliente</label>
												<div id="campoCliente">
													<c:choose>
														<c:when test="${pessoa.cliente == true}">
															<input id="checkSwitch" name="pessoa.cliente" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
														<c:when test="${pessoa.cliente == false}">
															<input id="checkSwitch" name="pessoa.cliente" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoFornecedor">Fornecedor</label>
												<div id="campoFornecedor">
													<c:choose>
														<c:when test="${pessoa.fornecedor == true}">
															<input id="checkSwitch" name="pessoa.fornecedor" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
														<c:when test="${pessoa.fornecedor == false}">
															<input id="checkSwitch" name="pessoa.fornecedor" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoAtivo">Ativo</label>
												<div id="campoAtivo">
													<c:choose>
														<c:when test="${pessoa.ativo == true}">
															<input id="checkSwitch" name="pessoa.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
														<c:when test="${pessoa.ativo == false}">
															<input id="checkSwitch" name="pessoa.ativo" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="adicional">
									<div class="row">
										<div id="fisica1" <c:if test="${pessoa.tipo.toString() eq 'J'}"> style="display: none" </c:if>>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoDataNascimento">Data de Nascimento</label>
													<input value="${pessoa.data_nascimento }" type="text" id="campoDataNascimento" class="form-control" name="pessoa.data_nascimento">
												</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoSexo">Sexo</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default btn-flat" type="button" data-select2-open="campoSexo">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<select id="campoSexo" name="pessoa.sexo" class="form-control select2">
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
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoEstCivil">Estado Civil</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default btn-flat" type="button" data-select2-open="campoEstCivil">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<select id="campoEstCivil" name="pessoa.estado_civil" class="form-control select2">
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
										<div id="juridica1" <c:if test="${pessoa.tipo.toString() eq 'F'}"> style="display: none" </c:if>>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoDataFundacao">Data de Fundação</label>
												<input value="${pessoa.data_fundacao }" type="text" id="campoDataFundacao" class="form-control" name="pessoa.data_fundacao">
											</div>
											<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<label for="campoFinalidade">Finalidade</label>
												<div class="input-group">
													<span class="input-group-btn">
														<button class="btn btn-default btn-flat" type="button" data-select2-open="campoFinalidade">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<select id="campoFinalidade" name="pessoa.finalidade" class="form-control select2">
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
								</div>
								<div class="tab-pane" id="endereco">
									<div class="row">
										<div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<br>
												<a data-toggle="tab" href="#endereco" data-id="2" id="adicionarEndereco" ><button class="btn btn-default btn-flat" type="button">Novo</button></a>
											</div>
										</div>
										<div class="col-xs-9 col-sm-10 col-md-11 col-lg-11">
											<div id="formendereco">
												<c:if test="${qtdendereco == 0 }">
													<div class="enderecoIndividual">
														<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
															<br>
															<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning btn-flat" type="button">Remover Endereço</button></a>
														</div>
														<div class="col-xs-hidden col-sm-7 col-md-7 col-lg-7"></div>
														<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
															<label for="campoPrincipal">Principal</label>
															<div id="campoPrincipal">
																<input id="checkSwitch" name="pessoa.endereco[0].principal" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
															</div>
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoTipoEndereco0">Tipo*</label>
															<div class="input-group">
																<span class="input-group-btn">
																	<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoEndereco0">
																		<span class="glyphicon glyphicon-search"></span>
																	</button>
																</span>
																<select id="campoTipoEndereco0" name="pessoa.endereco[0].tipo_endereco" class="form-control select2">
																	<option value="" selected="selected">Selecione</option>
																	<option value="C">Comercial</option>
																	<option value="R">Residencial</option>
																</select>
															</div>
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoTipoMoradia0">Tipo Moradia</label>
															<div class="input-group">
																<span class="input-group-btn">
																	<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoMoradia0">
																		<span class="glyphicon glyphicon-search"></span>
																	</button>
																</span>
																<select id="campoTipoMoradia0" name="pessoa.endereco[0].tipo_moradia" class="form-control select2">
																	<option value="" selected="selected">Selecione</option>
																	<option value="P">Própria</option>
																	<option value="A">Alugada</option>
																	<option value="F">Financiada</option>
																	<option value="O">Outros</option>
																</select>
															</div>
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoCep">CEP</label>
															<input type="text" id="campoCep" class="form-control" name="pessoa.endereco[0].cep">
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoCidade">Cidade</label>
															<input type="text" id="campoCidade" class="form-control" name="pessoa.endereco[0].cidade">
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoBairro">Bairro</label>
															<input type="text" id="campoBairro" class="form-control" name="pessoa.endereco[0].bairro">
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoUf">UF</label>
															<input type="text" id="campoUf" class="form-control" name="pessoa.endereco[0].uf">
														</div>
														<div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8">
															<label for="campoLogradouro">Logradouro</label>
															<input type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco[0].logradouro">
														</div>
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoNumero">Número</label>
															<input type="text" id="campoNumero" class="form-control" name="pessoa.endereco[0].numero">
														</div>
														<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<label for="campoComplemento">Complemento</label>
															<textarea id="campoComplemento" class="form-control" name="pessoa.endereco[0].complemento"></textarea>
														</div>
													</div>
												</c:if>
												<c:set var="var" value="-1" />
												<c:forEach var="end" items="${pessoa.endereco }">
													<c:if test="${end.codigo != null }">
														<c:set var="var" value="${var=var+1 }" />
														<div class="enderecoIndividual">
															<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
																<br>
																<a data-toggle="tab" href="#endereco" class="removerEndereco" ><button class="btn btn-warning btn-flat" type="button">Remover Endereço</button></a>
															</div>
															<div class="col-xs-hidden col-sm-7 col-md-7 col-lg-7"></div>
															<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
																<label for="campoPrincipal">Principal</label>
																<div id="campoPrincipal">
																	<c:choose>
																		<c:when test="${end.principal == true }">
																			<input id="checkSwitch" name="pessoa.endereco[${var }].principal" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
																		</c:when>
																		<c:when test="${end.principal == false }">
																			<input id="checkSwitch" name="pessoa.endereco[${var }].principal" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
																		</c:when>
																	</c:choose>
																</div>
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoTipoEndereco${var }">Tipo*</label>
																<div class="input-group">
																	<span class="input-group-btn">
																		<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoEndereco${var }">
																			<span class="glyphicon glyphicon-search"></span>
																		</button>
																	</span>
																	<select id="campoTipoEndereco${var }" name="pessoa.endereco[${var }].tipo_endereco" class="form-control select2">
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
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoTipoMoradia${var }">Tipo Moradia</label>
																<div class="input-group">
																	<span class="input-group-btn">
																		<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoMoradia${var }">
																			<span class="glyphicon glyphicon-search"></span>
																		</button>
																	</span>
																	<select id="campoTipoMoradia${var }" name="pessoa.endereco[${var }].tipo_moradia" class="form-control select2">
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
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoCep">CEP</label>
																<input value="${end.cep }" type="text" id="campoCep" class="form-control" name="pessoa.endereco[${var }].cep">
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoCidade">Cidade</label>
																<input value="${end.cidade }" type="text" id="campoCidade" class="form-control" name="pessoa.endereco[${var }].cidade">
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoBairro">Bairro</label>
																<input value="${end.bairro }" type="text" id="campoBairro" class="form-control" name="pessoa.endereco[${var }].bairro">
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoUf">UF</label>
																<input value="${end.uf }" type="text" id="campoUf" class="form-control" name="pessoa.endereco[${var }].uf">
															</div>
															<div class="form-group col-xs-12 col-sm-8 col-md-8 col-lg-8">
																<label for="campoLogradouro">Logradouro</label>
																<input value="${end.logradouro }" type="text" id="campoLogradouro" class="form-control" name="pessoa.endereco[${var }].logradouro">
															</div>
															<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
																<label for="campoNumero">Número</label>
																<input value="${end.numero }" type="text" id="campoNumero" class="form-control" name="pessoa.endereco[${var }].numero">
															</div>
															<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<label for="campoComplemento">Complemento</label>
																<textarea id="campoComplemento" class="form-control" name="pessoa.endereco[${var }].complemento"><c:out value="${end.complemento }" /></textarea>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="contato">
									<div class="row">
										<div class="col-xs-3 col-sm-3 col-md-1 col-lg-1">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top: 5px;">
												<br>
												<a data-toggle="tab" href="#contato" data-id="1" id="adicionarContato"><button class="btn btn-default btn-flat" type="button">Novo</button></a>
											</div>
										</div>
										<div class="col-xs-9 col-sm-9 col-md-11 col-lg-11">
											<div id="formcontato">
												<c:if test="${qtdcontato == 0 }">
													<div class="contatoIndividual">
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoTipoContato0">Tipo Contato*</label>
															<div class="input-group">
																<span class="input-group-btn">
																	<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoContato0">
																		<span class="glyphicon glyphicon-search"></span>
																	</button>
																</span>
																<select id="campoTipoContato0" name="pessoa.contato[0].tipo_contato" class="form-control select2">
																	<option value="" selected="selected">Selecione</option>
																	<option value="R">Telefone Residencial</option>
																	<option value="C">Telefone Comercial</option>
																	<option value="F">Celular</option>
																	<option value="E">Email</option>
																</select>
															</div>
														</div>
														<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
															<label for="campoContato">Contato*</label>
															<input type="text" id="campoContato" name="pessoa.contato[0].valor_contato" class="form-control">
														</div>
														<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2" style="margin-top: 5px;">
															<br>
															<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning btn-flat" type="button">Remover</button></a>
														</div>
													</div>
												</c:if>
												<c:set var="var" value="-1" />
												<c:forEach var="cont" items="${pessoa.contato }">
													<c:set var="var" value="${var=var+1}" />
													<div class="contatoIndividual">
														<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
															<label for="campoTipoContato${var }">Tipo Contato*</label>
															<div class="input-group">
																<span class="input-group-btn">
																	<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipoContato${var }">
																		<span class="glyphicon glyphicon-search"></span>
																	</button>
																</span>
																<select id="campoTipoContato${var }" name="pessoa.contato[${var }].tipo_contato" class="form-control select2">
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
														</div>
														<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
															<label for="campoContato">Contato*</label>
															<input value="${cont.valor_contato }" type="text" id="campoContato" name="pessoa.contato[${var }].valor_contato" class="form-control">
														</div>
														<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2" style="margin-top: 5px;">
															<br>
															<a data-toggle="tab" href="#contato" class="removerContato" ><button class="btn btn-warning btn-flat" type="button">Remover</button></a>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/pessoa' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							<c:if test="${excluir != 1 }">
								<button type="button" class="btn btn-danger btn-flat" data-toggle="modal" data-target="#confirm">Excluir</button>
							</c:if>
						</div>
					</div>
					<div class="modal fade" id="confirm">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Confirmação</h4>
								</div>
								<div class="modal-body">
									<p>Tem certeza que deseja excluir?</p>
								</div>
								<div class="modal-footer">
									<button type="button" data-dismiss="modal" class="btn btn-default pull-left">Voltar</button>
									<a href="<c:url value='/pessoa/${pessoa.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Versão</b> <c:out value="${versao_sistema }" />
		</div>
		<strong>Copyright &copy; 2018 <a href="">Isac Sistemas</a>.</strong>
		Todos direitos reservados.
	</footer>
</div>



<%-- 

							
						
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
--%>


<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>