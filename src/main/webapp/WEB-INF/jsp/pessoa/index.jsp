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
				<small>Cadastro de pessoa f�sica e jur�dica</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> In�cio</a></li>
				<li><a href="<c:url value='/menu/cadastros' />" >Cadastros</a></li>
				<li class="active">Pessoa</li>
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
											<p>Ocorreu algum erro na inclus�o.</p>
										</div>
									</c:when>
									<c:when test="${acao == 1 }">
										<div class="callout callout-danger">
											<h4><i class="icon fa fa-ban"></i> Ops!</h4>
											<p>Ocorreu algum erro na edi��o.</p>
										</div>
									</c:when>
									<c:when test="${acao == 2 }">
										<div class="callout callout-danger">
											<h4><i class="icon fa fa-ban"></i> Ops!</h4>
											<p>Pessoa com relacionamentos ativos.</p>
										</div>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${permissao == 1 || var == 1 }">
								<div class="callout callout-danger">
									<h4><i class="icon fa fa-ban"></i> Ops!</h4>
									<p>Voc� n�o possui permiss�o para visualizar este programa</p>
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
											<p>Cadastro exclu�do.</p>
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
						<div class="col-xs-10 col-sm-6 col-md-4 col-lg-4">
							<c:if test="${permissao != 2 }">
								<a href="<c:url value='/pessoa/novo'/>" ><button type="button" class="btn btn-primary btn-flat">Novo</button></a>
							</c:if>
							<a href="<c:url value='/menu/cadastros' />"><button type="button" class="btn btn-info btn-flat">Voltar</button></a>
						</div>
					</div>
					<div class="box-body">
						<table id="tabela_principal" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Nome/Raz�o</th>
									<th>CPF/CNPJ</th>
									<th>Endere�o</th>
									<th>Contato</th>
									<th>Data de Cadastro</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${pessoas }">
									<c:if test="${!empty(p)}" >
										<tr>
											<td>${p.codigo }</td>
											<c:choose>
												<c:when test="${p.tipo.toString() == 'F'}">
													<td><a href="<c:url value='/pessoa/${p.codigo }/editar' />" >${p.nome }</a></td>
												</c:when>
												<c:when test="${p.tipo.toString() == 'J'}">
													<td><a href="<c:url value='/pessoa/${p.codigo }/editar' />" >${p.razao }</a></td>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${p.tipo.toString() == 'F'}">
													<td>${p.cpf }</td>
												</c:when>
												<c:when test="${p.tipo.toString() == 'J'}">
													<td>${p.cnpj }</td>
												</c:when>
											</c:choose>
											<td>
												<c:forEach var="end" items="${p.endereco }">
													${end.logradouro }, ${end.numero }, ${end.cidade }, ${end.uf }, ${end.cep }<br>
												</c:forEach>
											</td>
											<td>
												<c:forEach var="cont" items="${p.contato }">
													${cont.valor_contato }<br>
												</c:forEach>
											</td>
											<td>${p.criacao }</td>
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