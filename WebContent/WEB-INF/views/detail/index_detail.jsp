<%@ page pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>INDEX DOC CSDL</title>
</head>
<body>
	<a href="http://localhost:8080/Web/product/index_product.htm">Index_product</a>
	<table class="table" border="1" style="border-collapse: collapse;" >
		<tr>
			<th>id</th>
			<th>brands</th>
			<th>itemname</th>
			<th>itemtext</th>
			<th>itemlink</th>
		</tr>
		<c:forEach var="u" items="${list }">
			<tr>
				<td>${u.id }</td>
				<td>${u.brands }</td>
				<td>${u.itemname }</td>
				<td>${u.itemtext }</td>
				<td>${u.itemlink }</td>
				
				<%-- <td><a href="http://localhost:8080/Web/detail/delete.htm?id=${u.id }">Delete</a></td>
				<td><a href="http://localhost:8080/Web/detail/update.htm?id=${u.id }">Update</a></td> --%>
			</tr>
		</c:forEach>
	</table>
	<!-- <a href="http://localhost:8080/Web/detail/insert.htm">Insert</a>
	<br> -->
	
</body>
</html>