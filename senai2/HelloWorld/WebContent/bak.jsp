<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String n = request.getParameter("nome");
	String id = request.getParameter("idade");
	String s = request.getParameter("sexo");

	if (s != null) {
		if (s.equals("m")) {
			s = "home";
		} else if (s.equals("f")) {
			s = "mulher";
		} else {
			s = "trans";
		}
	}
	int i = 0;
	if (id != null) {
		i = Integer.parseInt(id);
		if (i > 50) {
			id = "idoso";
		} else if (i > 26) {
			id = "adulto";
		} else if (i > 18) {
			id = "adolescente";
		} else {
			id = "criança";
		}
	}

	out.print("ola " + n + " nome " + ", você tem " + i + " anos e é " + s + "e é " + id);
	%>
</body>
</html>