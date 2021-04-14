<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>NMT INDEX</title>
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
<input type="hidden" id="to_cart" value="">
  <!-- Facebook script -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<header class="header">
<h1 class="seo">Welcome to NMT Bicycle! :<em class="blink"> 10% </em> discount is available for more than <span class="blink"> 40 </span> items.</h1>
<div class="container">
<div class="row">
	<div class="offset6 span6 right-align loginArea">
		<a href="#login" role="button" data-toggle="modal"><span class="btn btn-mini"> Login  </span></a> 
		<a href="register.htm" onclick="update_link1(this)"><span class="btn btn-mini btn-success"> Register  </span></a> 
		<a href="checkout.htm?accout_email=${accout_email }" onclick="update_link(this)"><span class="btn btn-mini btn-danger" > Cart  </span></a> 
	</div>
</div>
<!-- Login Block -->
<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
	<h3>NMT BICYCLE : Login Block</h3>
  </div>
  <div class="modal-body">
	<form class="form-horizontal loginFrm" action="test.htm?url_present=index" method="post">
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
	
	function update_link(url_present){
// 		alert(url_present);
		var to_cart = document.getElementById("to_cart").value;
		var url = url_present + "&to_cart=" + to_cart;
// 		alert(url);
		
		var e1 = document.getElementsByTagName("a");
		
		for(var e = 0; e<e1.length;e++){
			e1[e].href = url;
		}
	}
	function update_link1(url_present){
// 		alert(url_present);
		var to_cart = document.getElementById("to_cart").value;
		var url = url_present + "?to_cart=" + to_cart;
// 		alert(url);
		
		var e1 = document.getElementsByTagName("a");
		
		for(var e = 0; e<e1.length;e++){
			e1[e].href = url;
		}
	}
</script>
<div class="navbar">
<div class="navbar-inner">
	<a class="brand" href="index.htm?accout_email=${accout_email }" onclick="update_link(this)"><img src="themes/images/NMT.png" alt="Bootsshop"></a>
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
<div class="container">
<section id="mainCarousel">
	<div class="displayStyle">
	<div id="myCarousel" class="carousel slide">
		<span class="newTag tagRight"></span>
		  <ol class="carousel-indicators">
		  <c:forEach items="${list_product}" varStatus="status">
		  	<c:if test="${status.index==0 }">
		  		<li data-target="#myCarousel" data-slide-to="${status.index }" class="active"></li>
		  	</c:if>
		  	<c:if test="${status.index!=0}">
		  		<li data-target="#myCarousel" data-slide-to="${status.index }"></li>
		  	</c:if>
		  </c:forEach>
		  </ol>
			<div class="carousel-inner">		
			<c:forEach items="${list_product}" var="i" varStatus="status">
				<c:if test="${status.index==0 }">
				<div class="item active">
					<div class="row">
						<div class="span6">
							<img alt="#" src="${i.linkimg }" width="400px">
						</div>
						<div class="span6">
							<div class="promoDetail">
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
										<b>${start[status.index] }</b>
									</p>
									<br>
									<div class="cntr">
									<h3>Price: $${Math.round((i.price-i.price*i.discount/100)*100.0)/100.0 } <small class="oldPrice">$${Math.round(i.price*100.0)/100.0 }</small></h3>
									<a class="btn btn-success" href="details.htm?id=${i.id }&accout_email=${accout_email }" onclick="update_link(this)">${i.discount }% off BUY NOW</a>
									<br>
									<br>
									<div class="fb-like" data-href="http://www.bootstrappage.com/" data-send="false" data-layout="button_count" data-width="80" data-show-faces="true"></div>
									<br>
									</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${status.index!=0 }">
				<div class="item">
					<div class="row">
						<div class="span6">
							<img alt="#" src="${i.linkimg }" width="400px">
						</div>
						<div class="span6">
							<div class="promoDetail">
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
										<b>${start[status.index] }</b>
									</p>
									<br>
									<div class="cntr">
									<h3>Price: $${Math.round((i.price-i.price*i.discount/100)*100.0)/100.0 } <small class="oldPrice">$${Math.round(i.price*100.0)/100.0 }</small></h3>
									<a class="btn btn-success" href="details.htm?id=${i.id }&accout_email=${accout_email }" onclick="update_link(this)">${i.discount }% off BUY NOW</a>
									<br>
									<br>
									<div class="fb-like" data-href="http://www.bootstrappage.com/" data-send="false" data-layout="button_count" data-width="80" data-show-faces="true"></div>
									<br>
									</div>
							</div>
						</div>
					</div>
				</div>	
				</c:if>
			</c:forEach>
			</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="fas fa-angle-left"></i></a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="fas fa-angle-right"></i></a>
	</div>
	</div>
</section>
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
</script>
<section id="featuredProduct">
<h3 class="title"><span>New Products</span></h3>
<div id="myCarouselOne" class="carousel slide">
	<!-- Dot Indicators -->
	<div class="carousel-inner">
	<c:forEach items="${list_new_product }" varStatus="status_new" step="4">
		<c:if test="${status_new.index==0 }">
			<div class="item active">
			<div class="row">
				<c:forEach items="${list_new_product }" begin="${status_new.index }" end="${status_new.index + 3 }" varStatus="i" var="np">
					<div class="span3">
						<div class="well well-small">
							<span class="newTag"></span>
							<span class="priceTag">
							<c:if test="${np.discount>0 }">
								<small class="oldPrice"><small>$</small> ${Math.round(np.price*100.0)/100.0 } </small>
								<span class="newPrice"><small>$</small>${Math.round((np.price-np.price*np.discount/100)*100.0)/100.0 }</span>
							</c:if>
							<c:if test="${np.discount==0 }">
								<small class="newPrice"><small></small>_</small>
								<span class="newPrice"><small>$</small>${Math.round(np.price*100.0)/100.0 }</span>
							</c:if>
							</span>
							<a class="displayStyle" href="details.htm?id=${np.id }&accout_email=${accout_email }"><img src="${np.linkimg }" width="200"/></a>
							<h5>${np.brands } ${np.itemname }</h5>
							<p>
								<input type="hidden" id="accout_email" value="${accout_email }">
								<a class="btn btn-warning" onclick="add_to_cart(${np.id })" > Add to <i class="icon-shopping-cart"></i></a> 
								<a class="btn" href="details.htm?id=${np.id }&accout_email=${accout_email }" onclick="update_link(this)">view details</a>
							</p>
							<p><span class="price"><small>$</small>${Math.round((np.price-np.price*np.discount/100)*100.0)/100.0 } </span></p>					
						</div>
					</div>
				</c:forEach>
			</div>
			</div>
		</c:if>
		<c:if test="${status_new.index>3 }">
			<div class="item">
			<div class="row">
				<c:forEach items="${list_new_product }" begin="${status_new.index }" end="${status_new.index + 3 }" varStatus="i" var="np">
					<div class="span3">
						<div class="well well-small">
							<span class="newTag"></span>
							<span class="priceTag">
							<c:if test="${np.discount>0 }">
								<small class="oldPrice"><small>$</small> ${Math.round(np.price*100.0)/100.0 } </small>
								<span class="newPrice"><small>$</small>${Math.round((np.price-np.price*np.discount/100)*100.0)/100.0 }</span>
							</c:if>
							<c:if test="${np.discount==0 }">
								<small class="newPrice"><small>_</small></small>
								<span class="newPrice"><small>$</small>${Math.round(np.price*100.0)/100.0 }</span>
							</c:if>
							</span>
							<a class="displayStyle" href="details.htm?id=${np.id }&accout_email=${accout_email }"><img src="${np.linkimg }" width="200"/></a>
							<h5>${np.brands } ${np.itemname }</h5>
							<p>
								<input type="hidden" id="accout_email" value="${accout_email }">
								<a class="btn btn-warning" onclick="add_to_cart(${np.id })"> Add to <i class="icon-shopping-cart"></i></a> 
								<a class="btn" href="details.htm?id=${np.id }&accout_email=${accout_email }" onclick="update_link(this)">view details</a>
							</p>
							<p><span class="price"><small>$</small>${Math.round((np.price-np.price*np.discount/100)*100.0)/100.0 } </span></p>					
						</div>
					</div>
				</c:forEach>
			</div>
			</div>
		</c:if>
	</c:forEach>
	</div>
		<a class="left carousel-control" href="#myCarouselOne" data-slide="prev"><i class="fas fa-angle-left"></i></a>
		<a class="right carousel-control" href="#myCarouselOne" data-slide="next"><i class="fas fa-angle-right"></i></a>
</div>
		
<h3 class="title"><span>Best Items</span></h3>
<div id="showCase" class="row">
<c:forEach items="${list_best_product }" varStatus="status_best" step="5">
	<div class="span2">
	<div class="carousel slide">
		<div class="carousel-inner">
		<c:forEach begin="${status_best.index }" end="${status_best.index + 4 }"
		items="${list_best_product }" var="bp" varStatus="i">
			<c:if test="${i.index==status_best.index }">
				<div class="item active">
				<a  href="details.htm?id=${bp.id }&accout_email=${accout_email }" onclick="update_link(this)"><img src="${bp.linkimg }" alt="#"/>
				${bp.itemname }</a>
				</div>
			</c:if>
			<c:if test="${i.index!=status_best.index }">
				<div class="item">
				<a  href="details.htm?id=${bp.id }&accout_email=${accout_email }" ><img src="${bp.linkimg }" alt="#"/>
				${bp.itemname }</a>
				</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
	</div>
</c:forEach>
</div>
</section>

<section id="scn">
<h3 class="title"><span>WELCOME !</span></h3>
<div class="row">
	<div class="span4">
	<h1><i class="icon-heart"></i> </h1>
	<h4>Who i am?</h4>	
	<p>ID: N17DCCN171</p>
	<p>NAME: NGUYEN MINH THIEN</p>
	</div>
	<div class="span4">
	<div class="seperator">
		<h1><i class="icon-truck iconShipping"></i> </h1>		
		<h4>Shipping Information</h4>		
		<p class="shipping"><span class="shippingCall">Free Shipping On Orders Over $999</span></p>
	</div>
	</div>
	<div class="span4">
		<h1><i class="icon-comments-alt"></i> </h1>
		<h4>Find me in</h4>
		<p class="findUs">
			<a href="#"><i class="icon-facebook"></i> </a>
			<a href="#"><i class="icon-twitter"></i> </a>
			<a href="#"><i class="icon-google-plus"></i> </a>
		</p>
		<h4>Subscribe me</h4>	
		<div class="caption">
		<p> Subscribe me for my newsletters</p>
		<form class="" action="#">
		  <div class="control-group">
			<div class="controls">
			  <input type="text" id="userEmail" placeholder="">
			</div>
		  </div>
		  <div class="control-group">
			<div class="controls">
			  <button type="submit" class="btn btn-success ">subscribe</button>
			</div>
		  </div>
		</form>
	</div>
</div>
</div>
</section>
<hr class="soften"/>
<section id="client">
<h3 class="title"><span>BRANDS</span></h3>
<div id="clients" class="carousel slide">
		<div class="carousel-inner">
		<div class="item active">
		<div class="span12">
		<img src="themes/images/clients/fornix.jpg" alt="#" />
		<img src="themes/images/clients/canondale.jpg" alt="#" />
		<img src="themes/images/clients/giant.jpg" alt="#" />
		<img src="themes/images/clients/ideal.jpg" alt="#" />
		</div>
		</div>
		<div class="item">
		<div class="span12">
		<img src="themes/images/clients/nirve.jpg" alt="#" />
		<img src="themes/images/clients/schwinn.jpg" alt="#" />
		<img src="themes/images/clients/specialized.jpg" alt="#" />
		<img src="themes/images/clients/trek.jpg" alt="#" />
		</div>
		</div>
		<div class="item">
		<div class="span12">
		<img src="themes/images/clients/mongoose.jpg" alt="#" />
		<img src="themes/images/clients/muddyFox.jpg" alt="#" />
		<img src="themes/images/clients/merida.jpg" alt="#" />
		<img src="themes/images/clients/avanti.jpg" alt="#" />
		</div>
		</div>
</div>
	<a class="left carousel-control" href="#clients" data-slide="prev"><i class="fas fa-angle-left"></i></a>
	<a class="right carousel-control" href="#clients" data-slide="next"><i class="fas fa-angle-right"></i></a>
</div>
</section>
</div>

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
	<a href="about_us.htm?accout_email=${accout_email }" onclick="update_link(this)"> ABOUT US</a> | 
	<a href="contact_us.htm?accout_email=${accout_email }" onclick="update_link(this)">CONTACT </a>
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