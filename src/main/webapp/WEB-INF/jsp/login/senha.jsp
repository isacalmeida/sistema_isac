<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sistema Isac </title>

<jsp:include page="../defaults/header.jsp"></jsp:include>

</head>
<body>
<h1>Senha de acesso</h1>
User: admin
<br>
Pass: admin
<br><br>
<a href="<c:url value='/' />">Voltar!</a>

<jsp:include page="../defaults/footer.jsp"></jsp:include>

</body>
</html>