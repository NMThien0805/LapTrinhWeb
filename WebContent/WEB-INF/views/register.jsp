<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT REGISTER</title>
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
<header class="header">
<h1 class="seo">Welcome to NMT Bicycle! :<em class="blink"> 10% </em> discount is available for more than <span class="blink"> 40 </span> items.</h1>
<div class="container">
<div class="row">
	<div class="offset6 span6 right-align loginArea">
		<a href="#login" role="button" data-toggle="modal"><span class="btn btn-mini"> Login  </span></a> 
		<a href="register.htm"><span class="btn btn-mini btn-success"> Register  </span></a> 
		<a href="checkout.htm"><span class="btn btn-mini btn-danger"> Cart  </span></a> 
	</div>
</div>
<!-- Login Block -->
<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	<h3>NMT BICYCLE : Login Block</h3>
  </div>
  <div class="modal-body">
	<form class="form-horizontal loginFrm" action="test.htm?url_present=register" method="post">
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
<script type="text/javascript">
	function set_link(accout_email){
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
	<a class="brand" href="index.htm"><img src="themes/images/NMT.png" alt="Bootsshop"></a>
	<div class="nav-collapse">
		<ul id="topMenu" class="nav pull-right">
		 <li class="">
		 <form name="myForm" class="form-inline navbar-search" method="post" onsubmit="set_link(${accout_email })" style="padding-top:5px;">
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
<h3 class="title"><span>Registration</span></h3>
    <ul class="breadcrumb">
		<li><a href="index.htm">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<div class="well">
	<p class="pull-right badge badge-important">[ * ] Required field	</p>
	<c:if test="${message.length() != 0 }">
		<div class="alert alert-error">${message } <a class="close" data-dismiss="alert" href="#">&times;</a></div>\
		
	</c:if>
	<script type="text/javascript">
		function validatedFrom(list_register){
			if(document.getElementById("inputPassword").value != document.getElementById("inputCpassword").value){
				alert("Cofirm password wrong");
				return false;
			}
			return true;
		}
	</script>
	
	<form class="form-horizontal" onsubmit="return validatedFrom(${list_register})" action="register.htm" modelAttribute="register" method="post">
		<h3>Your personal information</h3>
		<div class="control-group">
			<label class="control-label" for="inputFname">First name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputFname" placeholder="First Name" required="required" name="fname">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLnam" placeholder="Last Name" required="required" name="lname">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="input_email">Email <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="input_email" placeholder="Email" required="required"
		  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Invalid email!" name="email">
		</div>
	  </div>	  
	<div class="control-group">
		<label class="control-label" for="inputPassword">Password <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="inputPassword" placeholder="Password" required="required"
		  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}" title="Invalid password!" name="password">
		</div>
		<label class="control-label" for="inputCpassword">Confirm Password <sup>*</sup></label>
		<div class="controls">
		  <input type="password" id="inputCpassword" placeholder="Confirm password" required="required">
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label">Date of Birth </label>
		<input type="date" id="inputBday" name="birthday">
	  	</div>

		<h3>Your address</h3>
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
			  <select id="inputCity" name="city">
				<c:forEach items="${provinceCity }" varStatus="status" var="i">
					<option value="${status.index }">${i }</option>
				</c:forEach>	
			  </select>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label" for="country">Country<sup>*</sup></label>
			<div class="controls">
			<select id="country" name="country">
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
		<div class="controls">
			<button type="submit">Register</button>
			<button type="reset">Reset</button>
		</div>
	<br>
	<br>
	<br>
	</form>
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
	<form class="form-horizontal loginFrm" action="test.htm" method="post">
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
	<a href="about_us.htm"> ABOUT US</a> | 
	<a href="contact_us.htm">CONTACT </a>
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