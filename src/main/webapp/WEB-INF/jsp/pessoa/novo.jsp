<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
	<jsp:include page="../defaults/main.jsp"></jsp:include>
	
	<jsp:include page="../defaults/menu.jsp"></jsp:include>

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
				<li class="active">Novo</li>
			</ol>
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
				<c:if test="${erros != null }">
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
							<div class="alert alert-danger alert-dismissible">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								<h4><i class="icon fa fa-ban"></i> Ops!</h4>
								<c:forEach var="erro" items="${erros }">
									<c:out value="${erro }" />
								</c:forEach>
							</div>
						</div>
					</div>
				</c:if>
				<div class="box">
					<form role="form" method="post" action='<c:url value="/pessoa/salvar"/>'>
						<div class="box-header with-border">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">	
									<img class="img-thumbnail" id="imagemProduto" src="<c:url value="/imagem/pessoa/avatar_default-160x160.png" />">
								</div>
								<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
									<label for="campoImagem">Imagem</label>
									<input id="campoImagem" class="form-control" type="file" data-max-size="10485760" name="pessoa.imagem">
								</div>
								<div class="form-group col-xs-12 col-sm-10 col-md-10 col-lg-10">
									<label for="campoCodigo">Codigo</label>
									<input type="text" id="campoCodigo" class="form-control" name="pessoa.codigo" disabled>
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
														<button class="btn btn-default btn-flat" type="button" data-select2-open="campoTipo">
															<span class="glyphicon glyphicon-search"></span>
														</button>
													</span>
													<select id="campoTipo" class="form-control select2" name="pessoa.tipo" onchange="fisicaJuridica('fisica','juridica','fisica1','juridica1');">
														<c:choose>
															<c:when test="${pessoa.tipo.toString() eq 'F'}">
																<option value="F" selected="selected">Física</option>
																<option value="J">Jurídica</option>
															</c:when>
															<c:when test="${pessoa.tipo.toString() eq 'J'}">
																<option value="F">Física</option>
																<option value="J" selected="selected">Jurídica</option>
															</c:when>
															<c:otherwise>
																<option value="F" selected="selected">Física</option>
																<option value="J">Jurídica</option>
															</c:otherwise>
														</c:choose>
													</select>
												</div>
											</div>
											<div id="fisica" <c:choose><c:when test="${pessoa.tipo.toString() eq 'J'}"> style="display: none" </c:when><c:when test="${pessoa.tipo.toString() eq 'F'}"> style="display: block" </c:when><c:otherwise> style="display: block" </c:otherwise></c:choose>>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoNome">Nome Completo*</label>
													<input type="text" id="campoNome" class="form-control" name="pessoa.nome" value="${pessoa.nome }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoCpf">CPF*</label>
													<input type="text" id="campoCpf" class="form-control cpf-mask" name="pessoa.cpf" value="${pessoa.cpf }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoIdentidade">Identidade</label>
													<input type="text" id="campoIdentidade" class="form-control" name="pessoa.identidade" value="${pessoa.identidade }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoEmisIden">Data Emissão Identidade</label>
													<input type="text" id="campoEmisIden" class="form-control" name="pessoa.data_emissao" value="${pessoa.data_emissao }">
												</div>
											</div>
											<div id="juridica" <c:choose><c:when test="${pessoa.tipo.toString() eq 'F'}"> style="display: none" </c:when><c:when test="${pessoa.tipo.toString() eq 'J'}"> style="display: block" </c:when><c:otherwise> style="display: none" </c:otherwise></c:choose>>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoRazao">Razão Social*</label>
													<input type="text" id="campoRazao" class="form-control" name="pessoa.razao" value="${pessoa.razao }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoFantasia">Nome Fantasia</label>
													<input type="text" id="campoFantasia" class="form-control" name="pessoa.fantasia" value="${pessoa.fantasia }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoCnpj">CNPJ*</label>
													<input type="text" id="campoCnpj" class="form-control" name="pessoa.cnpj" value="${pessoa.cnpj }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoIe">Inscrição Estadual</label>
													<input type="text" id="campoIe" class="form-control" name="pessoa.inscricao_estadual" value="${pessoa.inscricao_estadual }">
												</div>
											</div>
											<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoCliente">Cliente</label>
												<div id="campoCliente">
													<input id="checkSwitch" name="pessoa.cliente" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
												</div>
											</div>
											<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoFornecedor">Fornecedor</label>
												<div id="campoFornecedor">
													<input id="checkSwitch" name="pessoa.fornecedor" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
												</div>
											</div>
											<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-4">
												<label for="campoAtivo">Ativo</label>
												<div id="campoAtivo">
													<input id="checkSwitch" name="pessoa.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="adicional">
										<div class="row">
											<div id="fisica1" <c:choose><c:when test="${pessoa.tipo.toString() eq 'J'}"> style="display: none" </c:when><c:when test="${pessoa.tipo.toString() eq 'F'}"> style="display: block" </c:when><c:otherwise> style="display: block" </c:otherwise></c:choose>>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoDataNascimento">Data de Nascimento</label>
													<input type="text" id="campoDataNascimento" class="form-control" name="pessoa.data_nascimento" value="${pessoa.data_nascimento }">
												</div>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoSexo">Sexo</label>
													<div class="input-group">
														<span class="input-group-btn">
															<button class="btn btn-default btn-flat" type="button" data-select2-open="campoSexo">
																<span class="glyphicon glyphicon-search"></span>
															</button>
														</span>
														<select id="campoSexo" name="pessoa.sexo" class="form-control select2 ">
															<option value="" selected="selected">Selecione</option>
															<option value="M">Masculino</option>
															<option value="F">Feminino</option>
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
											<div id="juridica1" <c:choose><c:when test="${pessoa.tipo.toString() eq 'F'}"> style="display: none" </c:when><c:when test="${pessoa.tipo.toString() eq 'J'}"> style="display: block" </c:when><c:otherwise> style="display: none" </c:otherwise></c:choose>>
												<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<label for="campoDataFundacao">Data de Fundação</label>
													<input type="date" id="campoDataFundacao" class="form-control" name="pessoa.data_fundacao" value="${pessoa.data_fundacao }">
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
															<option value="C" selected="selected">Consumidor</option>
															<option value="R">Revendedor</option>
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
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/pessoa' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							</div>
						</div>
					</form>
				</div>
			</c:if>
		</section>
	</div>
	
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>