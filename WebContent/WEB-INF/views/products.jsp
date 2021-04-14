<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT PRODUCTS</title>
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
<script type="text/javascript">
	function add_to_cart(id){
		var accout_email = document.getElementById("accout_email").value;
		if(accout_email === ""){
			alert("Login!!!Please!");
			return false;
		}
// 		alert(id);
		var s = document.getElementById("to_cart").value + "   " + id;
		document.getElementById("to_cart").value = s;
		alert("Add cart");
// 		alert(s);
	}
	function update_link1(url_present){
		
		var to_cart = document.getElementById("to_cart").value;
		var url = url_present + "?to_cart=" + to_cart;
// 		alert(url);
		
		var e1 = document.getElementsByTagName("a");
		
		for(var e = 0; e<e1.length;e++){
			e1[e].href = url;
		}
	}
	
	function update_link2(url_present){
		
		var to_cart = document.getElementById("to_cart").value;
		var url = url_present + "&to_cart=" + to_cart;
// 		alert(url);
		
		var e1 = document.getElementsByTagName("a");
		
		for(var e = 0; e<e1.length;e++){
			e1[e].href = url;
		}
	}
</script>
<b>Acc: ${accout_email }</b>
<input type="hidden" id="to_cart" value="">
<input type="hidden" id="accout_email" value="${accout_email }">
<header class="header">
<h1 class="seo">Welcome to NMT Bicycle! :<em class="blink"> 10% </em> discount is available for more than <span class="blink"> 40 </span> items.</h1>
<div class="container">
<div class="row">
	<div class="offset6 span6 right-align loginArea">
		<a href="#login" role="button" data-toggle="modal"><span class="btn btn-mini"> Login  </span></a> 
		<a href="register.htm" onclick="update_link1(this)"><span class="btn btn-mini btn-success"> Register  </span></a> 
		<a href="checkout.htm?accout_email=${accout_email }" onclick="update_link2(this)"><span class="btn btn-mini btn-danger" id="btncart"> Cart  </span></a> 
	</div>
</div>
<!-- Login Block -->
<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	<h3>NMT BICYCLE : Login Block</h3>
  </div>
  <div class="modal-body">
	<form class="form-horizontal loginFrm" action="test.htm?url_present=products&type_find=${type_find }" method="post">
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
<div class="row">
<div id="sideBar" class="span3">

		<h3 class="title"><span>QUICK MENU  </span></h3>
		<div>
		<a class="btn btn-block" href="products.htm?type_find=MB&accout_email=${accout_email }" onclick="update_link2(this)">Mountain Bike (${count_MB })</a>
		<a class="btn btn-block" href="products.htm?type_find=SB&accout_email=${accout_email }" onclick="update_link2(this)">Sport Bike (${count_SB })</a>											
		<a class="btn btn-block" href="products.htm?type_find=FG&accout_email=${accout_email }" onclick="update_link2(this)">Fixed Gear Bike (${count_FG })</a>	
		<a class="btn btn-block" href="products.htm?type_find=CB&accout_email=${accout_email }" onclick="update_link2(this)">Childrent's Bike  (${count_CB })</a>											
		</div>
		<h3 class="title"><span>SPECIAL </span></h3>
		<div class="indexItems">
		<div class=" displayStyle">
		<div class="itemBlock">
			<span class="indexItemsImageMask"></span>
			<span class="itemBlockAction">
				<a class="aniBtn" href="products.htm?type_find=${item_special.type }&accout_email=${accout_email }" onclick="update_link2(this)"><i class="icon-search"></i></a>
				<a class="aniBtn" data-my-tooltip="tooltip" href="details.htm?id=${item_special.id }&accout_email=${accout_email }" data-original-title="Details"><i class="icon-link" onclick="update_link2(this)"></i></a>
			</span>
			<a class="indexProductsImage">
				<img src="${item_special.linkimg }">
			</a>
		</div>
		</div>
		</div>
		
		<!-- top 5 new discount least -->
		<h3 class="title"><span>New  </span></h3>
		<div id="newCarousel" class="carousel slide">
		<div class="carousel-inner">
			<c:forEach items="${list_new_product }" var="i" varStatus="status">
				<c:if test="${status.index==0 }">
					<div class="item active">
					<div class="well">
						<a class="displayStyle" href="details.htm?id=${i.id }&accout_email=${accout_email }" onclick="update_link2(this)"><img src="${i.linkimg }" alt="#"/></a>
						<h5>${i.brands } ${i.itemname }</h5>
						<p>
							<a class="btn btn-warning" onclick="add_to_cart(${i.id })"> Add to <i class="icon-shopping-cart"></i></a> 
							<a class="btn" href="details.htm?id=${i.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
						</p>
						<p><span class="price"><small>$</small>${Math.round(i.price*100.0)/100.0 }</span></p>
					</div>
				</div>
				</c:if>
				<c:if test="${status.index!=0 }">
					<div class="item">
					<div class="well">
						<a class="displayStyle" href="details.htm?id=${i.id }&accout_email=${accout_email }"><img src="${i.linkimg }" alt="#"/></a>
						<h5>${i.brands } ${i.itemname }</h5>
						<p>
							<a class="btn btn-warning" onclick="add_to_cart(${i.id })"> Add to <i class="icon-shopping-cart"></i></a> 
							<a class="btn" href="details.htm?id=${i.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
						</p>
						<p><span class="price"><small>$</small>${Math.round(i.price*100.0)/100.0 }</span></p>
					</div>
				</div>
				</c:if>
			</c:forEach>
			</div>
			<a class="left carousel-control" href="#newCarousel" data-slide="prev">‹</a>
			<a class="right carousel-control" href="#newCarousel" data-slide="next">›</a>
		</div>
		
		<!-- TOP 10 DISCOUNT most-->
		
		<h3 class="title"><span>FEATURED</span></h3>
		<ul class="media-list">
		<c:forEach items="${list_featured }" var="j">
			<li class="media">
				<a class="pull-left" href="details.htm?id=${j.id }&accout_email=${accout_email }" onclick="update_link2(this)"><img src="${j.linkimg }"></a>
				<div class="media-body">
					<h4 class="media-heading"><a href="details.htm?id=${j.id }&accout_email=${accout_email }" onclick="update_link2(this)">${j.brands } ${j.itemname }</a></h4>
					<span class="normalprice">$${Math.round(j.price*100.0)/100.0 } </span>&nbsp;<span class="specialPrice">$${Math.round((j.price-j.price*j.discount/100)*100.0)/100.0 }</span>
					<span class="discount"><br>Save:&nbsp;${j.discount }% off</span>
				</div>
			</li>
		</c:forEach>
		</ul>
		
</div>

<div class="span9">
<div class="products">
<!-- TOP 3 ID_ITEM IN CART -->
<h3 class="title"><span>POPULAR</span></h3>
<div class="row">
<c:forEach items="${list_popular }" var="p">
<div class="span3">
<div class="indexItems">
	<div class="indexItems">
		<div class=" displayStyle">
		<div class="itemBlock">
			<span class="indexItemsImageMask"></span>
			<span class="itemBlockAction">
				<a class="aniBtn" href="details.htm?id=${p.id }&accout_email=${accout_email }" onclick="update_link2(this)"><i class="icon-search"></i></a>
				<a class="aniBtn" data-my-tooltip="tooltip" href="details.htm?id=${p.id }&accout_email=${accout_email }" data-original-title="Details"><i class="icon-link"></i></a>
			</span>
			<a href="#" class="indexProductsImage">
				<img src="${p.linkimg }">
			</a>
		</div>
		</div>
	</div>
</div>
</div>
</c:forEach>
</div>

<c:if test="${list_element.size() == 1 }">
	<h3 class="title"><span>${list_element[0] }</span></h3>
	<ul class="thumbnails">
	<c:forEach items="${list_e1 }" var="e">
		<li class="span3">
		<div class="thumbnail">
			<img src="${e.linkimg }" alt="#">
			<div class="caption">
			<h3>${e.brands } ${e.itemname }</h3>
			<p class="detailNprice">
				<small class="newPrice">&nbsp;</small>$<span>${Math.round(e.price*100.0)/100.0 }</span>
			</p>
			<p>
				<a class="btn btn-warning" onclick="add_to_cart(${e.id })"> Add to <i class="icon-shopping-cart"></i></a> 
				<a class="btn" href="details.htm?id=${e.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
			</p>
		  </div>
		</div>
	  </li>
	</c:forEach>
	</ul>
</c:if>
<c:if test="${list_element.size() == 4 }">
	<h3 class="title"><span>${list_element[0] }</span></h3>
	<ul class="thumbnails">
	<c:forEach items="${list_e1 }" var="e0">
		<li class="span3">
		<div class="thumbnail">
			<img src="${e0.linkimg }" alt="#">
			<div class="caption">
			<h3>${e0.brands } ${e0.itemname }</h3>
			<p class="detailNprice">
				<small class="newPrice">&nbsp;</small>$<span>${Math.round(e0.price*100.0)/100.0 }</span>
			</p>
			<p>
				<a class="btn btn-warning" onclick="add_to_cart(${e0.id })"> Add to <i class="icon-shopping-cart"></i></a> 
				<a class="btn" href="details.htm?id=${e0.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
			</p>
		  </div>
		</div>
	  </li>
	</c:forEach>
	</ul>
	<div class="cntr"><a class="btn" href="products.htm?type_find=MB&accout_email=${accout_email }" onclick="update_link2(this)">view more <i class="icon-repeat"></i></a><br><hr class="soften"></div>
	<h3 class="title"><span>${list_element[1] }</span></h3>
	<ul class="thumbnails">
	<c:forEach items="${list_e2 }" var="e1">
		<li class="span3">
		<div class="thumbnail">
			<img src="${e1.linkimg }" alt="#">
			<div class="caption">
			<h3>${e1.brands } ${e1.itemname }</h3>
			<p class="detailNprice">
				<small class="newPrice">&nbsp;</small>$<span>${Math.round(e1.price*100.0)/100.0 }</span>
			</p>
			<p>
				<a class="btn btn-warning" onclick="add_to_cart(${e1.id })"> Add to <i class="icon-shopping-cart"></i></a> 
				<a class="btn" href="details.htm?id=${e1.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
			</p>
		  </div>
		</div>
	  </li>
	</c:forEach>
	</ul>
	<div class="cntr"><a class="btn" href="products.htm?type_find=SB&accout_email=${accout_email }" onclick="update_link2(this)">view more <i class="icon-repeat"></i></a><br><hr class="soften"></div>
	<h3 class="title"><span>${list_element[2] }</span></h3>
	<ul class="thumbnails">
	<c:forEach items="${list_e3 }" var="e2">
		<li class="span3">
		<div class="thumbnail">
			<img src="${e2.linkimg }" alt="#">
			<div class="caption">
			<h3>${e2.brands } ${e2.itemname }</h3>
			<p class="detailNprice">
				<small class="newPrice">&nbsp;</small>$<span>${Math.round(e2.price*100.0)/100.0 }</span>
			</p>
			<p>
				<a class="btn btn-warning" onclick="add_to_cart(${e2.id })"> Add to <i class="icon-shopping-cart"></i></a> 
				<a class="btn" href="details.htm?id=${e2.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
			</p>
		  </div>
		</div>
	  </li>
	</c:forEach>
	</ul>
	<div class="cntr"><a class="btn" href="products.htm?type_find=FG&accout_email=${accout_email }" onclick="update_link2(this)">view more <i class="icon-repeat"></i></a><br><hr class="soften"></div>
	<h3 class="title"><span>${list_element[3] }</span></h3>
	<ul class="thumbnails">
	<c:forEach items="${list_e4 }" var="e3">
		<li class="span3">
		<div class="thumbnail">
			<img src="${e3.linkimg }" alt="#">
			<div class="caption">
			<h3>${e3.brands } ${e3.itemname }</h3>
			<p class="detailNprice">
				<small class="newPrice">&nbsp;</small>$<span>${Math.round(e3.price*100.0)/100.0 }</span>
			</p>
			<p>
				<a class="btn btn-warning" onclick="add_to_cart(${e3.id })"> Add to <i class="icon-shopping-cart"></i></a> 
				<a class="btn" href="details.htm?id=${e3.id }&accout_email=${accout_email }" onclick="update_link2(this)">view details</a>
			</p>
		  </div>
		</div>
	  </li>
	</c:forEach>
	</ul>
	<div class="cntr"><a class="btn" href="products.htm?type_find=CB&accout_email=${accout_email }" onclick="update_link2(this)">view more <i class="icon-repeat"></i></a><br><hr class="soften"></div>
</c:if>
  
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
	<a href="register.htm" onclick="update_link1(this)"> REGISTRATION</a> | 
	<a href="about_us.htm?accout_email=${accout_email }" onclick="update_link2(this)"> ABOUT US</a> | 
	<a href="contact_us.htm?accout_email=${accout_email }" onclick="update_link2(this)">CONTACT </a>
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