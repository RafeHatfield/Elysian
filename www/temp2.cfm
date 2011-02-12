
<div style="width:848px; left:0px; height:400px; padding:1px; overflow: hidden; top: 100px">
	<div id="arrow_left">
		<a href="#"><img src="images/arrow_left.gif" border="0" style="padding-top: 60px" /></a>
	</div>
	<div id="arrow_right">
		<a href="#"><img src="images/arrow_right.gif" border="0" style="padding-top: 60px" /></a>
	</div>
	
	<div style="float: none; width:848px; margin-left:0px">
		<div style="float:right">
			<img alt="Zip BBD Dress" height="334" src="assets/images/collection/summer209/sum09-1.jpg" width="270" />
			
			<div id="largeImageCaption" style="COLOR:#6E6E70; font-size: 8px">
				KARACHIE DRESS<br />
				<span style="COLOR:#A8A9AD; font-size: 8px">DESCRIPTION OR DETAIL INFORMATION</span>
			</div>
		</div>
		<div>
			<img alt="Zip BBD Dress" height="334" src="assets/images/collection/summer209/sum09-1.jpg" width="570" />
			
			<div id="largeImageCaption" style="COLOR:#6E6E70; font-size: 8px">
				KARACHIE DRESS<br />
				<span style="COLOR:#A8A9AD; font-size: 8px">DESCRIPTION OR DETAIL INFORMATION</span>
			</div>
		</div>
	</div>
	
</div>

menu.css

/*-------------------------------------------------------------------------------*/
/*  Top Menu  */
/*-------------------------------------------------------------------------------*/
.ajaxmenu i { display:none;}
.ajaxmenu { clear:both; height:60px; padding:10px 0px 0px 0px; position: absolute; top: 75px; background:  url(../magali/images/nav/nav-bg.gif) repeat-x; width: 848px}

.ajaxmenu ul {list-style-type:none;   padding:0 !important; margin: 0; height:60px; }
.ajaxmenu li { display: none; display: block;	margin: 0; padding: 0px 15px 0px 0px; float: left; }
.ajaxmenu a { display:block;  text-indent: -5000px; text-decoration: none; padding-top: 0px; height: 14px;}

#myajaxmenu ul {display: inline;  margin-top: 10px; position: absolute; top: 25px; width: 600px;}

#nav_2 {  width:42px; background:url("../magali/images/nav/nav-brand1.gif") no-repeat; text-decoration: none;}
#nav_2.active { width:42px; background:url("../magali/images/nav/nav-brand2.gif") no-repeat; text-decoration: none;}
#nav_3 { width:80px; background:url("../magali/images/nav/nav-collection1.gif") no-repeat  ; text-decoration: none; }
#nav_3.active { width:80px; background:url("../magali/images/nav/nav-collection2.gif") no-repeat  ; text-decoration: none; }
#nav_4 { width:41px; background:url("../magali/images/nav/nav-press1.gif") no-repeat; text-decoration: none;}
#nav_4.active { width:41px; background:url("../magali/images/nav/nav-press2.gif") no-repeat; text-decoration: none;}
#nav_5 { width:65px; background:url("../magali/images/nav/nav-stockists1.gif") no-repeat; text-decoration: none;}
#nav_5.active { width:65px; background:url("../magali/images/nav/nav-stockists2.gif") no-repeat; text-decoration: none;}
#nav_6 { width:56px; background:url("../magali/images/nav/nav-contact1.gif") no-repeat; text-decoration: none;}
#nav_6.active { width:56px; background:url("../magali/images/nav/nav-contact2.gif") no-repeat; text-decoration: none;}
#nav_50 { width:55px; background:url("../magali/images/nav/nav-anouck.gif") no-repeat; text-decoration: none;}
#nav_50.active { width:55px; background:url("../magali/images/nav/nav-anouck2.gif") no-repeat; text-decoration: none;}
#nav_11 { width:124px; margin-left: 280px; background:url("../magali/images/nav/nav-french.gif") no-repeat; text-decoration: none;}


#nav_56 { width:67px; background:url("../magali/images/nav/nav-winter09.gif") no-repeat; text-decoration: none;}
#nav_48 { width:113px; background:url("../magali/images/nav/nav-summer2-08.gif") no-repeat; text-decoration: none;}
#nav_49 { width:113px; background:url("../magali/images/nav/nav-summer2-09.gif") no-repeat; text-decoration: none;}












main.css

/* commented backslash hides from ie5mac \*/ 
html{
	height:100%;
	margin:0;
	padding:0
} 
/* end hack */ 
html,body {
	padding:0;
	margin:0;
	font-size: 11px;
	font-family: Arial, "Trebuchet MS", Verdana, sans serif;
	background: #fff;
}



.scroll {

    height: 311px;
	overflow-y: scroll;

}

.scroll-hori {
    height: 360px;
	overflow-x: scroll;
	overflow-y: hidden;
	background: #FFF;
	float: left;
	clear: right;
	width: 100%;
	display: inline;
	padding-left: 10px;
}

.scroll-hori img {
	padding: 10px 20px 10px 0;
}


.brand-content {
	padding: 24px 0px 0 0;
	font-size: 11px;
	width: 399px;
	float: right;
	height: auto;
}


#brand-hero {
	width: 420px;
	float: left;
	height: auto;
	padding-bottom: 10px;
	height: 800px;
}

#brand-hero img {
	padding: 3px;
	border: 1px solid #b1b1b1;
}

#inner {
	
	
}


#outer{
	height:99.9%;
	min-height:100%;
	text-align:left;
	margin:auto;
	position:relative;
	overflow:visible;
	width: 848px;
	
}

.topmenu {
	text-decoration: none;
	float: left;
	width: 848px;
	height: 50px;
}



/* mac hide  \*/
* html #outer{
	width: 848px;
}
/* end hide*/

html>body #outer{
	height:auto;
} /*for mozilla as IE treats height as min-height anyway*/


.header{
	width:848px;
	height: 130px;
	z-index:74;
	text-decoration: none;
}



#ajaxmenu{
	width:848px;
	height:20px;
	z-index:65;
	color: #666;
	font-size: 12px;

}
#logo {
	top: 33px;
	left:0px;
	position:absolute;
	width:166px;
	height:38px;
	text-indent: -5000px;
	z-index:300;
	background:  url(../magali/images/logo.gif) no-repeat left top;
	color: #FFF;
	text-decoration: none;
}


#anouck-logo {
	top: 180px;
	left:600px;
	position:absolute;
	width:190px;
	height:27px;
	background:  url(../magali/images/anouck-logo.gif) no-repeat left top;
	
}


html > body #logo { top:36px;} 





/* mac hide \*/
* html #outer, * html #header {width:848px}
/* end hide*/

.footer {
	clear: left;
	color: #3a3a3a;
	height:17px;
	font-size: 9px;
	padding-top: 5px;
	background:  url(../magali/images/footer.gif) repeat-x;
	width:848px;
	height: 20px;
}


.footer a {
	text-decoration: none;
	color: #3a3a3a;
	margin-bottom: 3px;
}




html>body #minHeight{
	float:left;
	width:0px;
	height:100%;
	margin-bottom:-82px;
} /*safari wrapper */




.sub-title {
	width: 322px;
	padding-bottom: 16px;
}


h1.a {
	color: #33FF00;
}

h1.title {
 	text-indent: -5000px;
	padding: 0;
	margin-top: -30px;
}



html>body  h1.title {
 	text-indent: -5000px;
	visibility: hidden;
	margin-top: -20px;
}

#gallery-content {
	height: 420px;
}

#content h2 {
	font-size: 18px;
	color: #303d73;
	line-height: 24px;
	position: relative;
}

#content h3 {
	font-size: 20px;
	line-height: 20px;
	font-weight: bolder;
	color: #666666;
	text-transform: uppercase;
}


#content p {
	color: #3a3a3a;
}

#content p a {
	color: #E53C28;
}

#content p a:hover {
		color: #E53C28;
		background: #FFF;
}





img {
	border: 0;
}

#content ul li{

	list-style-image: url(../magali/images/bullet_11x8.gif);
	margin-bottom: 0.5em;
	font-size: 110%;

}

#content a, #sidebar a
{
    color: #E53C28;
}

.stock td {
	padding: 3px;
}



/* home page flash \*/

#flash-home {
position:	absolute;
top: -1000px;
left: -5000px;
}








/* new sliding preview gallery \*/


	#previewPane{
		
		margin-bottom:10px;	
		text-align:center;
		float: left;
		position:relative;
		
		/* CSS HACK */
		height: 364px;	/* IE 5.x */
		height/* */:/**/364px;	/* Other browsers */
		height: /**/364px;
				
	}
	#previewPane img{
		line-height:364px;
		padding: 3px;
		border:1px solid #CCCCCC;
	}
	
	#galleryContainer{
		
		height:188px;	/* Height of the images + 2 */
		position:relative;
		overflow:hidden;
		padding:1px;
		width: 570px;
		top: 100px;
		left: 20px;
		/* CSS HACK */
		height: 188px;	/* IE 5.x - Added 2 pixels for border left and right */
		height/* */:/**/188px;	/* Other browsers */
		height: /**/188px;
				
	}
	#arrow_left{
		position:absolute;
		left:0px;
		z-index:10;
		/*background-color: #FFF;*/
	}
	#arrow_right{
		position:absolute;
		right:0px;
		z-index:10;
		/*background-color: #FFF;*/
		
	}
	#theImages{
		position:absolute;
		height:100px;
		left:40px;
		width:100000px;
		
	}
	#theImages #slideEnd{
		float:left;
	}
	#theImages img{
		float:left;
		padding:3px;
		filter: alpha(opacity=100);
		opacity: 0.99;
		cursor:pointer;
		border:0px;
	}

	#waitMessage{
		display:none;
		position:absolute;
		left:60px;
		top:150px;
		background-color:#FFF;
		border:3px double #000;
		padding:4px;
		color:#555;
		font-size:0.9em;
		font-family:arial;	
	}
	
	#largeImageCaption {
	margin-top: 10px;
	}
	
	#theImages .imageCaption{
		display:none;
	}
	
home page

<strong><div id="myGallery">
<div class="imageElement">
<img class="full" alt="Magali Pascal" height="417" src="assets/images/hero/winter10/Magali_Web_Winter10_01.jpg" width="848" />
</div>
<div class="imageElement">
<img class="full" alt="Magali Pascal" height="417" src="assets/images/hero/winter09/image02.jpg" width="848" />
</div>
<div class="imageElement">
<img class="full" alt="Magali Pascal" height="417" src="assets/images/hero/winter09/image03.jpg" width="848" />
</div>
<div class="imageElement">
<img class="full" alt="Magali Pascal" height="417" src="assets/images/hero/winter09/image04.jpg" width="848" />
</div>
<div class="imageElement">
<img class="full" alt="Magali Pascal" height="417" src="assets/images/hero/winter09/image05.jpg" width="848" />
</div>
</div></strong>


collection 

<div id="slideshow">
<div id="previewPane">
<img alt="Zip BBD Dress" height="334" src="assets/images/collection/summer209/sum09-1.jpg" width="227" />
<span id="waitMessage">Loading image. Please wait</span>	
<div id="largeImageCaption">
Karachie Dress
</div>
</div>
<div id="galleryContainer">
<div id="arrow_left">
<img src="images/arrow_left.gif" />
</div>
<div id="arrow_right">
<img src="images/arrow_right.gif" />
</div>
<div id="theImages">
<!-- Thumbnails -->
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-1.jpg','1');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-1.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-2.jpg','2');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-2.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-3.jpg','3');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-3.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-4.jpg','4');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-4.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-5.jpg','5');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-5.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-6.jpg','6');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-6.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-7.jpg','7');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-7.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-8.jpg','8');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-8.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-9.jpg','9');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-9.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-10.jpg','10');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-10.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-11.jpg','11');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-11.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-12.jpg','12');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-12.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-13.jpg','13');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-13.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-14.jpg','14');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-14.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-15.jpg','15');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-15.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-16.jpg','16');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-16.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-17.jpg','17');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-17.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-18.jpg','18');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-18.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-19.jpg','19');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-19.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-20.jpg','20');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-20.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-21.jpg','21');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-21.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-22.jpg','22');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-22.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-23.jpg','23');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-23.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-24.jpg','24');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-24.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-25.jpg','25');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-25.jpg" width="125" /></a>
<a href="#" onclick="showPreview('assets/images/collection/summer209/sum09-26.jpg','26');return false"><img height="188" src="assets/images/collection/summer209/thumb/sum09-26.jpg" width="125" /></a>
<!-- End thumbnails -->
<!-- Image captions -->	
<div class="imageCaption">
Zip BBD Dress
</div>
<div class="imageCaption">
Zip Sarouel Pant
</div>
<div class="imageCaption">
Zip Dress
</div>
<div class="imageCaption">
Zip Top
</div>
<div class="imageCaption">
Zip Party Dress
</div>
<div class="imageCaption">
Alexia Party Dress
</div>
<div class="imageCaption">
Army Bollero
</div>
<div class="imageCaption">
Alexia Top
</div>
<div class="imageCaption">
Army Classic Dress
</div>
<div class="imageCaption">
Army Party Dress
</div>
<div class="imageCaption">
Army Combi Short
</div>
<div class="imageCaption">
Army Short Pant
</div>
<div class="imageCaption">
Army Long Pant
</div>
<div class="imageCaption">
Army Top
</div>
<div class="imageCaption">
Army Knee Pant
</div>
<div class="imageCaption">
Black Dalia Dress
</div>
<div class="imageCaption">
Black Dalia Top
</div>
<div class="imageCaption">
Inca Singlet Top
</div>
<div class="imageCaption">
Inca Top
</div>
<div class="imageCaption">
Janis Dress
</div>
<div class="imageCaption">
Manhathan Dress
</div>
<div class="imageCaption">
Kafka Dress
</div>
<div class="imageCaption">
Kafka Top
</div>
<div class="imageCaption">
Sienna Dress
</div>
<div class="imageCaption">
Soho Dress
</div>
<div class="imageCaption">
Soho Top
</div>
<!-- End image captions -->
<div id="slideEnd">
</div>
</div>
</div>
</div>

COLOR="#BDBFBE"COLOR="#BEBFC1"