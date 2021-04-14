<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT LOGIN IMPOSITION</title>
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
<header class="header">
<h1 class="seo">Welcome to NMT Bicycle! :<em class="blink"> 10% </em> discount is available for more than <span class="blink"> 40 </span> items.</h1>
<div class="container">
<div class="row">
	<div class="offset6 span6 right-align loginArea">
		<a href="register.htm"><span class="btn btn-mini btn-success"> Register  </span></a> 
		<a href="checkout.htm?accout_email=${accout_email }"><span class="btn btn-mini btn-danger"> Cart  </span></a> 
	</div>
</div>
<div class="navbar">
<div class="navbar-inner">
	<a class="brand" href="index.htm?accout_email=${accout_email }"><img src="themes/images/NMT.png" alt="Bootsshop"></a>
	<div class="nav-collapse">
		<ul id="topMenu" class="nav pull-right">
		 <li class="">
		 <form name="myForm" class="form-inline navbar-search" method="post" onsubmit="set_link1(${accout_email })" style="padding-top:5px;">
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
<!-- Login Imposition Block -->
<div>
  <div class="modal-header">
	<h3>NMT BICYCLE : Login Imposition</h3>
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
	</form>
  </div>
</div>

<!-- /////////////////////////////////////////////// -->
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