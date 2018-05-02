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
				Configurações
				<small>Todos os programas</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li class="active">Configurações</li>
			</ol>
		</section>
		<section class="content">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#pessoa">Pessoa</a></li>
					<li><a data-toggle="tab" href="#produto">Produto</a></li>
					<li><a data-toggle="tab" href="#outros">Outros</a></li>
				</ul>
				<br>
				<div class="tab-content">
					<div class="tab-pane active" id="pessoa">
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	     						<a href="<c:url value='/perfil_acesso' />" ><button class="btn btn-success btn-block btn-lg"> <br>Perfil de Acesso<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
								<a href="<c:url value='/usuario' />" ><button class="btn btn-success btn-block btn-lg"> <br>Usuário<br><br> </button></a><br>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	     						<a href="<c:url value='/cep' />" ><button class="btn btn-success btn-block btn-lg"> <br>Cep<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
								<a href="<c:url value='/cidade' />" ><button class="btn btn-success btn-block btn-lg"> <br>Cidade<br><br> </button></a><br>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/estado' />" ><button class="btn btn-success btn-block btn-lg"> <br>Estado<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
						</div>
					</div>
					<div class="tab-pane" id="produto">
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/cor' />" ><button class="btn btn-success btn-block btn-lg"> <br>Cor<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
								<a href="<c:url value='/departamento' />" ><button class="btn btn-success btn-block btn-lg"> <br>Departamento<br><br> </button></a><br>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/fabricante' />" ><button class="btn btn-success btn-block btn-lg"> <br>Fabricante<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
								<a href="<c:url value='/frete' />" ><button class="btn btn-success btn-block btn-lg"> <br>Frete<br><br> </button></a><br>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/entrega' />" ><button class="btn btn-success btn-block btn-lg"> <br>Entrega<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
						</div>
					</div>
					<div class="tab-pane" id="outros">
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/acessos' />" ><button class="btn btn-success btn-block btn-lg"> <br>Acessos<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/configuracoes' />" ><button class="btn btn-success btn-block btn-lg"> <br>Geral<br><br> </button></a><br>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
		     					<a href="<c:url value='/programas' />" ><button class="btn btn-success btn-block btn-lg"> <br>Programas<br><br> </button></a><br>
							</div>
							<div class="col-sm-2 col-md-2 col-lg-2"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>
 
<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>