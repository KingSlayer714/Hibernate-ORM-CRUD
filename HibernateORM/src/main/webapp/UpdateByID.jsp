<%@page import="com.shubham.entities.TouristLocation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Edit details</h2>
	<form action="UpdateLocation" method="post">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="number" name="locId" value="${tl.locationID}"
					readonly></td>
			</tr>
			<tr>
				<td>Location Name</td>
				<td><input type="text" name="location"
					value="${tl.locationName}"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city" value="${tl.city}"></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" name="country" value="${tl.country}"></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="description"
					value="${tl.description}"></td>
			</tr>
			<tr>
				<td>Average Rating</td>
				<td><input type="range" name="averagerating" min="0" max="10"
					step="0.1" value="${tl.averageRating}"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update"></td>
				<td></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<a href="#" onclick="history.back(); return false;">Back</a>
</body>
</html>