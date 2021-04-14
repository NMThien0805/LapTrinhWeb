<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Detail</title>
<script type="text/javascript">
	function validateForm(count_text){
		var myForm = document.forms["myForm"];
		
		var brands = myForm["detail.brands"].value.trim();
		var itemname = myForm["detail.itemname"].value.trim();
		
		if(brands.length==0){
			alert("Please enter your brands!");
            myForm.focus();
            return false;
		}
		else if(brands.length > 15){
			alert("Your brands is too long!");
            myForm.focus();
            return false;
		}
		else if(itemname.length == 0){
			alert("Please enter your itemname!");
            myForm.focus();
            return false;
		}
		else if(itemname.length > 20){
			alert("Your itemname is too long!");
            myForm.focus();
            return false;
		}
		else{
			for(var i = 0; i<count_text - 1 ; i++){
				var text = myForm["detail_bonus.text[" + i + "]"].value.trim();
				if(text.length==0){
					alert("Please enter your text " + (i+1) + "!");
		            myForm.focus();
		            return false;
				}
				else if(text.length > 1000){
					alert("Your text " + (i+1) + " is too long!");
		            myForm.focus();
		            return false;
				}
			}
		}
	}
</script>
</head>
<body>
	<form form name="myForm" onsubmit="return validateForm(${data_detail.count_text })" action="http://localhost:8080/Web/detail/update.htm" modelAttribute="data_detail" method="post">
		${message}
		<div>
			<label>id</label>
			<input type="text" name="detail.id" value="${data_detail.detail.id }" readonly="readonly"/>
		</div>
		<div>
			<label>brands</label>
			<input type="text" name="detail.brands" value="${data_detail.detail.brands }"/>
		</div>
		<div>
			<label>itemname</label>
			<input type="text" name="detail.itemname" value="${data_detail.detail.itemname }"/>
		</div>
		<div>
		<c:forEach varStatus="status" begin="0" end="${data_detail.count_text-1 }">
			<label>itemtext ${status.index+1 }</label>
			<input type="text" name="detail_bonus.text[${status.index }]" value="${data_detail.detail_bonus.text[status.index] }"/>
			<c:if test="${(status.index+1)%3==0 }">
				<br>
			</c:if>
		</c:forEach>	
		</div>
		<div>
			<button class="btn btn-default">UPDATE</button>
		</div>
	</form>
</body>
</html>