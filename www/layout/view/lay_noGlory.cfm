<cfcontent reset="true"><cfoutput><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<cfparam name="request.pageTitle" default="Bali Resorts: Bali Sentosa Private Villas &amp; Spa in Seminyak Bali" />
		<title>#request.pageTitle#</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="#request.metaDescription#" />
		<meta name="keywords" content="#request.metaKeywords#" />

		<link href="assets/css/main.css" rel="stylesheet" type="text/css" media="screen" />
		<!--- <link href="assets/css/lightbox.css" rel="stylesheet" type="text/css" media="screen" /> --->
		<link rel="stylesheet" href="assets/css/jquery.lightbox-0.5.css" />

		<script type="text/javascript" src="assets/js/fsmenu.js"></script>
		<link rel="stylesheet" type="text/css" id="listmenu-h"  href="assets/css/listmenu_h.css" title="Horizontal 'Earth'" />
		<link rel="stylesheet" type="text/css" id="fsmenu-fallback"  href="assets/css/listmenu_fallback.css" />
		<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/jquery.innerfade.js"></script>
		<script type="text/javascript" src="assets/js/jquery.lightbox-0.5.js"></script>
		
		<script type="text/javascript">
			$(document).ready(
				function(){
					$('ul##featured').innerfade({
						speed: 1000,
						timeout: 5000,
						type: 'sequence',
						containerheight: '311px'
					});
				});
		</script>
<!--- 		<script type="text/javascript">
		    $(function() {
		        $('##gallery a').lightBox();
		    });
		</script> --->

		<script type="text/javascript" src="assets/js/dropdowncontent.js"> </script>
		
		<link rel="stylesheet" type="text/css" href="assets/css/contentslider.css" />
		<script type="text/javascript" src="assets/js/contentslider.js">
		
		/***********************************************
		* Featured Content Slider- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		* This notice MUST stay intact for legal use
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
		***********************************************/
		
		</script>

		<!--- start globekey booking includes --->
		<script src="assets/globekey/keyres-browserSniffer.js" type="text/javascript" language="javascript"></script>
		<script src="assets/globekey/keyres-dynCalendar.js" type="text/javascript" language="javascript"></script>

		<link rel="stylesheet" href="assets/globekey/keyres-dynCalendar.css" type="text/css" media="screen" />
		<!--- end globekey booking includes --->

	</head>
	<cfparam name="request.googleMap" default="0" />
	<body<cfif request.googleMap> onload="load()" onunload="GUnload()"</cfif>>
		
		<div id="container">
		  	<!-- header begin-->
		    <div id="header">
			    #content.header#
			    #content.mainMenu#
		    </div>
		    <!--header end-->
		    
		   <!-- content begin-->
		    <div id="content">
		    
		         <div class="content_top">
		         
		         	<div class="contenttop_left">
		         		
		         		<!--- #content.gloryBox# --->
		                   
						<div class="textbox">
							<div class="textbox_main">
								#content.mainContent#
							</div>
						</div>
		                   
					</div>
		              
		              <div class="contenttop_right">
		              
		                   <div class="book">
			                   
			                   #trim(application.reservationObj.displayReservationForm())#
			                   
		                   </div>
		                   
		                   <div class="item">
		                   
		                        <div class="item_inner">
		                        
		                             <h4>CONTACT US</h4>
		                             
		                             <div class="icons">
		                                  <a href="index.cfm?fuseaction=contact.feedbackForm&page=feedback-form" id="emaillink" rel="emailcontent"><img src="/assets/images/icon_email.png" alt="" width="27" height="26" /></a>
		                                  <a href="index.cfm?fuseaction=contact.contactDetails&page=contact-us" id="phonelink" rel="phonecontent"><img src="/assets/images/icon_phone.png" alt="" width="27" height="26" /></a>
		                                  <a href="skype:SentosaReservations2?call" id="skypelink" rel="skypecontent"><img src="/assets/images/icon_skype.png" alt="" width="27" height="26" /></a>
		                             </div>
		                             
		                        </div>
		                        
		                   </div>
		                   
							<div class="item menu_last">
								<a href="index.cfm?fuseaction=content.display&page=last-minute-offers">
									<div class="item_inner_brown"><img src="/assets/images/sentosa_clock_icon.gif" alt="" class="img_right" />
										<h2 class="white" style="margin-top:7px">LAST MINUTE OFFERS * * *</h2>
									</div>
								</a>
							</div>    
		                                  
						<div class="item menu_check">
							<a href="index.cfm?fuseaction=content.display&page=villa-types-and-rates">
								<div class="item_inner"><img src="/assets/images/pic_arrowright.png" alt="" width="22" height="17" class="img_right" />
									<h2>CHECK RATES</h2>
								</div>
							</a>
						</div>      
		                   
		                 <div class="item getform">

		                         <cfform action="#request.myself##attributes.fuseAction#">
		                              <p>
		                                  <cfinput validate="email" required="yes" message="Please enter a valid email address" type="text" name="newsletterEmail" value="Get Special Offers by E-Mail..." onblur="if(this.value=='') this.value='Get Special Offers by E-Mail...';" onfocus="if(this.value=='Get Special Offers by E-Mail...') this.value='';" class="int_text" />
		                                  <input type="submit" name="newsletterSave" class="int_btn" value=" " />
		                             </p>
		                         </cfform>
		                         
		                   </div>

		                   <div class="formbox">
			                   
		                        <form action="#myself##attributes.fuseaction#" method="post">
		                           <p>
			                       		<select name="languageChange" onChange="this.form.submit()">
			                           		<option value="">Select Language</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=zh-CN">Chinese (Simplified)</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=zh-TW">Chinese (Traditional)</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=fr">French</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=de">German</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=el">Greek</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=id">Indonesian</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=it">Italian</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=ja">Japanese</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=ko">Korean</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=pt">Portuguese</option>
			                           		<option value="http://translate.google.com/translate?js=y&prev=_t&hl=en&ie=UTF-8&layout=1&eotf=1&u=http%3A%2F%2Fwww.balisentosa.com&sl=en&tl=es">Spanish</option>
										</select>
									</p>
		                        </form>
		                        
		                   </div>
		                   
		                   <div>
			                   <cfset localDateTime = dateAdd('h','12',now()) />
			                   <span class="dateBrown">Sentosa Date & Time:</span><span class="dateBlack"> #dateFormat(localDateTime,"mmm d, yyyy")# | <strong>#lcase(timeFormat(localDateTime,"h:mm tt"))#</strong></span>
			               </div>

		              </div>
		              
		         </div>
		         
				<div class="content_bot">

					<div class="box promotions">
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
		         
		    </div>
		   <!-- content end-->
		   
		   <!--footer begin-->
		    <div id="footer">
			    
		         #trim(content.footer)#
		        
		    </div>
		   <!-- footer end-->
		   
		</div>
		
		<!--popup begin-->
		<div id="emailcontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width:541px; z-index:99999;">
		<div class="subpage_wrapper" style="width:242px; padding-left:84px ">
		    <div class="subpage_top"><p><img src="/assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:136px;" /></p></div>
		    <div class="subpage_inner">
				<p><a href="index.cfm?fuseaction=contact.feedbackForm&page=feedback-form" class="white">Click here</a> to contact us using our feedback form.</p>
		    </div>
		 </div>
		 </div>                                                           
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("emaillink", "right-bottom", 1, 'mouseover')
		</script>
		<div id="phonecontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 541px; z-index:99999;">
		<div class="subpage_wrapper" style="width:242px; padding-left:42px ">
		    <div class="subpage_top"><p><img src="/assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:180px;" /></p></div>
		    <div class="subpage_inner">
		          <p>Reservations:<br />P: +62 361 847 6659<!--- P: +62 361 730 540 ---> &nbsp;|&nbsp;F: +62 361 847 6592 <!--- F: +62 361 732 724 ---></p>
		          <p>General Enquiries:<br />P: +62 361 730 333 &nbsp;|&nbsp;&nbsp; F: +62 361 737 111</p>
		    </div>
		 </div>
		 </div>  
		                             
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("phonelink", "right-bottom", 1, 'mouseover')
		</script>
		<div id="skypecontent" class="subpage" style="visibility: hidden; text-align:left; position:absolute; width: 242px; z-index:99999;">
		    <div class="subpage_top"><p><img src="/assets/images/pic_arrow.png" alt="" width="17" height="8" style="margin-left:220px;" /></p></div>
		    <div class="subpage_inner">
		          <p><a class="white" href="skype:SentosaReservations2?call">Click here</a> to contact our reservation team using Skype!</p>
		    </div>
		 </div>  
		                             
		<script type="text/javascript">
		//Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:
		dropdowncontent.init("skypelink", "right-bottom", 1, 'mouseover')
		</script>
		<!--popup end-->
	</body>
</html>

</cfoutput>