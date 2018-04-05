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
	<jsp:include page="../defaults/main.jsp"></jsp:include>
	
	<jsp:include page="../defaults/menu.jsp"></jsp:include>
	
	<div class="content-wrapper">
		<section class="content-header">
			<h1>
				Usu�rio
				<small>Cadastro de usu�rio</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> In�cio</a></li>
				<li><a href="<c:url value='/menu/configuracoes' />" >Configura��es</a></li>
				<li><a href="<c:url value='/usuario' />" >Usu�rio</a></li>
				<li class="active">Editar</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<form role="form" method="post" action='<c:url value="/usuario/salvar"/>'>
					<div class="box-header with-border">
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoCriacao">Criado em:</label>
							<input type="datetime" id="campoCriacao" class="form-control" value="${usuario.criacao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-6 col-md-6 col-lg-6">
							<label for="campoAlteracao">�ltima altera��o em:</label>
							<input type="datetime" id="campoAlteracao" class="form-control" value="${usuario.alteracao }" disabled>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoCodigo">Codigo</label>
							<input value="${usuario.codigo }" type="text" class="form-control" id="campoCodigo" disabled>
							<input value="${usuario.codigo }" name="usuario.codigo" type="hidden">
						</div>
					</div>
					<div class="box-body">
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoLogin">Login</label>
							<input value="${usuario.usuario }" type="text" class="form-control" id="campoLogin" name="usuario.usuario">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoSenha">Senha</label>
							<input value="${usuario.senha }" type="password" class="form-control" id="campoSenha" name="usuario.senha">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoColaborador">Colaborador desde:</label>
							<input value="${usuario.colaborador }" type="text" class="form-control" id="campoColaborador" name="usuario.colaborador">
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoPessoa">Pessoa</label>
							<select id="campoPessoa" class="form-control select2" name="usuario.pessoa.codigo">
								<c:forEach var="p" items="${pessoas }">
									<c:choose>
										<c:when test="${usuario.pessoa.codigo == p.codigo}">
											<option selected="selected" value="${p.codigo  }">${p.nome }</option>
										</c:when>
										<c:otherwise>
											<option value="${p.codigo  }">${p.nome }</option>
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<label for="campoPerfil">Perfil de Acesso</label>
							<select id="campoPerfil" class="form-control select2" name="usuario.perfil.codigo">
								<c:forEach var="pa" items="${perfis }">
									<c:choose>
										<c:when test="${user.perfil.codigo == pa.codigo}">
											<option selected="selected" value="${pa.codigo  }">${pa.descricao }</option>
										</c:when>
										<c:otherwise>
											<option value="${pa.codigo  }">${pa.descricao }</option>
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<label for="campoAtivo">Ativo</label>
							</div>
							<div id="campoAtivo" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<c:choose>
									<c:when test="${usuario.ativo == true}">
										<input id="checkSwitch" name="usuario.ativo" checked="checked" type="checkbox" data-on-text="Sim" data-off-text="N�o" data-on-color="success" data-off-color="danger">
									</c:when>
									<c:when test="${usuario.ativo == false}">
										<input id="checkSwitch" name="usuario.ativo" type="checkbox" data-on-text="Sim" data-off-text="N�o" data-on-color="success" data-off-color="danger">
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="box-footer">
						<div class="col-xs-12 col-sm-10 col-md-8 col-lg-8">
							<c:if test="${editar != 1 }">
								<button name="submit" value="1" type="submit" class="btn btn-success btn-flat">Salvar</button>
								<button name="submit" value="2" type="submit" class="btn btn-success btn-flat">Salvar e Continuar</button>
							</c:if>
							<a href="<c:url value='/usuario' />"><button type="button" class="btn btn-default btn-flat">Voltar</button></a>
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
									<a href="<c:url value='/usuario/${usuario.codigo }/excluir'/>" ><button type="button" class="btn btn-primary" id="delete">Confirmar</button></a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
					
	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>