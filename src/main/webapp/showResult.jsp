<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="parser.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="parser" class="parser.Parser_c"/>
	<% String code = request.getParameter("code_textarea"); %>
	<% String lang = request.getParameter("lang"); %>
	<% if (lang.equals("1")) {
		ArrayList<String> results = parser.parse(code);
		out.print("endSpace : " + results.get(0) + "<br>");
		out.print("equalSign : " + results.get(1) + "<br>");
		out.print("while : " + results.get(2) + "<br>");
		out.print("for : " + results.get(3) + "<br>");
		out.print("if : " + results.get(4) + "<br>");
		out.print("if else : " + results.get(5) + "<br>");
		
	} else if (lang.equals("2")) {
		Parser_cpp.parse(code);
	} else {
		Parser_java.parse(code);
	}
		%>
</body>
</html>
