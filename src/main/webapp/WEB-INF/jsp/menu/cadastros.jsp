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
				Cadastros
				<small>Todos os programas</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li class="active">Cadastros</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<div class="box-header"></div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
	     					<a href="<c:url value='/pessoa' />" ><button class="btn btn-success btn-block btn-lg"> <br>Pessoa<br><br> </button></a><br>
						</div>
						<div class="col-sm-2 col-md-2 col-lg-2"></div>
						<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
							<a href="<c:url value='/produto' />" ><button class="btn btn-success btn-block btn-lg"> <br>Produto<br><br> </button></a><br>
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