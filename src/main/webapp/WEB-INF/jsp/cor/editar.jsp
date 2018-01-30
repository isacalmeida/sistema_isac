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
						<span>In�cio</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Dashboard</a></li>
						<li><a href="<c:url value='/menu/cadastros' />" ><i class="fa fa-pencil-square-o"></i> Cadastros</a></li>
						<li><a href="<c:url value='/menu/configuracoes' />" ><i class="fa fa-gear"></i> Configura��es</a></li>
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
						<span>Configura��es</span>
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
										Usu�rio
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
				Cor
				<small>Cadastro de cores dos produtos</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> In�cio</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configura��es</a></li>
				<li><a href="<c:url value='/cor' />" >Cor</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/cor/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${cor.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">�ltima altera��o em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${cor.alteracao }" disabled>
						</div>
						<div class="form-group col-lg-12">
							<label for="campoCodigo">Codigo</label>
							<input value="${cor.codigo }" type="text" class="form-control" id="campoCodigo" disabled>
							<input value="${cor.codigo }" name="cor.codigo" type="hidden">
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-lg-12">
							<label for="campoDescricao">Descri��o</label>
							<input value="${cor.descricao }" type="text" class="form-control" id="campoDescricao" name="cor.descricao">
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/cor' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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
									<h4 class="modal-title">Confirma��o</h4>
								</div>
								<div class="modal-body">
									<p>Tem certeza que deseja excluir?</p>
								</div>
								<div class="modal-footer">
									<button type="button" data-dismiss="modal" class="btn btn-default pull-left">Voltar</button>
									<a href="<c:url value='/cor/${cor.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
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
			<b>Vers�o</b> <c:out value="${versao_sistema }" />
		</div>
		<strong>Copyright &copy; 2018 <a href="">Isac Sistemas</a>.</strong>
		Todos direitos reservados.
	</footer>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>