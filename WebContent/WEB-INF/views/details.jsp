<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT DETAILS</title>
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
<b>Acc: ${accout_email }</b>
<input type="hidden" id="accout_email" value="${accout_email }">
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
	<form class="form-horizontal loginFrm" action="test.htm?url_present=details&id_item=${id_item_present }" method="post">
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
	
	function update_link(id){
		if(document.getElementById("accout_email").value === ""){
			alert("Login?Please!!!");
			return false;
		}
		else{
			var url_present = "checkout.htm?accout_email=" + document.getElementById("accout_email").value;
// 			alert(url_present);
			var url = url_present + "&to_cart=" + id;
// 			alert(url);
			var element = document.getElementsByTagName("a");
			for(var e = 0; e< element.length; e++){
				element[e].href = url;
			}
		}
	}
</script>
<div class="navbar">
<div class="navbar-inner">
	<a class="brand" href="index.htm?accout_email=${accout_email }"><img src="themes/images/NMT.png" alt="Bootsshop"></a>
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
<h3 class="title"><span>ITEM DETAILS</span></h3>
<div class="row">
<div class="span6">
<div id="detailViewCarousel" class="carousel slide">
  <div class="displayStyle">
  	<ol class="carousel-indicators">
		<c:forEach items="${series_link}" varStatus="status">
			<c:if test="${status.index==0 }">
		  		<li data-target="#detailViewCarousel" data-slide-to="${status.index }" class="active"></li>
		  	</c:if>
		  	<c:if test="${status.index!=0}">
		  		<li data-target="#detailViewCarousel" data-slide-to="${status.index }"></li>
		  	</c:if>
		</c:forEach>
	</ol>
  <!-- Carousel items -->
  <div class="carousel-inner">
  	<c:forEach items="${series_link}" varStatus="status" var="i">
		<c:if test="${status.index==0 }">
	  		<div class="active item"><img src="${i }" alt="#" /></div>
	  	</c:if>
	  	<c:if test="${status.index!=0}">
	  		<div class="item"><img src="${i }" alt="#" /></div>
	  	</c:if>
	</c:forEach>
  </div>
  <!-- Carousel nav -->
  	<a class="left carousel-control" href="#detailViewCarousel" data-slide="prev"><i class="fas fa-angle-left"></i></a>
	<a class="right carousel-control" href="#detailViewCarousel" data-slide="next"><i class="fas fa-angle-right"></i></a>
  </div>
</div>
</div>

<div class="span6">
	<div class="promoDetail">
	<c:forEach items="${list_product}" var="i" varStatus="status">
	  <h1>${list_bonus[status.index].fullname1 }
		<span>${list_bonus[status.index].fullname2 }</span></h1>
		<p>DESCRIPTION</p>
		<ul>
			<li>${list_bonus[status.index].description1 }</li>
			<li>${list_bonus[status.index].description2 }</li>
			<li>${list_bonus[status.index].description3 }</li>
			<li>${list_bonus[status.index].description4 }</li>
			<li>${list_bonus[status.index].description5 }</li>
		</ul>
			   
		<p>Reviews:
			${start[status.index] }
		</p>
	  <a class="btn btn-warning" onclick="update_link(${i.id})"> ADD TO CART NOW </a>
	  </c:forEach>
	</div>
	<br>
</div>
<div class="span12">
<hr class="soften"/>
<h3 class="title"><span>Products Details</span></h3>
	<c:forEach items="${text }" var="i" varStatus="status">
		<p>${i }</p>
		<c:if test="${link_img[status.index].length() > 0}">
			<img alt="#" src="${link_img[status.index] }" width="400px">
		</c:if>
	</c:forEach>
</div>
</div>

<h3 class="title"><span>Related products</span></h3>
<div id="showCase" class="row">
<c:forEach items="${list_related }" varStatus="status_related" step="3">
	<div class="span2">
	<div class="carousel slide">
		<div class="carousel-inner">
		<c:forEach begin="${status_related.index }" end="${status_related.index + 2 }"
		items="${list_related }" var="rp" varStatus="i">
			<c:if test="${i.index==status_related.index }">
				<div class="item active">
				<a  href="details.htm?id=${rp.id }&accout_email=${accout_email }" ><img src="${rp.linkimg }"/>
				${rp.itemname }</a>
				</div>
			</c:if>
			<c:if test="${i.index!=status_related.index }">
				<div class="item">
				<a  href="details.htm?id=${rp.id }&accout_email=${accout_email }" ><img src="${rp.linkimg }"/>
				${rp.itemname }</a>
				</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
	</div>
</c:forEach>
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