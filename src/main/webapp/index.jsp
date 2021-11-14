<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./style.css"><link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<h1>CODE Penmanship</h1>
	<form name="code_form" action="showResult.jsp" method="post">
		<div id="cont">
			<label>언어 선택 : </label>
			<input type="radio" name="lang" value="1" checked> <label>C /</label>
			<input type="radio" name="lang" value="2"> <label>C++ /</label>
			<input type="radio" name="lang" value="3"> <label>JAVA</label>
		</div>
		<textarea rows="20" cols="100" name="code_textarea" required></textarea>
		<br><br>
		<input type="submit" class="btn btn-primary" value="제출">
	</form>
</body>
</html>