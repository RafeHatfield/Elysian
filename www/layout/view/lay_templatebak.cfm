<cfcontent reset="true"><cfoutput><html>
	<head>
		<cfparam name="request.pageTitle" default="Bali Resorts: Bali Sentosa Private Villas &amp; Spa in Seminyak Bali Resort" />
		<title>#request.pageTitle#</title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="description" content="#request.metaDescription#" />
		<meta name="keywords" content="#request.metaKeywords#" />

		<link rel="stylesheet" href="assets/css/main.css" type="text/css" media="screen" />
		
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
		</cfoutput>
<!--- <style media="screen" type="text/css">
/* <!-- */


/* column container */
	.colmask {
		position:relative;	/* This fixes the IE7 overflow hidden bug */
		clear:both;
		float:left;
		width:100%;			/* width of whole page */
		overflow:hidden;		/* This chops off any overhanging divs */
	}
	/* common column settings */
	.colright,
	.colmid,
	.colleft {
		float:left;
		width:100%;			/* width of page */
		position:relative;
	}
	.col1,
	.col2,
	.col3 {
		float:left;
		position:relative;
		padding:0 0 0 0;	/* no left and right padding on columns, we just make them narrower instead 
						only padding top and bottom is included here, make it whatever value you need */
		overflow:hidden;
	}
	/* 3 Column settings */
	.threecol {
		background:#aaa;		/* right column background colour */
	}
	.threecol .colmid {
		right:193px;			/* width of the right column */
		background:#fff;		/* center column background colour */
	}
	.threecol .colleft {
		right:642px;			/* width of the middle column */
		background:#ccc;	/* left column background colour */
	}
	.threecol .col1 {
		width:642px;			/* width of center column content (column width minus padding on either side) */
		left:993px;			/* 100% plus left padding of center column */
	}
	.threecol .col2 {
		width:158px;			/* Width of left column content (column width minus padding on either side) */
		left:193px;			/* width of (right column) plus (center column left and right padding) plus (left column left padding) */
	}
	.threecol .col3 {
		width:193px;			/* Width of right column content (column width minus padding on either side) */
		left:835px;			/* Please make note of the brackets here:
						(100% - left column width) plus (center column left and right padding) plus (left column left and right padding) plus (right column left padding) */
	}
/* --> */
</style> --->

<Cfoutput>
	</head>
	<cfparam name="request.googleMap" default="0" />
	<body<cfif request.googleMap> onload="load()" onunload="GUnload()"</cfif>>
	
		<div id="container">
		
		    <div id="header">
		        #trim(content.header)#
		    </div>
		    
		    
<!--- 		    <div class="colmask threecol">
		    
				<div class="colmid">
				
					<div class="colleft">
					
						<div class="col1">
							#trim(content.gloryBox)#
						</div>
						
						<div class="col2">
							#trim(content.mainMenu)#
						</div>
						
						<div class="col3">
							#trim(application.reservationObj.displayReservationForm())#
						</div>
						
					</div>
					
				</div>

			</div> --->

		    
		    
		    <div class="content">
		    
		    	<div class="sidebar">
		    	
		        	<div class="sidebar_nav">
			        	#trim(content.mainMenu)#
		            </div>
		            
				</div>
				
		        <div class="maincontent">
		        
		        	<div class="maincontent_inner">
		        	
		        		<div class="maincontent_list_box">
			            	#trim(content.gloryBox)#
			            </div>

		                <div class="reservations_box">
		                    #trim(application.reservationObj.displayReservationForm())#
		                </div>
		                
		            </div>
		            
		        </div>
		        <!--- 
		        <div class="maincontentupper">
			        #trim(content.gloryBox)#
		        </div>
		         --->
		    </div>
		    
		    <div class="content">
		    
		        <div class="sidebar_links">
			        #application.menuObj.displaySpecialOffersMenu()#
		        </div>
		        
		        <div class="maincontent">
		        
		        	<div class="maincontent_inner">
		        	
		        		<div class="maincontent_list_box">
			            	#trim(content.mainContent)#
			            </div>
<!--- 
		                <div class="reservations_box">
		                    #trim(application.reservationObj.displayReservationForm())#
		                </div>
		                 --->
		            </div>
		            
		        </div>
		        
		    </div>
		    
		</div> 
	
	</body>

</html>
</cfoutput>