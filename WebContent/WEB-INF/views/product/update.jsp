<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function validateForm() {
		var myForm = document.forms["myForm"];
		
		var brands = myForm["product.brands"].value.trim();
/* 		document.writeln("bua" + brands + "|"); */
		var itemname = myForm["product.itemname"].value.trim();
		var color = myForm["product.color"].value.trim();
		var quantity = myForm["product.quantity"].value;
		var price = myForm["product.price"].value;
		var discount = myForm["product.discount"].value;
		var fullname1 = myForm["product_bonus.fullname1"].value.trim();
		var fullname2 = myForm["product_bonus.fullname2"].value.trim();
		var description1 = myForm["product_bonus.description1"].value.trim();
		var description2 = myForm["product_bonus.description2"].value.trim();
		var description3 = myForm["product_bonus.description3"].value.trim();
		var description4 = myForm["product_bonus.description4"].value.trim();
		var description5 = myForm["product_bonus.description5"].value.trim();
		var reviews = myForm["product.reviews"].value;
		var type = myForm["product.type"].value.trim();
		var count_text = myForm["count_text"].value;
		var count_link = myForm["count_link"].value;
		
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
		else if(color.length == 0){
			alert("Please enter your color!");
            myForm.focus();
            return false;
		}
		else if(color.length > 500){
			alert("Your color is too long!");
            myForm.focus();
            return false;
		}
		else if(quantity.length == 0){
			alert("Please enter your quantity!");
            myForm.focus();
            return false;
		}
		else if(isNaN(quantity)){
			alert("Quantity is not right!");
            myForm.focus();
            return false;
		}
		else if(quantity < 0 || quantity > 500){
			alert("Your quantity is out of range!");
            myForm.focus();
            return false;
		}
		else if(price.length == 0){
			alert("Please enter your price!");
            myForm.focus();
            return false;
		}
		else if(isNaN(price)){
			alert("Price is not right!");
            myForm.focus();
            return false;
		}
		else if(price < 0){
			alert("Your price is out of range!");
            myForm.focus();
            return false;
		}
		else if(discount.length == 0){
			alert("Please enter your discount!");
            myForm.focus();
            return false;
		}
		else if(isNaN(discount)){
			alert("Discount is not right!");
            myForm.focus();
            return false;
		}
		else if(discount < 0){
			alert("Your discount is out of range!");
            myForm.focus();
            return false;
		}
		else if(newproduct.length == 0){
			alert("Please enter your type!");
            myForm.focus();
            return false;
		}
		else if(newproduct != "true" && newproduct != "false"){
			alert("Your newproduct is true or false!");
            myForm.focus();
            return false;
		}
		else if(fullname1.length == 0){
			alert("Please enter your fullname1!");
            myForm.focus();
            return false;
		}
		else if(fullname1.length > 200){
			alert("Your fullname1 is too long!");
            myForm.focus();
            return false;
		}
		else if(fullname2.length == 0){
			alert("Please enter your fullname2!");
            myForm.focus();
            return false;
		}
		else if(fullname2.length > 500){
			alert("Your fullname2 is too long!");
            myForm.focus();
            return false;
		}
		else if(description1.length == 0){
			alert("Please enter your description1!");
            myForm.focus();
            return false;
		}
		else if(description1.length > 100){
			alert("Your description1 is too long!");
            myForm.focus();
            return false;
		}
		else if(description2.length == 0){
			alert("Please enter your description2!");
            myForm.focus();
            return false;
		}
		else if(description2.length > 100){
			alert("Your description2 is too long!");
            myForm.focus();
            return false;
		}
		else if(description3.length == 0){
			alert("Please enter your description3!");
            myForm.focus();
            return false;
		}
		else if(description3.length > 100){
			alert("Your description3 is too long!");
            myForm.focus();
            return false;
		}
		else if(description4.length == 0){
			alert("Please enter your description4!");
            myForm.focus();
            return false;
		}
		else if(description4.length > 100){
			alert("Your description4 is too long!");
            myForm.focus();
            return false;
		}
		else if(description5.length == 0){
			alert("Please enter your description5!");
            myForm.focus();
            return false;
		}
		else if(description5.length > 100){
			alert("Your description5 is too long!");
            myForm.focus();
            return false;
		}
		else if(reviews.length == 0){
			alert("Please enter your reviews!");
            myForm.focus();
            return false;
		}
		else if(isNaN(reviews)){
			alert("Reviews is not right!");
            myForm.focus();
            return false;
		}
		else if(reviews < 0 || reviews > 10){
			alert("Your reviews is out of range!");
            myForm.focus();
            return false;
		}
		else if(type.length == 0){
			alert("Please enter your type!");
            myForm.focus();
            return false;
		}
		else if(type.length > 5){
			alert("Your type is too long!");
            myForm.focus();
            return false;
		}
		else if(type != "MB" && type != "SB" && type != "FG" && type != "CB"){
			alert("Your type is MB or SB or FG or CB!" + 
					"\nMB:Mountain Bike   SB: Sport Bike   FG: Fixed Gear Bike   CB: Children's Bike");
            myForm.focus();
            return false;
		}
		else if(count_text.length == 0){
			alert("Please enter your count_text!");
            myForm.focus();
            return false;
		}
		else if(isNaN(count_text)){
			alert("Count_text is not right!");
            myForm.focus();
            return false;
		}
		else if(count_text < 0 || count_text > 100){
			alert("Your count_text is out of range!");
            myForm.focus();
            return false;
		}
		else if(count_link.length == 0){
			alert("Please enter your count_link!");
            myForm.focus();
            return false;
		}
		else if(isNaN(count_link)){
			alert("Count_link is not right!");
            myForm.focus();
            return false;
		}
		else if(count_link < 0){
			alert("Your count_link is out of range!");
            myForm.focus();
            return false;
		}
		return true;
	}
</script>
<meta charset="UTF-8">
<title>Update Product</title>
</head>
<body>
	<form:form name="myForm" onsubmit="return validateForm()" action="http://localhost:8080/Web/product/update.htm?id_item=${data_product.product.id }" modelAttribute="data_product">
		${message}
		<div>
			<label>id</label>
			<input type="text" name="product.id" value="${data_product.product.id }" readonly="readonly"/>
		</div>
		<div>
			<label>brands</label>
			<input type="text" name="product.brands" value="${data_product.product.brands }"/>
		</div>
		<div>
			<label>itemname</label>
			<input type="text" name="product.itemname" value="${data_product.product.itemname }"/>
		</div>
		<div>
			<label>color</label>
			<input type="text" name="product.color" value="${data_product.product.color }"/>
		</div>
		<div>
			<label>quantity</label>
			<input type="text" name="product.quantity" value="${data_product.product.quantity }"/>
		</div>
		<div>
			<label>price</label>
			<input type="text" name="product.price" value="${data_product.product.price }"/>
		</div>
		<div>
			<label>discount</label>
			<input type="text" name="product.discount" value="${data_product.product.discount }"/>
		</div>
		<div>
			<label>newproduct</label>
			<input type="text" name="product.newproduct" value="${data_product.product.newproduct }"/>
		</div>
		<div>
			<label>itemfullname1</label>
			<input type="text" name="product_bonus.fullname1" value="${data_product.product_bonus.fullname1 }"/>
			<label>itemfullname2</label>
			<input type="text" name="product_bonus.fullname2" value="${data_product.product_bonus.fullname2 }"/>
		</div>
		<div>
			<label>description1</label>
			<input type="text" name="product_bonus.description1" value="${data_product.product_bonus.description1 }"/>
			<label>description2</label>
			<input type="text" name="product_bonus.description2" value="${data_product.product_bonus.description2 }"/>
			<label>description3</label>
			<input type="text" name="product_bonus.description3" value="${data_product.product_bonus.description3 }"/>
			<label>description4</label>
			<input type="text" name="product_bonus.description4" value="${data_product.product_bonus.description4 }"/>
			<label>description5</label>
			<input type="text" name="product_bonus.description5" value="${data_product.product_bonus.description5 }"/>
		</div>
		<div>
			<label>reviews</label>
			<input type="text" name="product.reviews" value="${data_product.product.reviews }"/>
		</div>
		<div>
			<label>type</label>
			<input type="text" name="product.type" value="${data_product.product.type }"/>
		</div>
		<div>
			<label>count text</label>
			<input type="text" name="count_text" value="${data_product.count_text }"/>
			<label>count link</label>
			<input type="text" name="count_link" value="${data_product.count_link }"/>
		</div>
		<div>
			<button class="btn btn-default">UPDATE</button>
		</div>
	</form:form>
</body>
</html>