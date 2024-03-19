<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Search Location</h2>
	<hr>
	<form method="post" action="SearchLocationResult.jsp">
		<table>
			<tr>
				<td>Location ID</td>
				<td><input type="number" name="locId"></td>
				<td><input type="submit" value="Search"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="SearchLocationOnCity.jsp">
		<table>
			<tr>
				<td>City</td>
				<td><input type="text" name="city"></td>
				<td><input type="submit" value="Search"></td>
			</tr>
		</table>
	</form>
	<br>
	<a href="#" onclick="history.back(); return false;">Back</a>
</body>
</html>