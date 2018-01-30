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
				Produto
				<small>Cadastro de produtos</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/cadastros' />" >Cadastros</a></li>
				<li class="active">Produto</li>
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
											<p>Produto com relacionamentos ativos.</p>
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
								<a href="<c:url value='/produto/novo'/>" ><button type="button" class="btn btn-primary btn-flat">Novo</button></a>
							</c:if>
							<a href="<c:url value='/menu/cadastros' />"><button type="button" class="btn btn-info btn-flat">Voltar</button></a>
						</div>
					</div>
					<div class="box-body">
						<table id="tabela_principal" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Descrição</th>
									<th>Departamento</th>
									<th>Fornecedor</th>
									<th>Data de Cadastro</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${produtos }">
									<c:if test="${!empty(p)}" >
										<tr>
											<td>${p.codigo }</td>
											<td><a href="<c:url value='/produto/${p.codigo }/editar' />" >${p.descricao }</a></td>
											<td>${p.departamento.descricao } </td>
											<td>
											<c:choose>
												<c:when test="${p.fornecedor.nome != null }">
													${p.fornecedor.nome }
												</c:when>
												<c:when test="${p.fornecedor.razao != null }">
													${p.fornecedor.razao }
												</c:when>
											</c:choose>
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

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Versão</b> <c:out value="${versao_sistema }" />
		</div>
		<strong>Copyright &copy; 2018 <a href="">Isac Sistemas</a>.</strong>
		Todos direitos reservados.
	</footer>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li>
					<div class="navbar-form">
						<select id="campoPesquisa" class="selectpicker form-control" data-live-search="true" data-size="auto" title="Pesquisar..." onchange="location = this.value;">
							<c:forEach var="prog" items="${programas }">
								<option value="/lista${prog.endereco  }">${prog.descricao }</option>
							</c:forEach>
						</select>
					</div>
				</li>
				<li><a href="<c:url value='/menu'/>"> Inicio </a></li>
				<li class="active"><a href="<c:url value='/menu/cadastros'/>"> Cadastros <span class="sr-only">(current)</span></a></li>
				<li><a href="<c:url value='/menu/configuracoes'/>"> Configurações </a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
			<h3><span class="glyphicon glyphicon-chevron-right"></span> Produtos </h3><hr>
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
	       						<strong>Ops!</strong> Produto com relacionamentos ativos.
	      					</div>
	      				</c:when>
	      			</c:choose>
				</c:when>
				<c:when test="${var == 1 }">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       				<strong>Ops!</strong> Sem permissão para visualizar o programa.
	      			</div>
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
			<c:choose>
				<c:when test="${permissao != 1 }">
					<div class="col-lg-12 responsive">
						<div class="row">
							<div class="box-actions">
								<c:if test="${permissao != 2 }">
									<a href="<c:url value='/produto/novo'/>" ><button type="button" class="btn btn-primary"> Novo </button></a>
								</c:if>
								<a href="<c:url value='/menu/cadastros'/>" ><button type="button" class="btn btn-default"> Voltar </button></a>
							</div>
						</div>
						<br>
						<div class="row">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Descrição</th>
										<th>Departamento</th>
										<th>Fornecedor</th>
										<th>Data de Cadastro</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${produtos }">
										<c:if test="${!empty(p)}" >
											<tr>
												<td>${p.codigo }</td>
												<td><a href="<c:url value='/produto/${p.codigo }/editar' />" >${p.descricao }</a></td>
												<td>${p.departamento.descricao } </td>
												<td>
												<c:choose>
													<c:when test="${p.fornecedor.nome != null }">
														${p.fornecedor.nome }
													</c:when>
													<c:when test="${p.fornecedor.razao != null }">
														${p.fornecedor.razao }
													</c:when>
												</c:choose>
												</td>
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
													<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
												</c:forEach>
												<li class="next"><a href="<c:url value='/produto?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
											</c:when>
											<c:when test="${pag+1 == colunas }">
												<li class="prev"><a href="<c:url value='/produto?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
												<c:forEach var="pg" begin="${1 }" end="${colunas-1 }">
													<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
												</c:forEach>
												<li class="active"><span><c:out value="${colunas }" /></span></li>
												<li class="next disabled"><span>&gt;</span></li>
											</c:when>
											<c:otherwise>
												<li class="prev"><a href="<c:url value='/produto?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
												<c:forEach var="pg" begin="${1 }" end="${colunas }">
													<c:choose>
														<c:when test="${pg == pag+1 }">
															<li class="active"><span><c:out value="${pg }" /></span></li>
														</c:when>
														<c:otherwise>
															<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<li class="next"><a href="<c:url value='/produto?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${pag == 0 }">
												<li class="prev disabled"><span>&lt;</span></li>
												<li class="active"><span><c:out value="${pag+1 }" /></span></li>
												<c:forEach var="pg" begin="${pag+2 }" end="${pag+3 }">
													<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
												</c:forEach>
												<li class="disabled"><span>&hellip;</span></li>
												<li><a href="<c:url value='/produto?tpag=${colunas }' />" target="_self" rel="next"><c:out value="${colunas }" /></a></li>
												<li class="next"><a href="<c:url value='/produto?tpag=${pag+2 }' />" target="_self" rel="next"><span>&gt;</span></a></li>
											</c:when>
											<c:when test="${pag+1 == colunas }">
												<li class="prev"><a href="<c:url value='/produto?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
												<li><a href="<c:url value='/produto?tpag=${1 }' />" target="_self" rel="next"><c:out value="${1 }" /></a></li>
												<li class="disabled"><span>&hellip;</span></li>
												<c:forEach var="pg" begin="${pag-1 }" end="${colunas-1 }">
													<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
												</c:forEach>
												<li class="active"><span><c:out value="${colunas }" /></span></li>
												<li class="next disabled"><span>&gt;</span></li>
											</c:when>
											<c:otherwise>
												<li class="prev"><a href="<c:url value='/produto?tpag=${pag }' />" target="_self" rel="prev" ><span>&lt;</span></a></li>
												<c:forEach var="pg" begin="${1 }" end="${colunas }">
													<c:choose>
														<c:when test="${pg == 1 }">
															<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="prev"><c:out value="${pg }" /></a></li>
														</c:when>
														<c:when test="${ pg < pag && pg == 2 }">
															<li class="disabled"><span>&hellip;</span></li>	
														</c:when>
														<c:when test="${pg == pag || pg == pag+1 || pg == pag+2 }">
															<c:if test="${pg == pag }">
																<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="prev"><c:out value="${pg }" /></a></li>
															</c:if>
															<c:if test="${pg == pag+1 }">
																<li class="active"><span><c:out value="${pg }" /></span></li>
															</c:if>
															<c:if test="${pg == pag+2 }">
																<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
															</c:if>
														</c:when>
														<c:when test="${pg == colunas-1 }">
															<li class="disabled"><span>&hellip;</span></li>	
														</c:when>
														<c:when test="${pg == colunas }">
															<li><a href="<c:url value='/produto?tpag=${pg }' />" target="_self" rel="next"><c:out value="${pg }" /></a></li>
														</c:when>
													</c:choose>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       				<strong>Ops!</strong> Sem permissão para visualizar o programa.
	      			</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>