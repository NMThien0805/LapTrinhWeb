<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet/less" type="text/css" href="themes/less/bootstrap.less">
<link rel="stylesheet" type="text/css" href="bootstrap/css/all.css" />
	
<title>Insert title here</title>
</head>
<body>
	<%-- <c:forEach varStatus="status" items="${dsach }" var="i">
		<li>${i.email }</li>
		<li>${i.password }</li>
	</c:forEach>
	
	<l1>${accout.email }</l1> --%>
	
	<%-- <!-- DETAIL -->
	<c:forEach items="${text }" var="i" varStatus="status">
		<p>${i }</p>
		<p>${link[status.index].length() }</p>
		<c:if test="${link[status.index].length() > 0}">
			<img alt="#" src="${link[status.index] }" width="400px">
		</c:if>
	</c:forEach> --%>
	
	<!-- PRODUCT -->
	<%-- <c:forEach items="${list_product}" var="i" varStatus="status">
		<c:if test="${status.index!=0 }">
			<b>${status.index }</b>
			<img alt="" src="${i.linkimg }" width="400px">
			
			<h1>${list_bonus[status.index].fullname1 }
			<span>${list_bonus[status.index].fullname2 }</span></h1>
			
			<li>${list_bonus[status.index].description1 }</li>
			<li>${list_bonus[status.index].description2 }</li>
			<li>${list_bonus[status.index].description3 }</li>
			<li>${list_bonus[status.index].description4 }</li>
			<li>${list_bonus[status.index].description5 }</li>
			
			<p><b>${start[status.index] }</b>
			</p>
			<br>
		</c:if>
	</c:forEach> --%>
	<!-- t1 -->
	<%-- <c:forEach items="${list_best_product }" var="bp" varStatus="status_best">
		<b>${status_best.index } </b><b>${bp.reviews } </b><b>${bp.itemname } </b><br>
	</c:forEach> --%>
	
	<!-- test product link hinh anh -->
	<c:forEach items="${s }" var="i">
		<b>${i.linkimg }</b>
		<br>
		<img alt="" src="${i.linkimg }" width="400">
		<br>
	</c:forEach>
	
<!-- 	<!-- code event -->
<%-- 	<c:forEach items="${dsach }" var="i"> --%>
<%-- 		<b>${i.code } ${i.discountcode }</b><br> --%>
<%-- 	</c:forEach> --%>
</body>
</html>