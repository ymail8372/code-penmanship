<%@ page language="java" contentType="text/html"; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="parser.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코딩 필체 분석기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./style_result.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:useBean id="parser" class="parser.Parser_c"/>
	<% String code = request.getParameter("code_textarea"); %>
	<% String lang = request.getParameter("lang"); %>
	<% if (lang.equals("1")) {
		/* ArrayList<String> results = parser.parse(code);
		out.print("endSpace : " + results.get(0) + "<br>");
		out.print("assignment : " + results.get(1) + "<br>");
		out.print("while : " + results.get(2) + "<br>");
		out.print("for : " + results.get(3) + "<br>");
		out.print("if : " + results.get(4) + "<br>");
		out.print("if else : " + results.get(5) + "<br>");
		out.print("blank : " + results.get(6) + "<br>");
		out.print("operator_four : " + results.get(7) + "<br>");
		out.print("operator_remainder : " + results.get(8) + "<br>");
		out.print("operator_comparison1 : " + results.get(9) + "<br>");
		out.print("operator_logical : " + results.get(10) + "<br>");
		out.print("operator_increment : " + results.get(11) + "<br>");
		out.print("operator_comparison2 : " + results.get(12) + "<br>");
		out.print("operator_equal : " + results.get(13) + "<br>"); */
		
	} else if (lang.equals("2")) {
		Parser_cpp.parse(code);
	} else {
		Parser_java.parse(code);
	}
	%>
	<div id="wrapper">
		<h1>분석 결과</h1>
		<div class="half">
			<div class="card common">
				<div class="cont">
					<p class="title">마지막 빈 라인 여부</p>
					<p> <% 
					ArrayList<String> results = parser.parse(code);
					if (results.get(0).equals("1")) {
						out.print("코드의 마지막에 빈 라인을 넣습니다.");
					}
					else {
						out.print("코드의 마지막에 빈 라인을 넣지 않습니다.");
					}
						%> </p> 
				</div>
			</div>
			<div class="card common">
				<div class="cont">
					<p class="title"> "=" 연산자</p>
					<p> <% 
					int total_equal = Integer.valueOf(results.get(1).split(" ")[0]);
					int space_equal = Integer.valueOf(results.get(1).split(" ")[1]);
					if (total_equal != 0) {
						double percent_equal = space_equal / total_equal * 100;
					
						out.print("총 사용 횟수 : <span class=\"color\">" + total_equal + "</span><br>");
						out.print("양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + total_equal + "</span><br>");
						%> </p>
						<p> <%
						out.print("\"=\" 연산자를 총 <span class=\"color\">" + total_equal + "</span>번 사용하였고, \"=\" 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_equal + "</span>번으로, <span class=\"color\">" + percent_equal + "%</span>의 비율입니다.");
						%> </p> 
						<p> <%
						out.print("결과 : ");
						
					}
					else {
						out.print("\"=\" 연산자를 사용하지 않았습니다.");
					} %> </p>
				</div>
			</div>
		</div>
		<div class="half">
			<div class="card common">
				<div class="cont">
					<p class="title">while</p>
					<p> <% 
					int total_while = Integer.valueOf(results.get(2).split(" ")[0]);
					int space_while = Integer.valueOf(results.get(2).split(" ")[1]);
					if (total_while != 0) {
						double percent_while = space_while / total_while * 100;
						
						out.print("총 사용 횟수 : <span class=\"color\">" + total_while + "</span><br>");
						out.print("오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + total_while + "</span><br>");
						%> </p>
						<p> <%
						out.print("while을 총 <span class=\"color\">" + total_while + "</span>번 사용하였고, while 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_while + "</span>번으로, <span class=\"color\">" + percent_while + "%</span>의 비율입니다.");
						%> </p> 
						<p> <%
						out.print("결과 : ");
						
					}
					else {
						out.print("while을 사용하지 않았습니다.");
					} %> </p>
				</div>
			</div>
			<div class="card common">
				<div class="cont">
					<p class="title">for</p>
					<p> <% 
					int total_for = Integer.valueOf(results.get(3).split(" ")[0]);
					int space_for = Integer.valueOf(results.get(3).split(" ")[1]);
					if (total_for != 0) {
						double percent_for = space_for / total_for * 100;
						
						out.print("총 사용 횟수 : <span class=\"color\">" + total_for + "</span><br>");
						out.print("오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + space_for + "</span><br>");
						%> </p>
						<p> <%
						out.print("for을 총 <span class=\"color\">" + total_for + "</span>번 사용하였고, for 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_for + "</span>번으로, <span class=\"color\">" + percent_for + "%</span>의 비율입니다.");
						%> </p> 
						<p> <%
						out.print("결과 : ");
						
					}
					else {
						out.print("for을 사용하지 않았습니다.");
					} %> </p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
