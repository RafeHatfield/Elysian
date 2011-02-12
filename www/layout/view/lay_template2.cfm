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

	</head>
	<cfparam name="request.googleMap" default="0" />
	<body<cfif request.googleMap> onload="load()" onunload="GUnload()"</cfif>>
	
		<div id="container">
		
		    <div id="header">
		        #trim(content.header)#
		    </div>
		    
		    <div class="content">
		    
		    	<div class="sidebar">
		    	
		        	<div class="sidebar_nav">
			        	#trim(content.mainMenu)#
		            </div>
		            
				</div>
				
		        <div class="maincontent">
			        #trim(content.gloryBox)#
		        </div>
		        
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

		                <div class="reservations_box">
		                    #trim(application.reservationObj.displayReservationForm())#
		                </div>
		                
		            </div>
		            
		        </div>
		        
		    </div>
		    
		</div> 
	
	</body>

</html>
</cfoutput>