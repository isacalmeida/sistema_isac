<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Programas </title>

<link rel="icon" href="<c:url value='/bootstrap/img/icon.png' />" />

<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/navbar-fixed-top.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/styles/dashboard.css' />" />

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
				<li><a href="<c:url value='/menu/cadastros'/>"> Cadastros</a></li>
				<li class="active"><a href="<c:url value='/menu/configuracoes'/>"> Configurações <span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h3 class="page-header"><span class="glyphicon glyphicon-chevron-right"></span> Programas </h3>
			<c:choose>
				<c:when test="${var == 0}">
					<c:choose>
						<c:when test="${acao == 0 }">
							<div class="alert alert-danger alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       						<strong>Ops!</strong> Algum erro ocorreu na inclusão.
	      					</div>
	      				</c:when>
	      				<c:when test="${acao == 1 }">
	      					<div class="alert alert-danger alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       						<strong>Ops!</strong> Algum erro ocorreu na edição.
	      					</div>
	      				</c:when>
	      				<c:when test="${acao == 2 }">
	      					<div class="alert alert-danger alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       						<strong>Ops!</strong> Pessoa com relacionamentos ativos.
	      					</div>
	      				</c:when>
	      			</c:choose>
				</c:when>
				<c:when test="${var == 2}">
					<c:choose>
						<c:when test="${acao == 0 }">
							<div class="alert alert-success alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        			<strong>Sucesso!</strong> Cadastro efetuado.
			      			</div>
	      				</c:when>
	      				<c:when test="${acao == 1 }">
							<div class="alert alert-success alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        			<strong>Sucesso!</strong> Cadastro alterado.
			      			</div>
	      				</c:when>
	      				<c:when test="${acao == 2 }">
							<div class="alert alert-success alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        			<strong>Sucesso!</strong> Cadastro removido.
			      			</div>
	      				</c:when>
	      			</c:choose>
				</c:when>
			</c:choose>
			<div class="row">
				<div class="box-actions">
					<a href="<c:url value='/programas/novo'/>" ><button type="button" class="btn btn-primary"> Novo </button></a>
					<a href="<c:url value='/menu/configuracoes'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
				</div>
			</div>
			<br>
			<div class="row">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Programa</th>
							<th>Endereço</th>
							<th>Data de Cadastro</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${programas }">
							<c:if test="${!empty(p)}" >
								<tr>
									<td>${p.codigo }</td>
									<td><a href="<c:url value='/programas/${p.codigo }/editar' />" >${p.descricao }</a></td>
									<td>${p.endereco }</td>
									<td>${p.criacao }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${colunas == 1 }">
							<li class="prev disabled"><span>&lt;</span></li>
								<li class="active"><span><c:out value="${pag+1 }" /></span></li>
							<li class="next disabled"><span>&gt;</span></li>
						</c:when>
						<c:when test="${colunas > pag && colunas <= 5 }">
							<c:choose>
								<c:when test="${pag == 0 }">
									<li class="prev disabled"><span>&lt;</span></li>
									<li class="active"><span><c:out value="${pag+1 }" /></span></li>
									<c:forEach var="pg" begin="${pag+2 }" end="${colunas }">
										<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
									</c:forEach>
									<li class="next"><a href="<c:url value='/programas?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
								</c:when>
								<c:when test="${pag+1 == colunas }">
									<li class="prev"><a href="<c:url value='/programas?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
									<c:forEach var="pg" begin="${1 }" end="${colunas-1 }">
										<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
									</c:forEach>
									<li class="active"><span><c:out value="${colunas }" /></span></li>
									<li class="next disabled"><span>&gt;</span></li>
								</c:when>
								<c:otherwise>
									<li class="prev"><a href="<c:url value='/programas?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
									<c:forEach var="pg" begin="${1 }" end="${colunas }">
										<c:choose>
											<c:when test="${pg == pag+1 }">
												<li class="active"><span><c:out value="${pg }" /></span></li>
											</c:when>
											<c:otherwise>
												<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li class="next"><a href="<c:url value='/programas?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${pag == 0 }">
									<li class="prev disabled"><span>&lt;</span></li>
									<li class="active"><span><c:out value="${pag+1 }" /></span></li>
									<c:forEach var="pg" begin="${pag+2 }" end="${pag+3 }">
										<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
									</c:forEach>
									<li class="disabled"><span>&hellip;</span></li>
									<li><a href="<c:url value='/programas?tpag=${colunas }' />" target="_self" rel="next"><c:out value="${colunas }" /></a></li>
									<li class="next"><a href="<c:url value='/programas?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
								</c:when>
								<c:when test="${pag+1 == colunas }">
									<li class="prev"><a href="<c:url value='/programas?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
									<li><a href="<c:url value='/programas?tpag=${1 }' />" target="_self" rel="next"><c:out value="${1 }" /></a></li>
									<li class="disabled"><span>&hellip;</span></li>
									<c:forEach var="pg" begin="${pag-1 }" end="${colunas-1 }">
										<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
									</c:forEach>
									<li class="active"><span><c:out value="${colunas }" /></span></li>
									<li class="next disabled"><span>&gt;</span></li>
								</c:when>
								<c:otherwise>
									<li class="prev"><a href="<c:url value='/programas?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
									<c:forEach var="pg" begin="${1 }" end="${colunas }">
										<c:choose>
											<c:when test="${pg == 1 }">
												<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="prev"><c:out value="${pg }" /></a></li>
											</c:when>
											<c:when test="${ pg < pag && pg == 2 }">
												<li class="disabled"><span>&hellip;</span></li>	
											</c:when>
											<c:when test="${pg == pag || pg == pag+1 || pg == pag+2 }">
												<c:if test="${pg == pag }">
													<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="prev"><c:out value="${pg }" /></a></li>
												</c:if>
												<c:if test="${pg == pag+1 }">
													<li class="active"><span><c:out value="${pg }" /></span></li>
												</c:if>
												<c:if test="${pg == pag+2 }">
													<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
												</c:if>
											</c:when>
											<c:when test="${pg == colunas-1 }">
												<li class="disabled"><span>&hellip;</span></li>	
											</c:when>
											<c:when test="${pg == colunas }">
												<li><a href="<c:url value='/programas?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<li class="next"><a href="<c:url value='/programas?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js' />"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>

</body>
</html>