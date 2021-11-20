<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<% String code = request.getParameter("code_textarea"); %>
<% String lang = request.getParameter("lang"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function display(value) {
		if (value == 1) {
			$('.cpp').css("display", "none");
			$('.java').css("display", "none");
		}
		else if (value == 2) {
			$('.c').css("display", "none");
			$('.java').css("display", "none");
		}
		else {
			$('.c').css("display", "none");
			$('.cpp').css("display", "none");
		}
	}

	$(document).ready(function() {
	var num = "<%=Integer.parseInt(lang)%>";
		display(num);
	});
</script>
</head>
<body>
	<jsp:useBean id="parser_common" class="parser.Parser_common"/>
	<jsp:useBean id="parser_c" class="parser.Parser_c"/>
	<jsp:useBean id="parser_cpp" class="parser.Parser_cpp"/>
	<jsp:useBean id="parser_java" class="parser.Parser_java"/>
	<% ArrayList<String> results_common = parser_common.parse(code); %>
	<% ArrayList<String> results_c = parser_c.parse(code); %>
	<% ArrayList<String> results_cpp = parser_cpp.parse(code); %>
	<% ArrayList<String> resultsForTable = new ArrayList<String>(); %>
	<div id="wrapper">
		<h1>✏️ 분석 결과</h1>
		<div class="whole common">
		<h2>공통 요소</h2>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">⚙️ 마지막 빈 라인 여부</p>
						<p> <% 
						if (results_common.get(0).equals("1")) {
							out.print("코드의 마지막에 빈 라인이 있습니다.");
						}
						else {
							out.print("코드의 마지막에 빈 라인이 없습니다.");
						}
						%> </p> 
						<p> <% 
						if (results_common.get(0).equals("1")) {
							resultsForTable.add("1");
							out.print("결과 : 🟢");
						}
						else {
							resultsForTable.add("0");
							out.print("결과 : 🔴");
						}
						%> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">🖼 while문</p>
						<p> <% 
						int total_while = Integer.valueOf(results_common.get(2).split(" ")[0]);
						int space_while = Integer.valueOf(results_common.get(2).split(" ")[1]);
						if (total_while != 0) {
							double percent_while = (double)space_while / total_while * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_while + "</span><br>");
							out.print("while문 오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + total_while + "</span><br>");
							%> </p>
							<p> <%
							out.print("while문을 총 <span class=\"color\">" + total_while + "</span>번 사용하였고, while문 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_while + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_while) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_while >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_while >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("while문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">🖼 if문</p>
						<p> <% 
						int total_if = Integer.valueOf(results_common.get(4).split(" ")[0]);
						int space_if = Integer.valueOf(results_common.get(4).split(" ")[1]);
						if (total_if != 0) {
							double percent_if = (double)space_if / total_if * 100;
						
							out.print("총 사용 횟수 : <span class=\"color\">" + total_if + "</span><br>");
							out.print("if문 오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + space_if + "</span><br>");
							%> </p>
							<p> <%
							out.print("if문을 총 <span class=\"color\">" + total_if + "</span>번 사용하였고, if문 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_if + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_if) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_if >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_if >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("if문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">⚙️ 들여쓰기</p>
						<p> <% 
						if (results_common.get(6).length() == 1) {
							out.print("<span class=\"color\">Tab</span>을 이용한 들여쓰기를 사용합니다.");
						}
						else {
							int space_blank = Integer.valueOf(results_common.get(6).split(" ")[1]);
							
							out.print("<span class=\"color\">space</span>를 이용한 들여쓰기를 사용하고, <span class=\"color\">" + space_blank + "</span>개의 space를 사용합니다.");
						} %> </p>
							<p> <% 
							if (results_common.get(6).length() == 1) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else {
								resultsForTable.add("0 " + results_common.get(6).split(" ")[1]);
								out.print("결과 : 🔴 " + "(" + Integer.valueOf(results_common.get(6).split(" ")[1]) + ")");
							}
							%> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">➕ "%" 연산자</p>
						<p> <% 
						int total_remainder = Integer.valueOf(results_common.get(8).split(" ")[0]);
						int space_remainder = Integer.valueOf(results_common.get(8).split(" ")[1]);
						if (total_remainder != 0) {
							double percent_remainder = (double)space_remainder / total_remainder * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_remainder + "</span><br>");
							out.print("\"%\" 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_remainder + "</span><br>");
							%> </p>
							<p> <%
							out.print("\"%\" 연산자를 총 <span class=\"color\">" + total_remainder + "</span>번 사용하였고, \"%\" 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_remainder + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_remainder) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_remainder >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_remainder >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("\"%\" 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">➕ 논리 연산자( &&, || )</p>
						<p> <% 
						int total_logical = Integer.valueOf(results_common.get(11).split(" ")[0]);
						int space_logical = Integer.valueOf(results_common.get(11).split(" ")[1]);
						if (total_logical != 0) {
							double percent_logical = (double)space_logical / total_logical * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_logical + "</span><br>");
							out.print("논리 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_logical + "</span><br>");
							%> </p>
							<p> <%
							out.print("논리 연산자를 총 <span class=\"color\">" + total_logical + "</span>번 사용하였고, 논리 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_logical + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_logical) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_logical >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_logical >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("if문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">➕ "==" 연산자</p>
						<p> <% 
						int total_equal = Integer.valueOf(results_common.get(13).split(" ")[0]);
						int space_equal = Integer.valueOf(results_common.get(13).split(" ")[1]);
						if (total_equal != 0) {
							double percent_equal = (double)space_equal / total_equal * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_equal + "</span><br>");
							out.print("\"==\"  연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_equal + "</span><br>");
							%> </p>
							<p> <%
							out.print("\"==\" 연산자를 총 <span class=\"color\">" + total_equal + "</span>번 사용하였고, \"==\" 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_equal + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_equal) + "%</span>의 비율입니다.");
							%> </p>
							<p> <% 
							if (percent_equal >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_equal >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("\"==\" 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">➕ "=" 연산자</p>
						<p> <% 
						int total_equalsign = Integer.valueOf(results_common.get(1).split(" ")[0]);
						int space_equalsign = Integer.valueOf(results_common.get(1).split(" ")[1]);
						if (total_equalsign != 0) {
							double percent_equalsign = (double)space_equalsign / total_equalsign * 100;
						
							out.print("총 사용 횟수 : <span class=\"color\">" + total_equalsign + "</span><br>");
							out.print("양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_equalsign + "</span><br>");
							%> </p>
							<p> <%
							out.print("\"=\" 연산자를 총 <span class=\"color\">" + total_equalsign + "</span>번 사용하였고, \"=\" 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_equalsign + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_equalsign) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_equalsign >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_equalsign >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("\"=\" 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">🖼 for문</p>
						<p> <% 
						int total_for = Integer.valueOf(results_common.get(3).split(" ")[0]);
						int space_for = Integer.valueOf(results_common.get(3).split(" ")[1]);
						if (total_for != 0) {
							double percent_for = (double)space_for / total_for * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_for + "</span><br>");
							out.print("for문 오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + space_for + "</span><br>");
							%> </p>
							<p> <%
							out.print("for문을 총 <span class=\"color\">" + total_for + "</span>번 사용하였고, for문 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_for + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_for) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_for >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_for >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("for문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">🖼 if else문</p>
						<p> <% 
						int total_ifelse = Integer.valueOf(results_common.get(5).split(" ")[0]);
						int space_ifelse = Integer.valueOf(results_common.get(5).split(" ")[1]);
						if (total_ifelse != 0) {
							double percent_ifelse = (double)space_ifelse / total_ifelse * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_ifelse + "</span><br>");
							out.print("if문 다음 라인에 else문을 사용하는 경우 : <span class=\"color\">" + space_ifelse + "</span><br>");
							%> </p>
							<p> <%
							out.print("if else문을 총 <span class=\"color\">" + total_ifelse + "</span>번 사용하였고, if문 다음 라인에 else문을 사용하는 경우는 <span class=\"color\">" + space_ifelse + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_ifelse) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_ifelse >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_ifelse >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("if else문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">사칙연산 연산자( +, -, *, / )</p>
						<p> <% 
						int total_four = Integer.valueOf(results_common.get(7).split(" ")[0]);
						int space_four = Integer.valueOf(results_common.get(7).split(" ")[1]);
						if (total_four != 0) {
							double percent_four = (double)space_four / total_four * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_four + "</span><br>");
							out.print("사칙연산 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_four + "</span><br>");
							%> </p>
							<p> <%
							out.print("사칙연산 연산자를 총 <span class=\"color\">" + total_four + "</span>번 사용하였고, 사칙연산 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_four + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_four) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_four >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_four >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("사칙연산 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">➕ 비교 연산자( &lt;, >, &lt;=, >= )</p>
						<p> <% 
						int total_comparison = Integer.valueOf(results_common.get(9).split(" ")[0]) + Integer.valueOf(results_common.get(10).split(" ")[0]);
						int space_comparison = Integer.valueOf(results_common.get(9).split(" ")[1]) + Integer.valueOf(results_common.get(10).split(" ")[1]);
						if (total_comparison != 0) {
							double percent_comparison = (double)space_comparison / total_comparison * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_comparison + "</span><br>");
							out.print("비교 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_comparison + "</span><br>");
							%> </p>
							<p> <%
							out.print("비교 연산자를 총 <span class=\"color\">" + total_comparison + "</span>번 사용하였고, 비교 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_comparison + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_comparison) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_comparison >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_comparison >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("비교 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
				<div class="card">
					<div class="cont">
						<p class="title">➕ 증감 연산자( ++, -- )</p>
						<p> <% 
						int total_increment = Integer.valueOf(results_common.get(12).split(" ")[0]);
						int space_increment = Integer.valueOf(results_common.get(12).split(" ")[1]);
						if (total_increment != 0) {
							double percent_increment = (double)space_increment / total_increment * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_increment + "</span><br>");
							out.print("증감 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_increment + "</span><br>");
							%> </p>
							<p> <%
							out.print("증감 연산자를 총 <span class=\"color\">" + total_increment + "</span>번 사용하였고, 증감 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_increment + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_increment) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_increment >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_increment >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("증감 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
		</div>
		<div class="whole c">
		<h2>C 전용 요소</h2>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">🖼 printf문</p>
						<p> <% 
						int total_printf = Integer.valueOf(results_c.get(0).split(" ")[0]);
						int space_printf = Integer.valueOf(results_c.get(0).split(" ")[1]);
						if (total_printf != 0) {
							double percent_printf = (double)space_printf / total_printf * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_printf + "</span><br>");
							out.print("printf문 오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + space_printf + "</span><br>");
							%> </p>
							<p> <%
							out.print("printf문을 총 <span class=\"color\">" + total_printf + "</span>번 사용하였고, printf문 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_printf + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_printf) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_printf >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_printf >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("printf문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">🖼 scanf문</p>
						<p> <% 
						int total_scanf = Integer.valueOf(results_c.get(1).split(" ")[0]);
						int space_scanf = Integer.valueOf(results_c.get(1).split(" ")[1]);
						if (total_scanf != 0) {
							double percent_scanf = (double)space_scanf / total_scanf * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_scanf + "</span><br>");
							out.print("scanf문 오른쪽에 빈칸이 있는 경우 : <span class=\"color\">" + space_scanf + "</span><br>");
							%> </p>
							<p> <%
							out.print("scanf문을 총 <span class=\"color\">" + total_scanf + "</span>번 사용하였고, scanf문 오른쪽에 빈칸이 있는 경우는 <span class=\"color\">" + space_scanf + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_scanf) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_scanf >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_scanf >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("scanf문을 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
		</div>
		<div class="whole cpp">
		<h2>C++ 전용 요소</h2>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">➕ 쉬프트 연산자( &lt;&lt;, >> )</p>
						<p> <% 
						int total_operator_shift = Integer.valueOf(results_cpp.get(0).split(" ")[0]);
						int space_operator_shift = Integer.valueOf(results_cpp.get(0).split(" ")[1]);
						if (total_operator_shift != 0) {
							double percent_operator_shift = (double)space_operator_shift / total_operator_shift * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_operator_shift + "</span><br>");
							out.print("쉬프트 연산자 양 옆에 빈칸이 있는 경우 : <span class=\"color\">" + space_operator_shift + "</span><br>");
							%> </p>
							<p> <%
							out.print("쉬프트 연산자를 총 <span class=\"color\">" + total_operator_shift + "</span>번 사용하였고, 쉬프트 연산자 양 옆에 빈칸이 있는 경우는 <span class=\"color\">" + space_operator_shift + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_operator_shift) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_operator_shift >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_operator_shift >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("쉬프트 연산자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
			<div class="half">
				<div class="card">
					<div class="cont">
						<p class="title">⚙️ 개행 문자</p>
						<p> <% 
						int total_newLine = Integer.valueOf(results_cpp.get(0).split(" ")[0]);
						int endl = Integer.valueOf(results_cpp.get(0).split(" ")[1]);
						int newLine = total_newLine - endl;
						if (total_newLine != 0) {
							double percent_newLine = (double)endl / total_newLine * 100;
							
							out.print("총 사용 횟수 : <span class=\"color\">" + total_newLine + "</span><br>");
							out.print("endl을 사용하는  경우 : <span class=\"color\">" + endl + "</span><br>");
							out.print("\\n을 사용하는 경우 : <span class=\"color\">" + newLine + "</span><br>");
							%> </p>
							<p> <%
							out.print("개행 문자를 총 <span class=\"color\">" + total_newLine + "</span>번 사용하였고, endl을 사용하는  경우는 <span class=\"color\">" + endl + "</span>번으로, <span class=\"color\">" + String.format("%.2f", percent_newLine) + "%</span>의 비율입니다.");
							%> </p> 
							<p> <% 
							if (percent_newLine >= 70) {
								resultsForTable.add("1");
								out.print("결과 : 🟢");
							}
							else if (percent_newLine >= 30) {
								resultsForTable.add("2");
								out.print("결과 : 🟡");
							}
							else {
								resultsForTable.add("0");
								out.print("결과 : 🔴");
							}
							%> </p>
						<p> <% 
						}
						else {
							resultsForTable.add("3");
							out.print("개행 문자를 사용하지 않았습니다.");
						} %> </p>
					</div>
				</div>
			</div>
		</div>
		<div class="whole java">
			<div class="half">
				
			</div>
			<div class="half">
				
			</div>
		</div>
		<h2>정리</h2>
		<div class="card c final">
			<table>
				<tr><th>마지막 빈 라인</th><th>while문</th><th>if문</th><th>들여쓰기</th><th>"%" 연산자</th><th>논리 연산자<br>( &&, || )</th><th>"==" 연산자</th><th>"=" 연산자</th></tr>
				<tr>
				<% for (int i = 0; i < 3; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				if (resultsForTable.get(3).equals("1")) {
					out.print("<td>🟢</td>");
				}
				else {
					out.print("<td>🔴 (" + resultsForTable.get(3).split(" ")[1] + ")</td>");
				}
				for (int i = 4; i < 8; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
				<tr><th>for문</th><th>if else문</th><th>사칙연산 연산자<br>( +, -, *, / )</th><th>비교 연산자<br>( &lt;, >, &lt;=, >= )</th><th>증감 연산자<br>( ++, -- )</th><th>printf문</th><th>scanf문</th><th> </th></tr>
				<tr>
				<% for (int i = 8; i < 15; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
			</table>
		</div>
		<div class="card cpp final">
			<table>
				<tr><th>마지막 빈 라인</th><th>while문</th><th>if문</th><th>들여쓰기</th><th>"%" 연산자</th><th>논리 연산자<br>( &&, || )</th><th>"==" 연산자</th><th>"=" 연산자</th></tr>
				<tr>
				<% for (int i = 0; i < 3; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				if (resultsForTable.get(3).equals("1")) {
					out.print("<td>🟢</td>");
				}
				else {
					out.print("<td>🔴 (" + resultsForTable.get(3).split(" ")[1] + ")</td>");
				}
				for (int i = 4; i < 8; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
				<tr><th>for문</th><th>if else문</th><th>사칙연산 연산자<br>( +, -, *, / )</th><th>비교 연산자<br>( &lt;, >, &lt;=, >= )</th><th>증감 연산자<br>( ++, -- )</th><th>쉬프트 연산자<br>( &lt;&lt;, >>)</th><th>개행 문자</th><th> </th></tr>
				<tr>
				<% for (int i = 8; i < 13; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				for (int i = 15; i < 17; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
			</table>
		</div>
		<div class="card java final">
			<table>
				<tr><th>마지막 빈 라인</th><th>while문</th><th>if문</th><th>들여쓰기</th><th>"%" 연산자</th><th>논리 연산자<br>( &&, || )</th><th>"==" 연산자</th><th>"=" 연산자</th></tr>
				<tr>
				<% for (int i = 0; i < 3; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				if (resultsForTable.get(3).equals("1")) {
					out.print("<td>🟢</td>");
				}
				else {
					out.print("<td>🔴 (" + resultsForTable.get(3).split(" ")[1] + ")</td>");
				}
				for (int i = 4; i < 8; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
				<tr><th>for문</th><th>if else문</th><th>사칙연산 연산자<br>( +, -, *, / )</th><th>비교 연산자<br>( &lt;, >, &lt;=, >= )</th><th>증감 연산자<br>( ++, -- )</th><th> </th><th> </th><th> </th></tr>
				<tr>
				<% for (int i = 8; i < 13; i ++) {
					if (resultsForTable.get(i).equals("1")) {
						out.print("<td>🟢</td>");
					}
					else if (resultsForTable.get(i).equals("2")) {
						out.print("<td>🟡</td>");
					}
					else if (resultsForTable.get(i).equals("0")) {
						out.print("<td>🔴</td>");
					}
					else {
						out.print("<td>❌</td>");
					}
				}
				%>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
