<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Menu </title>

</head>
<body>

<aside class="main-sidebar">
	<section class="sidebar">
		<form action="<c:url value='/busca' />" method="get" class="sidebar-form">
			<div class="input-group ui-widget">
				<input type="text" id="busca" name="q" class="form-control" placeholder="Pesquisar ..." autocomplete="off">
				<span class="input-group-btn">
					<button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
				</span>
			</div>
		</form>
		<%-- <div class="input-group">
			<input id="busca" type="text" name="q" class="form-control" placeholder="Pesquisar ..." autocomplete="off">
			<span class="input-group-btn">
				<button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
				</button>
			</span>
		</div> --%>
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

</body>
</html>