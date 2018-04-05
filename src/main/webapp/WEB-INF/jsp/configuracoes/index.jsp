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
				Geral
				<small>Configurações Gerais do Sistema</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li class="active">Geral</li>
			</ol>
		</section>
		<section class="content">
			<c:if test="${permissao == 1 || (var >= 0 && var <= 2) || (acao >= 0 && acao <= 2) }">
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
						<c:choose>
							<c:when test="${var == 0}"> 
								<c:choose>
									<c:when test="${acao == 0 }">
										<div class="callout callout-danger">
											<h4><i class="icon fa fa-ban"></i> Ops!</h4>
											<p>Ocorreu algum erro na inclusão.</p>
										</div>
									</c:when>
									<c:when test="${acao == 1 }">
										<div class="callout callout-danger">
											<h4><i class="icon fa fa-ban"></i> Ops!</h4>
											<p>Ocorreu algum erro na edição.</p>
										</div>
									</c:when>
									<c:when test="${acao == 2 }">
										<div class="callout callout-danger">
											<h4><i class="icon fa fa-ban"></i> Ops!</h4>
											<p>Configuções com relacionamentos ativos.</p>
										</div>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${permissao == 1 || var == 1 }">
								<div class="callout callout-danger">
									<h4><i class="icon fa fa-ban"></i> Ops!</h4>
									<p>Você não possui permissão para visualizar este programa</p>
								</div>
							</c:when>
							<c:when test="${var == 2}">
								<c:choose>
									<c:when test="${acao == 0 }">
										<div class="callout callout-success">
											<h4><i class="icon fa fa-check"></i> Sucesso!</h4>
											<p>Cadastro realizado.</p>
										</div>
									</c:when>
									<c:when test="${acao == 1 }">
										<div class="callout callout-success">
											<h4><i class="icon fa fa-check"></i> Sucesso!</h4>
											<p>Cadastro alterado.</p>
										</div>
									</c:when>
									<c:when test="${acao == 2 }">
										<div class="callout callout-success">
											<h4><i class="icon fa fa-check"></i> Sucesso!</h4>
											<p>Cadastro excluído.</p>
										</div>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</div>
				</div>
			</c:if>
			<c:if test="${permissao != 1 }">
				<div class="box">
					<div class="box-header with-border">
						<div class="col-xs-5 col-sm-3 col-md-2 col-lg-2">
							<a href="<c:url value='/menu/configuracoes' />"><button type="button" class="btn btn-info btn-flat">Voltar</button></a>
						</div>
					</div>
					<div class="box-body">
						<table id="tabela_principal" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Linhas de Tabela</th>
									<th>Data de Alteração</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${confs }">
									<c:if test="${!empty(c)}" >
										<tr>
											<td><a href="<c:url value='/configuracoes/${c.codigo }/editar' />" >${c.codigo }</a></td>
											<td>${c.tabela_linhas }</td>
											<td>${c.criacao }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
		</section>
	</div>
	
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>