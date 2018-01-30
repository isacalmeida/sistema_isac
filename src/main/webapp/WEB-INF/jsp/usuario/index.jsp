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
				Usuário
				<small>Cadastro de usuário</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li class="active">Usuário</li>
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
											<p>Usuario com relacionamentos ativos.</p>
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
						<div class="col-xs-10 col-sm-6 col-md-4 col-lg-4">
							<c:if test="${permissao != 2 }">
								<a href="<c:url value='/usuario/novo'/>" ><button type="button" class="btn btn-primary btn-flat">Novo</button></a>
							</c:if>
							<a href="<c:url value='/menu/configuracoes' />"><button type="button" class="btn btn-info btn-flat">Voltar</button></a>
						</div>
					</div>
					<div class="box-body">
						<table id="tabela_principal" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Login</th>
									<th>Pessoa</th>
									<th>Data de Cadastro</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${usuarios }">
									<c:if test="${!empty(u)}" >
										<tr>
											<td>${u.codigo }</td>
											<td><a href="<c:url value='/usuario/${u.codigo }/editar' />" >${u.usuario }</a></td>
											<td>${u.pessoa.nome }</td>
											<td>${u.criacao }</td>
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

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Versão</b> <c:out value="${versao_sistema }" />
		</div>
		<strong>Copyright &copy; 2018 <a href="">Isac Sistemas</a>.</strong>
		Todos direitos reservados.
	</footer>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>