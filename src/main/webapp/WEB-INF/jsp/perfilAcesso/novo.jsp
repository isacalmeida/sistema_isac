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
				Perfil de Acesso
				<small>Cadastro de perfis dos usuários</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li><a href="<c:url value='/perfil_acesso' />" >Perfil de Acesso</a></li>
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
				<div class="box">
					<form role="form" method="post" action='<c:url value="/perfil_acesso/salvar"/>'>
						<div class="box-header with-border">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCodigo">Codigo</label>
								<input type="text" id="campoCodigo" class="form-control" disabled>
							</div>
						</div>
						<div class="box-body">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoDescricao">Descrição</label>
								<input type="text" id="campoDescricao" class="form-control" name="perfil.descricao">
							</div>
							<div class="nav-tabs-custom">
								<c:set var="var" value="-1" />
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#geral"> Geral </a></li>
									<li><a data-toggle="tab" href="#pessoa"> Pessoa </a></li>
									<li><a data-toggle="tab" href="#produto"> Produto </a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="geral">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="hidden-xs">Programa</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Programa</small></th>
															<th class="hidden-xs">Visualizar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Visua.</small></th>
															<th class="hidden-xs">Incluir</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Inclui.</small></th>
															<th class="hidden-xs">Alterar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Altera.</small></th>
															<th class="hidden-xs">Remover</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Remov.</small></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="p" items="${programas}">
															<c:if test="${p.grupo == 1}">
																<c:set var="var" value="${var+1 }" />
																<tr>
																	<td>
																		<c:out value="${p.descricao }" />
																		<input type="text" value="${p.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar">
																		</span>
																	</td>
																	<td>
							            								<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover">
																		</span>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="pessoa">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="hidden-xs">Programa</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Programa</small></th>
															<th class="hidden-xs">Visualizar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Visua.</small></th>
															<th class="hidden-xs">Incluir</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Inclui.</small></th>
															<th class="hidden-xs">Alterar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Altera.</small></th>
															<th class="hidden-xs">Remover</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Remov.</small></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="p" items="${programas}">
															<c:if test="${p.grupo == 2}">
																<c:set var="var" value="${var+1 }" />
																<tr>
																	<td>
																		<c:out value="${p.descricao }" />
																		<input type="text" value="${p.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar">
																		</span>
																	</td>
																	<td>
							            								<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover">
																		</span>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="produto">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th class="hidden-xs">Programa</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Programa</small></th>
															<th class="hidden-xs">Visualizar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Visua.</small></th>
															<th class="hidden-xs">Incluir</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Inclui.</small></th>
															<th class="hidden-xs">Alterar</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Altera.</small></th>
															<th class="hidden-xs">Remover</th>
															<th class="hidden-sm hidden-md hidden-lg"><small>Remov.</small></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="p" items="${programas}">
															<c:if test="${p.grupo == 3}">
																<c:set var="var" value="${var+1 }" />
																<tr>
																	<td>
																		<c:out value="${p.descricao }" />
																		<input type="text" value="${p.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar">
																		</span>
																	</td>
																	<td>
							            								<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar">
																		</span>
																	</td>
																	<td>
																		<span class="button-checkbox">
																			<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																			<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																			<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover">
																		</span>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/perfil_acesso' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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