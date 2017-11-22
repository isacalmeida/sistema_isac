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
<script src="<c:url value='/bootstrap/js/checkbox_button.js' />"></script>

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
				<li><a href="<c:url value='/menu/cadastros'/>"> Cadastros </a></li>
				<li class="active"><a href="<c:url value='/menu/configuracoes'/>"> Configurações <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Perfil de Acesso </h3><hr>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/perfil_acesso'/>"> Perfis </a></li>
				<li class="active"> Editar </li>
			</ol>
			<form name="formPessoa" role="form" method="post" action='<c:url value="/perfil_acesso/salvar"/>'>
				<fieldset>
					<div class="form-group row">
						<div class="col-lg-1"></div>
						<div class="col-lg-7">
							<div class="row">
								<label for="campoCodigo">Codigo</label>
								<input type="text" id="campoCodigo" class="form-control" value="${perfil.codigo}" disabled>
								<input type="hidden" name="perfil.codigo" value="${perfil.codigo}">
							</div>
							<br>
							<div class="row">
								<label for="campoDescricao">Descrição</label>
								<input type="text" id="campoDescricao" name="perfil.descricao" class="form-control" value="${perfil.descricao}">
							</div>
						</div>
						<div class="col-lg-3">
							<div class="col-lg-11">
								<div class="row">
									<label for="campoCriacao">Criado em:</label>
									<input type="datetime" id="campoCriacao" class="form-control" value="${perfil.criacao }" disabled>
									</div>
								<br>
								<div class="row">
									<label for="campoAlteracao">Última alteração em:</label>
									<input type="datetime" id="campoAlteracao" class="form-control" value="${perfil.alteracao }" disabled>
									</div>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="col-lg-1"></div>
					</div>
					<br>
					<c:set var="var" value="-1" />
					<ul class="nav nav-tabs responsive">
						<li class="active"><a data-toggle="tab" href="#geral"> Geral </a></li>
						<li><a data-toggle="tab" href="#pessoa"> Pessoa </a></li>
						<li><a data-toggle="tab" href="#produto"> Produto </a></li>
					</ul>
					<div class="tab-content responsive">
						<br>
						<div id="geral" class="tab-pane active">
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-10">
									<div class="row">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th> Programa </th>
													<th> Visualizar </th>
													<th> Incluir </th>
													<th> Alterar </th>
													<th> Remover </th>
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
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																</span>
															</td>
															<td>
					            								<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
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
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div id="pessoa" class="tab-pane">
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-10">
									<div class="row">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th> Programa </th>
													<th> Visualizar </th>
													<th> Incluir </th>
													<th> Alterar </th>
													<th> Remover </th>
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
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																</span>
															</td>
															<td>
					            								<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
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
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div id="produto" class="tab-pane">
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-10">
									<div class="row">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th> Programa </th>
													<th> Visualizar </th>
													<th> Incluir </th>
													<th> Alterar </th>
													<th> Remover </th>
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
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].visualizar" <c:if test="${ac.visualizar == true }">checked</c:if>>
																</span>
															</td>
															<td>
					            								<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].incluir" <c:if test="${ac.incluir == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
																	<input type="checkbox" class="hidden" name="perfil.acessos[${var}].alterar" <c:if test="${ac.alterar == true }">checked</c:if>>
																</span>
															</td>
															<td>
																<span class="button-checkbox">
																	<button type="button" class="btn btn-lg" data-color="primary"></button>
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
								<div class="col-sm-1"></div>
							</div>
						</div>
						<div class="row">
							<br>
							<div class="box-actions col-lg-12">
								<button type="submit" class="btn btn-success">Salvar</button>
								<a href="<c:url value='/perfil_acesso'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
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
											<a href="<c:url value='/perfil_acesso/${perfil.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete"> Confirmar </button></a>
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