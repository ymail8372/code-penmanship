<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="parser.Parser_c" %>
<%@ page import="parser.Parser_cpp" %>
<%@ page import="parser.Parser_java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String code = request.getParameter("code_textarea"); %>
	<% String lang = request.getParameter("lang"); %>
	<% if (lang.equals("1")) {
		String[] results;
		results = Parser_c.parse(code);
		out.print("endSpace : " + results[0] + "<br>");
		out.print("equalSign : " + results[1]);
	} else if (lang.equals("2")) {
		Parser_cpp.parse(code);
	} else {
		Parser_java.parse(code);
	}
		%>
</body>
</html>