<cfcontent reset="true"><cfoutput><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
	
	<head>
		<cfparam name="request.pageTitle" default="Bali Resorts: Bali Sentosa Private Villas &amp; Spa in Seminyak Bali" />
		<title>#request.pageTitle#</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Elysian Index</title>
		<link href="assets/css/main.css" rel="stylesheet" type="text/css" media="screen" />
		<script type="text/javascript" src="assets/js/fsmenu.js"></script>
		<link rel="stylesheet" type="text/css" id="listmenu-h"  href="assets/css/listmenu_h.css" title="Horizontal 'Earth'" />
		<link rel="stylesheet" type="text/css" id="fsmenu-fallback"  href="assets/css/listmenu_fallback.css" />
		<script type="text/javascript" src="assets/js/dropdowncontent.js"> </script>
		<link rel="stylesheet" type="text/css" href="assets/css/contentslider.css" />
		<script type="text/javascript" src="assets/js/contentslider.js"></script>
		
		<link type="text/css" media="screen" rel="stylesheet" href="assets/css/colorbox.css" />
		<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<!--- 		<script src="assets/js/dynCalendar.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="assets/css/dynCalendar.css" /> --->
		<script src="assets/js/calendar.js" type="text/javascript"></script>
		<SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>

		<script src="assets/js/jquery.colorbox.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//Examples of how to assign the ColorBox event to elements
				$("a[rel='gallery']").colorbox();
				//Example of preserving a JavaScript event for inline calls.
				$("##click").click(function(){ 
					$('##click').css({"background-color":"##f00", "color":"##fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
		</script>
		
	</head>
	<cfparam name="request.googleMap" default="0" />
	<body<cfif request.googleMap> onload="load()" onunload="GUnload()"</cfif>> 
		<div id="container"> 
			<!--Header Start-->
		  	<div id="header">
			  	
			  	#content.header#
			  	#content.mainMenu#

			    <span>
				    
					<form action="#myself##attributes.fuseaction#" method="post">
						<p>
							<select name="languageChange" onChange="this.form.submit()">
								<option value="">Select Language</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=zh-CN">Chinese (Simplified)</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=zh-TW">Chinese (Traditional)</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=fr">French</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=de">German</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=el">Greek</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=id">Indonesian</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=it">Italian</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=ja">Japanese</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=ko">Korean</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=pt">Portuguese</option>
								<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.theelysian.com&sl=en&tl=es">Spanish</option>
							</select>
						</p>
					</form>

			    </span> 
			    
			</div>
		  	<!--Header End-->
		  	
		  	<div id="content"> 
		    <!--Sidebar Start-->
		   		<div class="content_top">
		      		<div class="contenttop_left">
		       			<div id="banner">

							#content.gloryBox#
							
		  					<div id="paginate-slider1" class="pagination"> </div>
		  					
							<script type="text/javascript">
							featuredcontentslider.init({
								id: "slider1",  //id of main slider DIV
								contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
								toc: "##increment",  //Valid values: "##increment", "markup", ["label1", "label2", etc]
								nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
								revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
								enablefade: [true, 0.2],  //[true/false, fadedegree]
								autorotate: [true, 3000],  //[true/false, pausetime]
								onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
									//previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
									//curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
								}
							})
							</script> 
							
						</div>
						
				        <div class="textbox">
					        #content.mainContent#
						</div>
				        
				       <cfif attributes.fuseaction is "content.display" and attributes.page is "home">
					       <div class="textbox">
					       		
					          	<h2>Packages</h2>
					          
					       		#application.villaObj.displayPromotions()#
	
					        </div>
				        </cfif>
				        
		        		<!--- <div class="textbox bottom"> 
		         			<div id="banner_bottom">
		  						<div id="slider2" class="sliderwrapper1">
								    <div class="contentdiv"><img src="assets/images/img_villa.jpg" width="707" height="197" alt="" />
								      <p><span>* * * Special last minute discounts for all february bookings...</span><a class="click" href="##">1Click here for details</a></p>
								    </div>
								    <div class="contentdiv"><img src="assets/images/img_villa1.jpg" width="707" height="197" alt="" />
								      <p><span>* * * Special last minute discounts for all february bookings...</span><a class="click" href="##">2Click here for details</a></p>
								    </div>
								    <div class="contentdiv"><img src="assets/images/img_villa2.jpg" width="707" height="197" alt="" />
								      <p><span>* * * Special last minute discounts for all february bookings...</span><a class="click" href="##">3Click here for details</a></p>
								    </div>
		  						</div>
		  
		  						<div id="paginate-slider2" class="pagination"> </div>
		  						
								<script type="text/javascript">
								featuredcontentslider.init({
									id: "slider2",  //id of main slider DIV
									contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
									toc: "##increment",  //Valid values: "##increment", "markup", ["label1", "label2", etc]
									nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
									revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
									enablefade: [true, 0.2],  //[true/false, fadedegree]
									autorotate: [true, 3000],  //[true/false, pausetime]
									onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
										//previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
										//curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
									}
								})
								</script> 
								
							</div>
		        		</div> --->
		      		</div>
		      		
		      		<div class="contenttop_right">
		       			<div class="book">
			       			
							<SCRIPT LANGUAGE="JavaScript">
								//var cal = new CalendarPopup();
								var cal1x = new CalendarPopup("testdiv1");
								var cal2x = new CalendarPopup("testdiv1");
							</SCRIPT>

							<h1>BOOK ONLINE</h1>
							<form method="get" action="https://gc.synxis.com/rez.aspx" class="booking-form track" name="booking-form" id="booking-form" target="_blank">                 
								<input type="hidden" name="Hotel" value="13506"> 
								<input type="hidden" name="Chain" value="5154"> 
								<input type="hidden" name="template" value="GCO"> 
								<input type="hidden" name="shell" value="GCO2"> 
								<input type="hidden" name="start" value="1"> 

								<p>
								    <label>Arrival date:</label>
								    <input type="text" name="arrive" id="arrive" maxlength="10" class="input_text" value="mm/dd/yyyy" style="width:150px" /> 
								    <A HREF="##" onClick="cal1x.select(document.forms['booking-form'].arrive,'anchor1','MM/dd/yyyy'); return false;" NAME="anchor1" ID="anchor1">
								    	<img src="assets/images/icon_calender.png" alt="" width="16" height="16" style="margin-bottom:5px" /> 
								    </a>
								</p>
								
								<p>
								    <label>Departure:</label>
								    <input type="text" name="depart" id="depart" maxlength="10" class="input_text" value="mm/dd/yyyy" style="width:150px" /> 
								    <A HREF="##" onClick="cal2x.select(document.forms['booking-form'].depart,'anchor2','MM/dd/yyyy'); return false;" NAME="anchor2" ID="anchor2">
								    	<img src="assets/images/icon_calender.png" alt="" width="16" height="16" style="margin-bottom:5px" /> 
								    </a>
								 <!---    <input type="text" name="depart" id="depart" maxlength="10" class="textfield date-end longer" value="mm/dd/yyyy" /> <span class="form-cal">(mm/dd/yyyy)</span> 
								    <img src="assets/images/icon_calender.png" alt="" width="16" height="16" />  --->
								</p>
								
							  	<p> 
								  	<span>
									    <label>Adults:</label>
										<select name="adult" class="short"> 
											<option value="1">1</option> 
											<option value="2" selected="selected">2</option> 
											<option value="3">3</option> 
											<option value="4">4</option> 
											<option value="5">5</option> 
										</select> 
									</span> 
									<span>
									    <label class="short">Children:</label>
										<select name="child"> 
											<option value="0" selected="selected">0</option> 
											<option value="1">1</option> 
											<option value="2">2</option> 
											<option value="3">3</option> 
											<option value="4">4</option> 
										</select> 
									</span> 
								</p>
								
								<p>
								    <label>Promocode <i>(optional)</i></label>
								    <input type="text" name="promo" id="promo-code" maxlength="10" class="input_text" />
								</p>
								
							  <p> <a href="##" onClick="document.forms['booking-form'].submit(); return false" class="btn">Check Availability / Book Now</a> </p>
							</form>
							<!--- 
							<form action="##">
							  <p>
							    <label>Arrival date:</label>
							    <select class="long">
							      <option>1</option>
							    </select>
							    <select class="longer">
							      <option>Month/Yr</option>
							    </select>
							    <img src="assets/images/icon_calender.png" alt="" width="16" height="16" /> </p>
							  <p>
							    <label>Departure:</label>
							    <select class="long">
							      <option>1</option>
							    </select>
							    <select class="longer">
							      <option>Month/Yr</option>
							    </select>
							    <img src="assets/images/icon_calender.png" alt="" width="16" height="16" /> </p>
							  <p> <span>
							    <label>Adults:</label>
							    <select class="short">
							      <option>2</option>
							    </select>
							    </span> <span>
							    <label class="short">Children:</label>
							    <select class="short">
							      <option>0</option>
							    </select>
							    </span> </p>
							  <p>
							    <label>Promocode <i>(optional)</i></label>
							    <input name="" type="text" class="input_text" />
							  </p>
							  <p> <a href="##" class="btn">Check Availability / Book Now</a> </p>
							</form> --->
		        		</div>
		        		
		        		<a  href="index.cfm?fuseaction=content.display&page=rates" class="brown">see our RATES</a> 
		        		<a href="index.cfm?fuseaction=content.display&page=packages" class="brown"><strong>special</strong> OFFERS</a>
		        		
				        <div class="getform">
				          <form action="##">
				            <fieldset>
				              <input type="text" value="Join our Newsletter" onblur="if(this.value=='') this.value='Join our Newsletter';" onfocus="if(this.value=='Join our Newsletter') this.value='';" class="int_text" />
				              <a href="##" class="int_btn"></a>
				            </fieldset>
				          </form>
				          <p>Sign up to our newsletter and recieve great 
				            offers and updates!</p>
				          <p><span>To unsubscribe from e-news</span> <a href="##">click here.</a></p>
				        </div>
				        
				        <div class="item">
				          <h1>CONTACT US</h1>
				          <div class="icons"> <a href="##" id="emaillink" rel="emailcontent"></a> <a href="##" id="phonelink" rel="phonecontent"></a> <a href="##" id="facebooklink" rel="facebookcontent"></a> <a href="##" id="twitterlink" rel="twittercontent"></a> <a href="##" id="skypelink" rel="skypecontent"></a> <a href="##" id="rightlink" rel="rightcontent"></a></div>
				        </div>
		        
				        <div class="item_bottom">
					        <a href="http://www.designhotels.com/hotels/asiapacific/indonesia/bali/the_elysian_bali_indonesia/" id="design" target="_blank"></a>
					        <a href="http://www.hiphotels.com/main.php?genre_id=586" id="hiphotel" target="_blank"></a>
					        <a href="http://www.tablethotels.com/The-Elysian-Hotel/Seminyak-Hotels-Bali-Indonesia/63857" id="tablet" target="_blank"></a>
					        <a href="http://www.kiwicollection.com/property/the-elysian-villa-hotel" id="kiwi" target="_blank"></a>
					        <a href="http://www.quintessentially.com/" id="recommended" target="_blank"></a>
				        </div>
				        
		      		</div>
		      
			    </div>
			    <!--Sidebar End--> 
			    
		  	</div>
		  
		</div>
		
		<div id="content_bot">

			<div class="box promotions boxFirst">
				#trim(application.ctaObj.displayCTA(cta_position=1))#             
			</div>
		    
			<div class="box chinese">
				#trim(application.ctaObj.displayCTA(cta_position=2))#
			</div>
			
			<div class="box spa">
				#trim(application.ctaObj.displayCTA(cta_position=3))#  
			</div>
			
			<div class="box valentines">
				#trim(application.ctaObj.displayCTA(cta_position=4))#
			</div>
				     
		</div>
		
		<!--Footer Start-->
		<div id="footer">
			#content.footer#
		</div>
		<!--Footer End-->
		
		<!--popup begin-->
		<div id="emailcontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width:541px; z-index:99999;">
		
			<div class="subpage_wrapper" style="width:242px; padding-left:202px ">
			
			    <div class="subpage_top">
				    <p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:15px;" /></p>
				</div>
				
			    <div class="subpage_inner">
					<p>General Information: <a href="mailto:info@theelysian.com">info@theelysian.com</a> </p>
					<p>Reservations: <a href="mailto:res@theelysian.com">res@theelysian.com</a> </p>
					<p>Sales & Marketing: <a href="mailto:sales@theelysian.com">sales@theelysian.com</a></p>
			    </div>
			    
			 </div>
		 
		 </div>    
                             
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("emaillink", "right-bottom", 1, 'mouseover')
		</script>
		
		<div id="phonecontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 541px; z-index:99999;">
			<div class="subpage_wrapper" style="width:242px; padding-left:164px ">
			    <div class="subpage_top"><p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:55px;" /></p></div>
			    <div class="subpage_inner">
			          <p>Direct:<br />T: +62 361 730 999 | F: +62 361 737 509 </p>
			          <!--- <p>Japan:<br />P: +81 3 6801 8344 | F: +81 3 5840 8503 </p>
			          <p>UK & Ireland:<br />P&F: +44 0172 681 6400 </p> --->
			    </div>
			 </div>
		 </div>  
		                             
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("phonelink", "right-bottom", 1, 'mouseover')
		</script>
		
		<div id="facebookcontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 541px; z-index:99999;">
			<div class="subpage_wrapper" style="width:242px; padding-left:125px ">
			    <div class="subpage_top"><p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:95px;" /></p></div>
			    <div class="subpage_inner">
			          <p>Join us on <a href="http://www.facebook.com/home.php##!/pages/The-Elysian-Boutique-Villa-Hotel/235503809734" target="_blank">Facebook</a>!</p>
			    </div>
			 </div>
		 </div>  
		                             
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("facebooklink", "right-bottom", 1, 'mouseover')
		</script>
		
		<div id="twittercontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width:541px; z-index:99999;">
			<div class="subpage_wrapper" style="width:242px; padding-left:90px ">
			    <div class="subpage_top"><p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:125px;" /></p></div>
			    <div class="subpage_inner">
			    <p>Follow us on <a href="http://twitter.com/the_elysian">Twitter</a> for all the latest news.</p>
			    </div>
			 </div>
		 </div>  
		                                                          
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("twitterlink", "right-bottom", 1, 'mouseover')
		</script>
		
		<div id="skypecontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 541px; z-index:99999;">
			<div class="subpage_wrapper" style="width:242px; padding-left:50px ">
			    <div class="subpage_top"><p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:167px;" /></p></div>
			    <div class="subpage_inner">
				    <p><a href="skype:the_elysian?call">Click here</a> to contact our reservation team using Skype!</p>
			    </div>
			 </div>  
		</div>  
		                      
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("skypelink", "right-bottom", 1, 'mouseover')
		</script>
		
		<div id="rightcontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 541px; z-index:99999;">
			<div class="subpage_wrapper" style="width:242px; padding-left:10px ">
			    <div class="subpage_top"><p><img src="assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:210px;" /></p></div>
			    <div class="subpage_inner">
			          <p><a href="http://foursquare.com/venue/2534124" target="_blank"">Click here</a> to check in at Foursquare.</p>
			    </div>
			 </div>  
		 </div> 
		                            
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("rightlink", "right-bottom", 1, 'mouseover')
		</script>
		<!--popup end-->
		<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;z-index:9999999"></DIV>

	</body>
</html>
</cfoutput>