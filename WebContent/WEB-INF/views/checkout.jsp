<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT CHECKOUT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- styles -->
	
	<link rel="stylesheet/less" type="text/css" href="themes/less/bootstrap.less">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/all.css" />
	
	<script src="themes/js/less/less.js" type="text/javascript"></script>

	<!-- favicon-icons -->
    <link rel="shortcut icon" href="themes/images/NMT.ico">

  </head>
<body>

<c:if test="${accout_email == null || accout_email.length() == 0}">
	<script type="text/javascript">
		location.href = "login_imposition.htm";
	</script>
</c:if>
<b>Acc: ${accout_email }</b>
<input type="hidden" id="address_old" value="${address_old }">
<input type="hidden" id="accout_email" value="${accout_email }">
<input type="hidden" id="phone_old" value="${phone_old }">
<header class="header">
<h1 class="seo">Welcome to NMT Bicycle! :<em class="blink"> 10% </em> discount is available for more than <span class="blink"> 40 </span> items.</h1>
<div class="container">
<div class="row">
	<div class="offset6 span6 right-align loginArea">
		<a href="#login" role="button" data-toggle="modal"><span class="btn btn-mini"> Login  </span></a> 
		<a href="register.htm"><span class="btn btn-mini btn-success"> Register  </span></a> 
		<a href="checkout.htm?accout_email=${accout_email }"><span class="btn btn-mini btn-danger"> Cart  </span></a> 
	</div>
</div>
<!-- Login Block -->
<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	<h3>NMT BICYCLE : Login Block</h3>
  </div>
  <div class="modal-body">
	<form class="form-horizontal loginFrm" action="test.htm?url_present=checkout" method="post">
	  <div class="control-group">								
		<input type="text" id="email" placeholder="email" name="email"
			 pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
              title="Invalid email!" required="required"
              value="${accout_login.email }"/>
	  </div>
	  <div class="control-group">
		<input type="password" id="password" placeholder="password" name="password" 
			pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}"
              title="Invalid password!" required="required"
              value="${accout_login.password }"/>
        <br><a href="forgot_password.htm"><strong>Forgot password</strong> </a><br>
	  </div>
	 	<button type="submit" class="btn btn-success">Sign in</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</form>
  </div>
</div>

<!-- /////////////////////////////////////////////// -->
<input type="hidden" id="accout_email" value="${accout_email }">
<script type="text/javascript">
	function set_link1(){
// 		alert("link1");
		var accout_email = document.getElementById("accout_email").value;
		
		var selected = document.getElementById("cb_search").value;
		var search = document.getElementById("txb_search").value;
		var url = "";
		var element = document.forms["myForm"];
		var search = document.getElementById("txb_search").value;
		
		if(accout_email === undefined){
			accout_email = "";
		}
		
		if(selected === "All"){
			url = "";
		}
		if(selected === "Mountain bike"){
			url = "MB";
		}
		if(selected === "Sport bike"){
			url = "SB";
		}
		if(selected === "Fixed gear bike"){
			url = "FG";
		}
		if(selected === "Children's bike"){
			url = "CB";
		}
		var att = document.createAttribute("action");
		
		att.value = "products.htm?type_find=" + url + "&accout_email=" + accout_email + "&search=" + search;
// 		alert(att.value);
		element.setAttributeNode(att);
	}
</script>
<div class="navbar">
<div class="navbar-inner">
	<a class="brand" href="index.htm?accout_email=${accout_email }"><img src="themes/images/NMT.png" alt="Bootsshop"></a>
	<div class="nav-collapse">
		<ul id="topMenu" class="nav pull-right">
		 <li class="">
		 <form name="myForm" class="form-inline navbar-search" method="post" onsubmit="set_link1()" style="padding-top:5px;">
			<select class="span3" style="padding:11px 4px; height:auto" name="cb_search" id="cb_search">
				<option>All</option>
				<option>Mountain bike </option>
				<option>Sport bike </option>
				<option>Fixed gear bike </option>
				<option>Children's bike </option>
			</select> 
			<input class="span4" type="text" placeholder="GIANT ATX" style="padding:11px 4px;" name="txb_search" id="txb_search">
			<button type="submit" class="btn btn-warning btn-large" style="margin-top:0"> GO </button>
		</form>
		</li>
		</ul>
	</div>
	<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
  </div>
</div>
</div>
</header>
<!-- ======================================================================================================================== -->
<section id="mainBody">
<div class="container">
<h3 class="title"><span>Shopping Cart</span></h3>
<ul class="breadcrumb">
  <li><a href="index.htm?accout_email=${accout_email }">Home</a> <span class="divider">/</span></li>
  <li class="active">Checkout</li>
</ul>
<script type="text/javascript">
	function onChageText(changeVal, row_index, price){
		var total_i_old = 0.00;
		total_i_old = document.getElementById("total" + row_index).value;
// 		alert(total_i_old);
		
		document.getElementById("total" + row_index).value = changeVal.value * price;
// 		alert(document.getElementById("total" + row_index).value);
		
		var total_i_new = 0.00;
		total_i_new = document.getElementById("total" + row_index).value;
// 		alert(total_i_new);
		
		var total_all = 0.00;
		total_all = document.getElementById("total_all").value;
		total_all = total_all - total_i_old - total_i_new*(-1);
		
// 		alert(total_all);
		
		document.getElementById("total_all").value = total_all;
	}	
	
	var text_quantity = "";
	
	function set_link(text_id_cart_send){
		
		var address = set_address(address_old);
		
		var homephone = document.getElementById("phone").value;
		var mobilephone = document.getElementById("mobile").value;
		
		var phone = "";
		
		if(homephone.length === 0){
			phone = document.getElementById("phone_old").value;
		}
		else{
			phone = "Home phone: " + homephone + ", Mobile phone: " + mobilephone;
		}
		
		if(confirm("-Address: " + address + "\n-" + phone)){
			var accout_email = document.getElementById("accout_email").value;
//	 		alert(accout_email);
			var element = document.getElementById("btnOrder");
			var att = document.createAttribute("href");
			if(text_id_cart_send != ""){
				att.value = "http://localhost:8080/Web/checkout.htm?accout_email=" + accout_email + "&text_id_cart_send=" + document.getElementById("text_id_cart_send").value + "&text_quantity=" + text_quantity;
			}else{
				att.value = "http://localhost:8080/Web/checkout.htm?accout_email=" + accout_email;
			}
//	 		alert(att.value);
			element.setAttributeNode(att);
		}
		else{
			return false;
		}
	}
	
	function set_address(address_old){
		var nohouse = document.getElementById("inputHouse_number").value;
		var street = document.getElementById("inputStreet").value;
		var ward = document.getElementById("inputWard").value;
		var district = document.getElementById("inputDistrict").value;
		var e_city = document.getElementById("inputCity");
		var city = e_city.options[e_city.selectedIndex].text;
		var e_country = document.getElementById("inputCountry");
		var country = e_country.options[e_country.selectedIndex].text;
		
		var address = "";
		
		if(nohouse.length === 0 || street.length === 0 || ward.length === 0 || district.length === 0 || city.length === 0 || country.length === 0){
			address = document.getElementById("address_old").value;
		}
		else{
			address = nohouse + ", " + street + ", ward " + ward + ", district " + district + ", " + city + ", " + country;
		}
		
		return address;
	}
	
	function show(size,address_old){
		
		for(var i = 0; i < size; i++){
			if(document.getElementById("checkbox" + i).checked){
				var s = document.getElementById("id_cart" + i).value;
// 				alert(s);
				
				document.getElementById("text_id_cart_send").value = document.getElementById("text_id_cart_send").value + "   " +s;
// 				alert(document.getElementById("text_id_cart_send").value);
				var s1 = document.getElementById("quantity"+i).value;
				text_quantity = text_quantity + "   " + s1;
// 				alert(text_quantity);
			}
		}
		
		if(document.getElementById("text_id_cart_send").value === ""){
			alert("Choose items???")
			return false;
		}
		else if(document.getElementById("bank").checked){
			var id_acc_bank = document.getElementById("id_acc_bank").value;
			if(id_acc_bank != ""){
				set_link(text_id_cart_send);
			}
			else{
				alert("Your ID???");
				return false;
			}
		}else{
			set_link(text_id_cart_send);
		}
	}
	function remove_item_cart(id_cart){
		var url_present = "checkout.htm?accout_email=" + document.getElementById("accout_email").value;
		if(confirm("Confirm remove?")){
// 			alert(url_present);
			var url = url_present + "&remove_cart=" + id_cart;
//				alert(url);
			var element = document.getElementsByTagName("a");
			for(var e = 0; e< element.length; e++){
				element[e].href = url;
			}
		}
	}
</script>
<div class="row">
		<div class="span12">
		<h3 class="title"><span>Shipping</span></h3>
		<div class="well">
			<table class="table table-bordered table-striped">
			  <thead>
				  <tr>
					<th>Image</th>
					<th>Brands</th>
					<th>Item Name</th>
					<th>Quantity</th>
					<th>Unit Price</th>
					<th>Total</th>
				  </tr>
				</thead>
				<tbody>
				
				<c:forEach items="${list_shipping }" var="sp" varStatus="status_sp">
					<tr>
						<td class="cntr"><a href="details.htm?accout_email=${accout_email }&id=${sp.id_item }"><img src="${sp.linkimg }" alt="#"></a></td>
						<td>${sp.brands }</td>
						<td>${sp.itemname } </td>
						<td>${sp.quantity }</td>
						<td>${Math.round(sp.price*100.0)/100.0 }</td>
						<td id="total_price_shipping">${Math.round(sp.price*sp.quantity*100.0)/100.0 }</td>
					</tr>		
				</c:forEach>
				  <tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><strong><input type="text" id="total_all" value="${shipping_total_all }" readonly="readonly"> </strong></td>
					<td><input type="hidden" value="" id="text_id_cart_send" name="text_id_cart_send"> </td>
				  </tr>		  
				</tbody>
			  </table>
		</div>
		</div>
		
		<div class="span12">
		<h3 class="title"><span>Cart item details</span></h3>
		<div class="well">
		<table class="table table-bordered table-striped">
			  <thead>
				  <tr>
					<th>Select</th>
					<th>Remove</th>
					<th>Image</th>
					<th>Brands</th>
					<th>Item Name</th>
					<th>Quantity</th>
					<th>Unit Price</th>
					<th>Total</th>
				  </tr>
				</thead>
				<tbody>
				
				<c:forEach items="${list_checkout }" var="i" varStatus="status">
					<tr>
						<td class=""><input type="checkbox" value="" id="checkbox${status.index }"></td>
						<td><a id="remove_item" class="btn btn-mini btn-danger" onclick="remove_item_cart(${i.id_cart})">remove</a></td>
						<td class="cntr"><a href="details.htm?accout_email=${accout_email }&id=${i.id_item }"><img src="${i.linkimg }" alt="#"></a></td>
						<td>${i.brands }</td>
						<td>${i.itemname } </td>
						<td><input type="text" value="1" id="quantity${status.index }" class="input-mini" name="quantity${status.index }" onchange="onChageText(this,${status.index },${i.price })"></td>
						<td>${i.price }</td>
						<td><input type="text" value="${i.price }" id="total${status.index }" readonly="readonly"></td>
						<td><input type="hidden" value="${i.id_cart }" id="id_cart${status.index }"> </td>
					</tr>		
				</c:forEach>
				  <tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><strong><input type="text" id="total_all" value="${total_all }" readonly="readonly"> </strong></td>
					<td><input type="hidden" value="" id="text_id_cart_send" name="text_id_cart_send"> </td>
				  </tr>		  
				</tbody>
			  </table>
		</div>
		</div>
		<div class="span12">
		<h3 class="title"><span>Your address</span></h3>
		<div class="control-group">
			<label class="control-label" for="inputHouse_number">House numbers <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputHouse_number" placeholder="97" required="required" name="nohouse">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputStreet">Street <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputStreet" placeholder="Man Thien" required="required" name="street">
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="inputWard">Ward <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputWard" placeholder="Hiep Phu" required="required" name="ward">
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="inputDistrict">District <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputDistrict" placeholder="9" required="required" name="district">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputCity">City/Province<sup>*</sup></label>
			<div class="controls">
			  <select id="inputCity" name="city" >
				<c:forEach items="${provinceCity }" varStatus="status" var="i">
					<option value="${status.index }">${i }</option>
				</c:forEach>	
			  </select>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="country">Country<sup>*</sup></label>
			<div class="controls">
			<select id="inputCountry" name="country">
				<c:forEach items="${country }" varStatus="status1" var="j">
					<option value="${status1.index }">${j }</option>
				</c:forEach>
			</select>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label" for="phone">Home phone <sup>*</sup></label>
			<div class="controls">
			  <input type="text" name="homephone" id="phone" placeholder="phone" required="required"
			  pattern="^(0|\+84)([0-9]{9,9})$"
			  title="Phone number wrong!">
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="mobile">Mobile Phone </label>
			<div class="controls">
			  <input type="text" name="mobilephone" id="mobile" placeholder="Mobile Phone"> 
			</div>
		</div>
		</div>
		<div class="span12">
		<h3 class="title"><span>Payment type selection</span></h3>
		<div class="well">		
		<label><input type="radio"  name="pm" checked="checked" id="bank"> <strong>Direct Bank Transfer </strong></label>
		<p><em>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order wont be shipped until the funds have cleared in our account.</em></p>
		<label><input type="radio"  name="pm" id="nobank"> <strong>Direct Payment </strong></label>
		<p><em>Receive your items. You can check them and pay money.</em></p>
		<label><strong>Your ID</strong> </label>
		<input type="text" id="id_acc_bank" name="id_acc_bank" value="">
		<br>
		<input type="hidden" id="accout_email" name="accout_email" value="${accout_email }">
		<a class="btn btn-success btn-large pull-right" onclick="show(${list_checkout.size() })" id="btnOrder">Place on order</a>
		<a href="http://localhost:8080/Web/index.htm?accout_email=${accout_email }" class="btn btn-large btn-warning">Continue shopping</a>
		</div>
		</div>
</div>
</div>
</section>

<!-- Term and codition Block -->
<div id="term" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="term" aria-hidden="false" >
  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	<h3>NMT BICYCLE : Term and codition</h3>
  </div>
  <div class="modal-body">
	<form class="form-horizontal loginFrm" method="post">
	  <p><b>Term and condition</b></p>
	  <br>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</form>
  </div>
</div>

<!-- Footer
================================================== -->
<footer class="footer">
<div class="container">
<h5>Accepted Payment Methods </h5>
<p><img src="themes/images/logo_payment.jpg" alt="payment methods"/></p>
<hr class="soften"/>
<div class="footerMenu">
	<a href="register.htm"> REGISTRATION</a> | 
	<a href="about_us.htm?accout_email=${accout_email }"> ABOUT US</a> | 
	<a href="contact_us.htm?accout_email=${accout_email }">CONTACT </a>
<p class="pull-right"><a href="#term" data-toggle="modal">Terms and condition</a> &copy; Copyright 2020 NMT BICYCLE. </p>
</div>
</div>
</footer>
<span id="toTop" style="display: none;"><span><i class="fas fa-angle-up"></i></span></span>

    <!--  javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="themes/js/jquery-1.8.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="themes/js/smart.js"></script>
  </body>
</html>