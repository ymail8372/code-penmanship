<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코딩 필체 분석기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./style.css"><link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
		<h1>
		✏️ 코딩 필체 분석기
		</h1>
		<form name="code_form" action="showResult.jsp">
			<div id="cont1" class="card">
				<label>언어 선택 : </label>
				<input type="radio" name="lang" value="1" checked> <label>C /</label>
				<input type="radio" name="lang" value="2"> <label>C++ /</label>
				<input type="radio" name="lang" value="3"> <label>JAVA</label>
			</div>
			<div id="cont2">
				<textarea rows="20" cols="20" name="code_textarea" class="card" required></textarea>
			</div>
			<br>
			<div id="cont3">
				<input type="submit" class="btn btn-primary" value="제출">
			</div>
		</form>
	</div>
</body>
</html>