<%@ page pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet/less" type="text/css" href="themes/less/bootstrap.less">
<meta charset="utf-8" />
<title>INDEX DOC CSDL</title>
</head>
<script type="text/javascript">
	function confirm_action_delete(id){
// 		alert(id)
		var s = "http://localhost:8080/Web/product/delete.htm?id="+id;
// 		alert(s);
		if(confirm("Confirm delete?")){
			var e1 = document.getElementsByTagName("a");
			
			for(var e = 0; e<e1.length;e++){
				e1[e].href = s;
			}
		}
	}
	function confirm_action_update(id){
// 		alert(id)
		var s = "http://localhost:8080/Web/product/update.htm?id="+id;
		if(confirm("Confirm update?")){
			var e1 = document.getElementsByTagName("a");
			
			for(var e = 0; e<e1.length;e++){
				e1[e].href = s;
			}
		}
	}
</script>
<body>
	<a href="http://localhost:8080/Web/product/insert.htm">Insert</a>
	<br>
	<a href="http://localhost:8080/Web/detail/index_detail.htm">Index_detail</a>
	<table class="table" border="1" style="border-collapse: collapse;" >
		<tr>
			<th>id</th>
			<th>brands</th>
			<th>itemname</th>
			<th>color</th>
			<th>quantity</th>
			<th>price</th>
			<th>discount</th>
			<th>linkimg</th>
			<th>itemfullname</th>
			<th>description</th>
			<th>reviews</th>
			<th>type</th>
			<th>newproduct</th>
		</tr>
		<c:forEach var="u" items="${list }">
			<tr>
				<td>${u.id }</td>
				<td>${u.brands }</td>
				<td>${u.itemname }</td>
				<td>${u.color }</td>
				<td>${u.quantity }</td>
				<td>${u.price }</td>
				<td>${u.discount }</td>
				<td>${u.linkimg }</td>
				<td>${u.itemfullname }</td>
				<td>${u.description }</td>
				<td>${u.reviews }</td>
				<td>${u.type }</td>
				<td>${u.newproduct }</td>
				
				<td><a href="" onclick="confirm_action_delete(${u.id})">Delete</a></td>
				<td><a href="" onclick="confirm_action_update(${u.id})">Update</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>