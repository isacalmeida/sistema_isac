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
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/perfil_acesso/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${perfil.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">Última alteração em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${perfil.alteracao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoCodigo">Codigo</label>
							<input value="${perfil.codigo }" type="text" class="form-control" id="campoCodigo" disabled>
							<input value="${perfil.codigo }" name="perfil.codigo" type="hidden">
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoDescricao">Descrição</label>
							<input value="${perfil.descricao }" type="text" class="form-control" id="campoDescricao" name="perfil.descricao">
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
													<c:forEach var="ac" items="${perfil.acessos}">
														<c:if test="${ac.programa.grupo == 1}">
															<c:set var="var" value="${var+1 }" />
															<tr>
																<td>
																	<c:out value="${ac.programa.descricao }" />
																	<input type="text" value="${ac.programa.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	<input type="text" value="${ac.codigo }" name="perfil.acessos[${var }].codigo" hidden="hidden">
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
						            								<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover" <c:if test="${ac.remover == true }">checked</c:if>>
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
													<c:forEach var="ac" items="${perfil.acessos}">
														<c:if test="${ac.programa.grupo == 2}">
															<c:set var="var" value="${var+1 }" />
															<tr>
																<td>
																	<c:out value="${ac.programa.descricao }" />
																	<input type="text" value="${ac.programa.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	<input type="text" value="${ac.codigo }" name="perfil.acessos[${var }].codigo" hidden="hidden">
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
						            								<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover" <c:if test="${ac.remover == true }">checked</c:if>>
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
													<c:forEach var="ac" items="${perfil.acessos}">
														<c:if test="${ac.programa.grupo == 3}">
															<c:set var="var" value="${var+1 }" />
															<tr>
																<td>
																	<c:out value="${ac.programa.descricao }" />
																	<input type="text" value="${ac.programa.codigo }" name="perfil.acessos[${var }].programa.codigo" hidden="hidden">
																	<input type="text" value="${ac.codigo }" name="perfil.acessos[${var }].codigo" hidden="hidden">
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
						            								<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																	</span>
																</td>
																<td>
																	<span class="button-checkbox">
																		<button type="button" class="btn btn-lg hidden-xs" data-color="primary"></button>
																		<button type="button" class="btn btn-sm hidden-sm hidden-md hidden-lg" data-color="primary"></button>
																		<input type="checkbox" class="hidden" name="perfil.acessos[${var}].remover" <c:if test="${ac.remover == true }">checked</c:if>>
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
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/perfil_acesso' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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
									<a href="<c:url value='/perfil_acesso/${perfil.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>