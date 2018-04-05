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
				Acessos
				<small>Relacionamento dos Programas com Perfil de Acesso</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li class="active">Acessos</li>
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
									<th>Perfil de Acesso</th>
									<th>Programa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${acessos }">
									<c:if test="${!empty(a)}" >
										<tr>
											<td>${a.codigo }</td>
											<td>${a.perfilacesso.descricao }</td>
											<td>${a.programa.descricao }</td>
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