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
				Usuário
				<small>Cadastro de usuário</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configurações</a></li>
				<li><a href="<c:url value='/usuario' />" >Usuário</a></li>
				<li class="active">Novo</li>
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
					<form role="form" method="post" action='<c:url value="/usuario/salvar"/>'>
						<div class="box-header with-border">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoCodigo">Codigo</label>
								<input type="text" class="form-control" id="campoCodigo" disabled>
							</div>
						</div>
						<div class="box-body">
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoLogin">Login</label>
								<input type="text" class="form-control" id="campoLogin" name="usuario.usuario">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoSenha">Senha</label>
								<input type="password" class="form-control" id="campoSenha" name="usuario.senha">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoColaborador">Colaborador desde:</label>
								<input type="text" class="form-control" id="campoColaborador" name="usuario.colaborador">
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoPessoa">Pessoa</label>
								<select id="campoPessoa" class="form-control select2"  name="usuario.pessoa.codigo" >
									<c:forEach var="p" items="${pessoas }">
										<option value="${p.codigo  }">${p.nome }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoPerfil">Perfil de Acesso</label>
								<select id="campoPerfil" class="form-control select2" name="usuario.perfil.codigo">
									<c:forEach var="pa" items="${perfis }">
										<option value="${pa.codigo }">${pa.descricao}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<label for="campoAtivo">Ativo</label>
								</div>
								<div id="campoAtivo" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<input id="checkSwitch" name="usuario.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="Não" data-on-color="success" data-off-color="danger">
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<a href="<c:url value='/usuario' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
							</div>
						</div>
					</form>
				</div>
			</c:if>
		</section>
	</div>
	
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>