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
				Busca
				<small>Pesquisa de programas</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/menu' />" ><i class="fa fa-dashboard"></i> Início</a></li>
				<li class="active">Busca</li>
			</ol>
		</section>
		<section class="content">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Resultado da sua busca: </h3>
				</div>
				<div class="box-body">
					Busca: <c:out value="${resultado}" />
					<br>
					<c:if test="${programas == '' }">
						Nenhum resultado encontrado!
					</c:if>
					<c:forEach var="p" items="${programas }">
						Testes: <c:out value="${p.descricao }" />
					</c:forEach>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="../defaults/copyright.jsp"></jsp:include>
</div>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>