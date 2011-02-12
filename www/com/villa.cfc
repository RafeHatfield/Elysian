<cfcomponent hint="I am the villa details function" output="false">

	<!--- Author: Rafe - Date: 9/26/2009 --->
	<cffunction name="displayVillaAddress" output="false" access="public" returntype="string" hint="I return the address for the villa">

		<cfargument name="feedbackFormSuccess" type="boolean" default="0" required="false" />

		<cfset var qVillaDetails = getVillaDetails() />
		<cfset var villaAddress = "" />

		<cfsaveContent variable="villaAddress">

			<cfoutput query="qVillaDetails">
				
				<h3>#ucase(vil_title)#</h3>
				<br />
				<p><a href="http://www.facebook.com/profile.php?v=info&id=100000023653195" target="_new"><img src="/assets/images/facebook_logo.png" /></a>
				
				<p>
					<span>#vil_address#</span>
					
					<cfif len(vil_phone)>
						<span>ph: #vil_phone#</span>
					</cfif>
					
					<cfif len(vil_fax)>
						<span>fax: #vil_fax#</span>
					</cfif>
	
					<cfif len(vil_email)>
						<span>email: #vil_email#</span>
					</cfif>
	
				</p>
						
			</cfoutput>

		</cfsaveContent>

		<cfreturn villaAddress />

	</cffunction>

	<!--- Author: Rafe - Date: 10/4/2009 --->
	<cffunction name="getVillaDetails" output="false" access="public" returntype="query" hint="I return the details for the villa">

		<cfset var getVillaDetails = "" />

		<cfquery name="getVillaDetails" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT TOP(1) vil_title, vil_description, vil_address, vil_phone, vil_email, vil_otherContact, vil_approval, vil_fax
			FROM Villa
		</cfquery>

		<cfreturn getVillaDetails />

	</cffunction>

	<!--- Author: Rafe - Date: 10/4/2009 --->
	<cffunction name="villaDetailsSave" output="false" access="public" returntype="any" hint="I save the villas details">

		<cfset var deleteVillaDetails = "" />
		<cfset var addVillaDetails = "" />

		<cftransaction>

			<cfquery name="deleteVillaDetails" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				DELETE FROM Villa
			</cfquery>

			<cfquery name="addVillaDetails" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO Villa (
					vil_title,
					vil_description,
					vil_address,
					vil_phone,
					vil_email,
					vil_otherContact,
					vil_fax
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_title#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_description#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_address#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_phone#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_email#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_otherContact#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.vil_fax#" list="false" />
				)
			</cfquery>

		</cftransaction>

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="getPromotion" output="false" access="public" returntype="query" hint="I return a query with the given promotion">

		<cfargument name="prm_id" type="numeric" default="" required="true" />

		<cfset var getPromotion = "" />

		<cfquery name="getPromotion" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT prm_title, prm_body, prm_active
			FROM wwwPromotion
			WHERE prm_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />
		</cfquery>

		<cfreturn getPromotion />

	</cffunction>

	<!--- Author: Rafe - Date: 10/17/2009 --->
	<cffunction name="getPromotionImage" output="false" access="public" returntype="query" hint="I return a promotion image based on the promotion ID and image type">

		<cfargument name="img_type" type="string" default="Promotion" required="false" />
		<cfargument name="prm_id" type="numeric" default="" required="true" />

		<cfset var getPromotionImage = "" />

		<cfquery name="getPromotionImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT img_id, img_title, img_name, img_title, img_altText
			FROM wwwImage
				INNER JOIN wwwPromotion_Image on pri_image = img_id
					AND pri_promotion = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />
			WHERE img_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_type#" list="false" />
		</cfquery>

		<cfreturn getPromotionImage />

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="getPromotions" output="false" access="public" returntype="query" hint="I return a query with all the promotions">

		<cfset var getPromotions = "" />

		<cfquery name="getPromotions" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT prm_id, prm_title, prm_body, prm_active<!--- ,
				img_id, img_title, img_name, img_altText --->
			FROM wwwPromotion
<!--- 				LEFT OUTER JOIN wwwPromotion_Image ON prm_id = pri_promotion
				LEFT JOIN wwwImage ON pri_image = img_id
					AND img_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion" list="false" /> --->
			WHERE prm_active = 1
			ORDER BY prm_dateEntered DESC
		</cfquery>

		<cfreturn getPromotions />

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="getPromotionsAdmin" output="false" access="public" returntype="query" hint="I return a query with all the promotions">

		<cfset var getPromotions = "" />

		<cfquery name="getPromotions" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT prm_id, prm_title, prm_body, prm_active
			FROM wwwPromotion
			ORDER BY prm_dateEntered DESC
		</cfquery>

		<cfreturn getPromotions />

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="promotionSave" output="false" access="public" returntype="any" hint="i save the information for a promotion">

		<cfargument name="prm_active" type="string" default="" required="false" />

		<cfset var updatePromotion = "" />
		<cfset var addPromotion = "" />
		<Cfset var addImage = "" />
		<cfset var updateImage = "" />
		<cfset var removePromotionImage = "" />
		<cfset var addPromotionImage = "" />
		<cfset var imageInterpolation = "highQuality" />

		<cfset arguments.prm_active = yesNoFormat(arguments.prm_active) />

		<cfif arguments.prm_id gt 0>

			<cfquery name="updatePromotion"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE wwwPromotion SET
					prm_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.prm_title#" list="false" />,
					prm_body = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.prm_body#" list="false" />,
					prm_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.prm_active#" list="false" />
				WHERE prm_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />
			</cfquery>

		<cfelse>

			<cfquery name="addPromotion"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO wwwPromotion	(
					prm_title,
					prm_body,
					prm_active
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.prm_title#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.prm_body#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.prm_active#" list="false" />
				)
				SELECT SCOPE_IDENTITY() AS promotionID
			</cfquery>

			<cfset arguments.prm_id = addPromotion.promotionID />

		</cfif>

		<!--- handle glory image --->
		<cfif len(arguments.img_nameGlory)>

			<cffile action="upload" filefield="img_nameGlory" destination="#application.imageUploadPath#" nameconflict="makeUnique" accept="image/gif, image/jpeg, image/jpg, image/pjpeg">

			<cfset FileName = cffile.serverFileName & '.' & cffile.serverFileExt />
			<cfset fileNameSanitise = application.contentObj.sanitise(cffile.serverFileName) & '.' & cffile.serverFileExt />

			<cffile action="rename" source="#application.imageUploadPath##fileName#" destination="#application.imageUploadPath##fileNameSanitise#">

			<cfimage action="read" name="imageInMem" source="#application.imageUploadPath##FileNameSanitise#" />

<!--- 
			<cfset ImageResize(imageInMem, "665", "", imageInterpolation) />
			<cfset ImageCrop(imageInMem, "0", "0", "665", "311") />

			<cfimage source="#imageInMem#" action="write" destination="#application.imageUploadPath##fileNameSanitise#" overwrite="yes" />
			<cfimage action="info" source="#imageInMem#" structName="ImageCR" />

			<cfset finalWidth = imageCR.width />
			<cfset finalHeight = imageCR.height />

			<cfimage action="read" name="imageInMem" source="#application.imageUploadPath##FileNameSanitise#" />
 --->

			<cfset tnFileName = listGetAt(fileNameSanitise,"1",".") & "_200." & listGetAt(fileNameSanitise,"2",".") />
			
			<cfset ImageResize(imageInMem, "200", "", imageInterpolation) />
			
			<cfimage source="#imageInMem#" action="write" destination="#application.imageUploadPath##tnFileName#" overwrite="yes" />
			<cfimage action="info" source="#imageInMem#" structName="ImageCR" />

			<cfset tnFinalWidth = imageCR.width />
			<cfset tnFinalHeight = imageCR.height />
			<!--- 
			<cftransaction>

				<cfquery name="addImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO wwwImage (
						img_title,
						img_name,
						img_type,
						img_altText,
						img_height,
						img_width
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_title#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#fileNameSanitise#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion Glory" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_altText#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#finalHeight#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#finalWidth#" list="false" />
					)

					SELECT SCOPE_IDENTITY() AS imageID
				</cfquery>

				<!--- remove any previous main image for this content --->
				<cfquery name="removePromotionImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					DELETE FROM wwwPromotion_Image
					WHERE pri_promotion = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />
						AND pri_image IN (
							SELECT img_id
							FROM wwwImage
							WHERE img_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion Glory" list="false" />
						)
				</cfquery>

				<!--- add new image for this content --->
				<cfquery name="addPromotionImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO wwwPromotion_Image (
						pri_promotion,
						pri_image
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#addImage.imageID#" list="false" />
					)
				</cfquery>

			</cftransaction>
			 --->
			<!--- repeat process for tn --->
			<cftransaction>

				<cfquery name="addImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO wwwImage (
						img_title,
						img_name,
						img_type,
						img_altText,
						img_height,
						img_width
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_title#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#tnFileName#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion TN" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_altText#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#tnfinalHeight#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#tnfinalWidth#" list="false" />
					)

					SELECT SCOPE_IDENTITY() AS imageID
				</cfquery>

				<!--- remove any previous main image for this content --->
				<cfquery name="removePromotionImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					DELETE FROM wwwPromotion_Image
					WHERE pri_promotion = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />
						AND pri_image IN (
							SELECT img_id
							FROM wwwImage
							WHERE img_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion TN" list="false" />
						)
				</cfquery>

				<!--- add new image for this content --->
				<cfquery name="addPromotionImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO wwwPromotion_Image (
						pri_promotion,
						pri_image
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.prm_id#" list="false" />,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#addImage.imageID#" list="false" />
					)
				</cfquery>

			</cftransaction>

		<cfelseif val(arguments.img_idGlory) gt 0>

			<!--- no new image, update details for existing image --->
			<cfquery name="updateImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE wwwImage SET
					img_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_title#" list="false" />,
					img_altText = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.img_altText#" list="false" />
				WHERE img_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.img_idGloryTN#" list="false" />
			</cfquery>

		</cfif>

	</cffunction>

	<!--- Author: Rafe - Date: 10/17/2009 --->
	<cffunction name="promotionContactSave" output="false" access="public" returntype="any" hint="">

		<!--- <cfargument name="newsletterSignup" type="string" default="" required="false" /> --->

		<cfset var promotionContactSuccess = 0 />
		<cfset var memberID = application.memberObj.memberSave(argumentCollection=arguments) />
		<cfset var PromotionGroupSuccess = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="8") />
		<cfset var qPromotion = application.villaObj.getPromotion(prm_id=arguments.prm_id) />
		
		<cfset var messageTotal = "" />
		
		<cfsaveContent variable="messageTotal">
			<cfoutput>
Name: #arguments.mem_firstname# #arguments.mem_surname#
Email: #arguments.mem_email#
Preferred Date: #arguments.preferredDate#
Preferred Time: #arguments.preferredTime#
Notes: #mes_body#
			</cfoutput>
		</cfsaveContent>

		<cfif len(arguments.mes_body)>
			<cfset messageSave = application.contactObj.messageSave(mem_id=memberID, mes_title="Spa Booking Request for #qPromotion.prm_title#", mes_body=messageTotal) />
		</cfif>

		<cfmail to="#application.feedbackEmail#" bcc="#application.adminEmail#" from="#application.feedbackEmail#" subject="Website Spa Booking Request for #qPromotion.prm_title#">
#messageTotal#
		</cfmail>
		
		<cfmail to="#arguments.mem_email#" from="#application.feedbackEmail#" bcc="#application.adminEmail#" subject="Spa Promotions inquiry at Luxe Spa">Dear #arguments.mem_firstName#,

Many thanks for booking a spa treatment with us at Luxe Spa at Sentosa Private Villas and Spa, Bali.

One of our spa reservations representatives will be in touch with you shortly to confirm the requested day and time for your spa treatment.

Please do not hesitate to contact us should you have any questions or special requests regarding your spa treatment.

With best regards,

The Sentosa Reservations Team
		</cfmail>

		<cfset promotionContactSuccess = 1 />

		<cfreturn promotionContactSuccess />

	</cffunction>

	<!--- Author: rafe - Date: 3/3/2010 --->
	<cffunction name="displayPromotions" output="false" access="public" returntype="string" hint="I show the promotions currently available for the website">
		
		<cfset var displayPromotions="" />
		<cfset var qPromotions = getPromotions() />
		<cfset var thisWidth="" />
		<cfset var getThisImage = "" />
		
		<cfsaveContent variable="displayPromotions">
			<cfoutput>
				<!--- 
				<hr style="margin-top:10px;margin-bottom:10px">
						 --->
				<cfloop query="qPromotions">
					
					<cfquery name="getThisImage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
						SELECT img_id, img_name
						FROM wwwImage
							INNER JOIN wwwPromotion_Image on img_id = pri_image
						WHERE pri_promotion = <cfqueryparam cfsqltype="cf_sql_integer" value="#qPromotions.prm_id#" list="false" />
							AND img_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="Promotion TN" list="false" />
					</cfquery>
					
					<cfif getThisImage.recordCount>
						<cfset thisWidth="440px" />
					<cfelse>
						<cfset thisWidth="650px" />
					</cfif>
					
					<div class="package_box">
					
			            <div class="package_img"><img src="#application.imagePath##getThisImage.img_name#" alt="" width="200" /></div>
			            
			            <div class="package_text">
				            
			            	<h3>#prm_title#</h3>
			              	
							<cfset endP = FindNoCase("</p>",prm_body) + 4 />
							#left(prm_body,endP)#
							
			            	<a href="##" class="booknow">BOOK NOW</a>
			            	
						</div>
						
					</div>
				       <!---    
					<div>
						<div style="float:right;width:#thisWidth#">		
							<h3><a href="#request.myself#rates.promotionView&prm_id=#prm_id#">#prm_title#</a></h3>
							
							<cfset endP = FindNoCase("</p>",prm_body) + 4 />
							#left(prm_body,endP)#
						
							<p><a href="#request.myself#rates.promotionView&prm_id=#prm_id#">Click here for more information.</a></p>
						</div>
						
				 		<cfif getThisImage.recordCount>
						 	<div style="float: left; padding-right:10px; width: 200px">
						 		<a href="#request.myself#rates.promotionView&prm_id=#prm_id#"><img src="#application.imagePath##getThisImage.img_name#" width="200" /></a>
							</div>
						</cfif>
					</div>
					
					<div class="clear"></div>
				
					<hr style="margin-top:10px;margin-bottom:10px"> --->
					
				</cfloop>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn displayPromotions />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/3/2010 --->
	<cffunction name="displayPromotion" output="false" access="public" returntype="string" hint="I return the selected promotion formatted for display">
		
		<cfargument name="prm_id" type="numeric" default="0" required="false" />
		<cfargument name="contactSuccess" type="boolean" default="0" required="false" />
		
		<cfset var displayPromotion = "" />
		<cfset var qPromotion = getPromotion(arguments.prm_id) />
		
		<cfsaveContent variable="displayPromotion">
			<cfoutput>
				
				<h3>#qPromotion.prm_title#</h3>

				<cfif arguments.contactSuccess is 0>
					
					<div>
						#qPromotion.prm_body#
					</div>

					<div class="clear"></div>
				
					<p>
						Contact us now to make a booking!
					</p>
				
					<cfoutput>
						
						<div class="formboxMain">
							<cfform action="index.cfm?fuseaction=rates.promotionView" name="spaForm">
								<input type="hidden" name="prm_id" value="#arguments.prm_id#" />
								<input type="hidden" name="prm_title" value="#qPromotion.prm_title#" />
								<h3>
									#qPromotion.prm_title#
								</h3>
								<p><label>Title</label><select><option>Mr</option><option>Mrs</option><option>Ms</option><option>Dr</option></select></p>
								<p><label>First Name*</label><cfinput required="yes" message="Please provide your first name." name="mem_firstName" type="text"></p>
								<p><label>Last Name*</label><cfinput required="yes" message="Please provide your last name." name="mem_surname" type="text"></p>
								<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" type="text" /></p>
								<p><label>Preferred Date:</label><cfinput type="text" name="preferredDate" /></p>
								<p><label>Preferred Time:</label><cfinput type="text" name="preferredTime" /></p>
								<p><label>Other Information</label><textarea name="mes_body"></textarea></p>
								<p class="btn_submit"><input type="submit" value="submit" name="save" /></p>
							</cfform>
						</div>
				
					</cfoutput>
				<cfelse>
					<strong>
						Thank you for contacting us regarding our promotion.
						<br /><br />
						We will be in touch to confirm our availability soon!
					</strong>
				</cfif>

			</cfoutput>
		</cfsaveContent>
		
		<cfreturn displayPromotion />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/3/2010 --->
	<cffunction name="displayPromotionGloryBox" output="false" access="public" returntype="string" hint="I make the glory box the image for the promotion">
		
		<cfargument name="prm_id" type="numeric" default="0" required="false" />
	
		<cfset var promotionGloryBox = "" />
		<Cfset var qPromotionImage = getPromotionImage(prm_id=arguments.prm_id, img_type="Promotion Glory") />
		
		<cfsaveContent variable="promotionGloryBox">
			<cfoutput>
				<img src='#application.imagePath##qPromotionImage.img_name#' />
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn promotionGloryBox />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/4/2010 --->
	<cffunction name="displayBookNowForm" output="false" access="public" returntype="string" hint="I return the form for a book now process">
		
		<cfargument name="beds" type="string" default="1" required="false" />
		<cfargument name="contactSuccess" type="boolean" default="0" required="false" />
		
		<cfset var bookNowForm = "" />
		
		<cfsaveContent variable="bookNowForm">
			<cfoutput>
						
				<cfif arguments.contactSuccess is 0>
									
					<div class="formboxMain">
						<cfform action="index.cfm?fuseaction=rates.bookNow" name="bookNowForm">
	
							<p>
								<label>Last Minute Offer</label>
								
								<select name="beds">
									<option <cfif arguments.beds is 1> selected</cfif>>1 Bedroom Pool Villa</option>
									<option <cfif arguments.beds is 2> selected</cfif>>2 Bedroom Pool Villa</option>
									<option <cfif arguments.beds is 3> selected</cfif>>3 Bedroom Royal Pool Villa</option>
									<option <cfif arguments.beds is 4> selected</cfif>>4 Bedroom Royal Pool Villa</option>
									<option <cfif arguments.beds is 5> selected</cfif>>5 Bedroom Presidential Pool Villa</option>
								</select>
							</p>
							
							<p><label>Title</label><select><option>Mr</option><option>Mrs</option><option>Ms</option><option>Dr</option></select></p>
							<p><label>First Name*</label><cfinput required="yes" message="Please provide your first name." name="mem_firstName" type="text"></p>
							<p><label>Last Name*</label><cfinput required="yes" message="Please provide your last name." name="mem_surname" type="text"></p>
							<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" type="text" /></p>
							<p><label>Phone</label><cfinput type="text" name="mem_homePhone" /></p>
							<p><label>Trip Information</label><textarea name="mes_body"></textarea></p>
							<p class="btn_submit"><input type="submit" value="submit" name="save" /></p>
							
						</cfform>
					</div>
				
				<cfelse>
					
						Thank you for contacting us regarding our last minute offers.
						<br /><br />
						We will be in touch to confirm our availability soon!
					
				</cfif>
				
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn bookNowForm />
		
	</cffunction>

	<!--- Author: Rafe - Date: 10/17/2009 --->
	<cffunction name="bookNowFormSave" output="false" access="public" returntype="any" hint="">

		<!--- <cfargument name="newsletterSignup" type="string" default="" required="false" /> --->

		<cfset var promotionContactSuccess = 0 />
		<cfset var memberID = application.memberObj.memberSave(argumentCollection=arguments) />
		<cfset var PromotionGroupSuccess = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="14") />
		
		<cfset var messageTotal = "" />
		
		<cfsaveContent variable="messageTotal">
			<cfoutput>
Last Minute Offer: #arguments.beds#
Name: #arguments.mem_firstname# #arguments.mem_surname#
Email: #arguments.mem_email#
Phone: #arguments.mem_homePhone#
Notes: #mes_body#
			</cfoutput>
		</cfsaveContent>

		<cfif len(arguments.mes_body)>
			<cfset messageSave = application.contactObj.messageSave(mem_id=memberID, mes_title="Last Minute Offer Booking Request for #arguments.beds#", mes_body=messageTotal) />
		</cfif>

		<cfmail to="#application.feedbackEmail#" bcc="#application.adminEmail#" from="#application.feedbackEmail#" subject="Last Minute Offer Booking Request for #arguments.beds#">
#messageTotal#
		</cfmail>
		
		<cfmail to="#arguments.mem_email#" from="#application.feedbackEmail#" bcc="#application.adminEmail#" subject="Last Minute Offer inquiry at Sentosa Private Villas & Spa, Bali">Dear #arguments.mem_firstName#,

Many thanks for your Last Minute Offer inquiry at Sentosa Private Villas and Spa.

One of our sales and reservations representatives will be in touch with you shortly to follow up on your request.

Please do not hesitate to contact us should you have any questions or special requests regarding your booking.

With best regards,

The Sentosa Reservations Team
		</cfmail>

		<cfset promotionContactSuccess = 1 />

		<cfreturn promotionContactSuccess />

	</cffunction>

	<!--- Author: rafe - Date: 3/13/2010 --->
	<cffunction name="getProperty" output="false" access="public" returntype="query" hint="I return a query with the given property">
		
		<cfargument name="pro_id" type="numeric" default="0" required="false" />
		
		<cfset var getProperty = "" />
		
		<cfquery name="getProperty" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT pro_id, pro_title, pro_description, pro_beds, pro_priceRange, pro_location, pro_active, pro_order, pro_gallery, pro_layout, pro_bullet1, pro_bullet2, pro_bullet3, pro_bullet4, pro_bullet5, pro_bullet6, pro_bullet7, pro_bullet8, pro_bullet9, pro_bullet10, pro_bullet11, pro_bullet12, pro_factSheet
			FROM property
			WHERE pro_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_id#" list="false" />
		</cfquery>
		
		<cfreturn getProperty />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/13/2010 --->
	<cffunction name="getProperties" output="false" access="public" returntype="query" hint="I return a query with the given property">
		
		<cfargument name="pro_active" type="boolean" default="0" required="false" />
		
		<cfset var getProperties = "" />
		
		<cfquery name="getProperties" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT pro_id, pro_title, pro_description, pro_beds, pro_priceRange, pro_location, pro_active, pro_order, pro_gallery, pro_layout, pro_bullet1, pro_bullet2, pro_bullet3, pro_bullet4, pro_bullet5, pro_bullet6, pro_bullet7, pro_bullet8, pro_bullet9, pro_bullet10, pro_bullet11, pro_bullet12, pro_factSheet
			FROM property
			
			<cfif arguments.pro_active is 1>
				WHERE pro_active = 1
			</cfif>
			
			ORDER BY pro_order, pro_title
		</cfquery>
		
		<cfreturn getProperties />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/13/2010 --->
	<cffunction name="displayPropertyForm" output="false" access="public" returntype="string" hint="I return the form for editing villas for sale">
		
		<cfargument name="pro_id" type="numeric" default="0" required="false" />
	
		<cfset var propertyForm = "" />
		<cfset var qProperty = getProperty(arguments.pro_id) />
		<cfset var qGalleries = application.imageObj.getGalleries(gal_type="Villa For Sale") />
		
		<cfsaveContent variable="propertyForm">
			<cfoutput>
				<table id="formTable">

					<cfform action="#request.myself#villa.villaSales" method="post" enctype="multipart/form-data">
			
						<input type="hidden" name="pro_id" value="#arguments.pro_id#" />
			
						<tr class="tableHeader">
							<td colspan='5'><div class="tableTitle">Villa For Sale</div></td>
						</tr>
			
						<tr>
							<td class="leftForm">Title</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfinput required="yes" message="Please enter a villa title." type="text" name="pro_title" value="#qProperty.pro_title#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Description</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
			
								<cfmodule template="#application.assetsPath#tiny_mce/tinyMCE.cfm"
								  instanceName="pro_description"
								  value="#qProperty.pro_description#"
								  width="600"
								  height="300"
								  toolbarset="Basic" />
			
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Price Range</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="pro_priceRange" value="#qProperty.pro_priceRange#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Beds</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfinput required="yes" validate="integer" message="Please enter a number for bedrooms." type="text" name="pro_beds" value="#qProperty.pro_beds#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Location</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="pro_location" value="#qProperty.pro_location#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Active</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="checkbox" name="pro_active" value="1"<cfif yesNoFormat(qProperty.pro_active)> checked</cfif>>
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			 
						<tr>
							<td class="leftForm">Order</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfinput required="yes" validate="integer" message="Please enter a number for order that this property should appear on the page." type="text" name="pro_order" value="#qProperty.pro_order#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Bullets</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="pro_bullet1" value="#qProperty.pro_bullet1#" style="width:250px" />
								<input type="text" name="pro_bullet2" value="#qProperty.pro_bullet2#" style="width:250px" /><br />
								<input type="text" name="pro_bullet3" value="#qProperty.pro_bullet3#" style="width:250px" />
								<input type="text" name="pro_bullet4" value="#qProperty.pro_bullet4#" style="width:250px" /><br />
								<input type="text" name="pro_bullet5" value="#qProperty.pro_bullet5#" style="width:250px" />
								<input type="text" name="pro_bullet6" value="#qProperty.pro_bullet6#" style="width:250px" /><br />
								<input type="text" name="pro_bullet7" value="#qProperty.pro_bullet7#" style="width:250px" />
								<input type="text" name="pro_bullet8" value="#qProperty.pro_bullet8#" style="width:250px" /><br />
								<input type="text" name="pro_bullet9" value="#qProperty.pro_bullet9#" style="width:250px" />
								<input type="text" name="pro_bullet10" value="#qProperty.pro_bullet10#" style="width:250px" /><br />
								<input type="text" name="pro_bullet11" value="#qProperty.pro_bullet11#" style="width:250px" />
								<input type="text" name="pro_bullet12" value="#qProperty.pro_bullet12#" style="width:250px" /><br />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Gallery</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<select name="pro_gallery" style="width:250px">
									<option value="0">-</option>
									<cfloop query="qGalleries">
										<option value="#gal_id#"<cfif qProperty.pro_gallery is gal_id> selected</cfif>>#gal_title#</option>
									</cfloop>
								</select>
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Layout</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfif len(qProperty.pro_layout)>
									<a href="#application.imagePath#villa/#qProperty.pro_layout#" target="_blank">Current Layout</a>
								</cfif>
								<input type="file" name="pro_layout" value="" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Fact Sheet</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfif len(qProperty.pro_factSheet)>
									<a href="#application.imagePath#villa/#qProperty.pro_factSheet#" target="_blank">Current Factsheet</a>
								</cfif>
								<input type="file" name="pro_factSheet" value="" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="formFooter" colspan="5">
								<input type="submit" value="Save" name="save" class="button" onMouseOver="this.className='buttonOver';" onMouseOut="this.className='button';">
							</td>
						</tr>
			
					</cfform>
			
				</table>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn propertyForm />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/13/2010 --->
	<cffunction name="adminPropertyList" output="false" access="public" returntype="string" hint="I return all the properties in a table for selecting and editing">
		
		<cfset var propertyList = "" />
		<cfset var qProperties = getProperties() />
		
		<cfsaveContent variable="propertyList">
			<cfoutput>
				<table id="dataTable">

					<tr class="tableHeader">
						<td colspan="4">
							<div class="tableTitle">Properties</div>
							<div class="showAll">#qProperties.recordCount# Records</div>
						</td>
					</tr>
			
					<tr>
						<th style="text-align:center;">ID</th>
						<th>Title</th>
						<th>Price</th>
						<th>Active</th>
					</tr>
			
					<cfloop query="qProperties">
			
						<tr <cfif currentRow mod 2 eq 0>class="darkData"<cfelse>class="lightData"</cfif>>
							<td align="center">#qProperties.pro_id#</td>
							<td><a href="#request.myself#villa.villaSales&pro_id=#qProperties.pro_id#">#qProperties.pro_title#</a></td>
							<td>#qProperties.pro_priceRange#</td>
							<td><cfif qProperties.pro_active>Yes<cfelse>No</cfif></td>
						</tr>
			
					</cfloop>
			
				</table>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn propertyList />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/13/2010 --->
	<cffunction name="propertySave" output="false" access="public" returntype="any" hint="I save the details about a villa for sale">
		
		<cfargument name="pro_active" type="boolean" default="0" required="false" />
		
		<cfset var updateProperty = "" />
		<cfset var addProperty = "" />
		<cfset var propertyLayout = "" />
		<cfset var propertyFactSheet = "" />
		
		<cfif len(arguments.pro_layout)>
			<cffile action="upload" filefield="pro_layout" destination="#application.imageUploadPath#villa/" nameconflict="makeUnique" accept="">
			<cfset propertyLayout = cffile.serverFile />
		</cfif>
	
		<cfif len(arguments.pro_factSheet)>
			<cffile action="upload" filefield="pro_factSheet" destination="#application.imageUploadPath#villa/" nameconflict="makeUnique" accept="">
			<cfset propertyFactSheet = cffile.serverFile />
		</cfif>
	
		<cfif arguments.pro_id gt 0>
			
			<cfquery name="updateProperty" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE property SET
					pro_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_title#" list="false" />,
					pro_description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_description#" list="false" />,
					pro_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.pro_active#" list="false" />,
					pro_priceRange = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_priceRange#" list="false" />,
					pro_location = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_location#" list="false" />,
					pro_gallery = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_gallery#" list="false" />,
					pro_beds = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_beds#" list="false" />,
					pro_order = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_order#" list="false" />,
					pro_bullet1 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet1#" list="false" />,
					pro_bullet2 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet2#" list="false" />,
					pro_bullet3 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet3#" list="false" />,
					pro_bullet4 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet4#" list="false" />,
					pro_bullet5 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet5#" list="false" />,
					pro_bullet6 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet6#" list="false" />,
					pro_bullet7 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet7#" list="false" />,
					pro_bullet8 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet8#" list="false" />,
					pro_bullet9 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet9#" list="false" />,
					pro_bullet10 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet10#" list="false" />,
					pro_bullet11 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet11#" list="false" />,
					pro_bullet12 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet12#" list="false" />
					
					<cfif len(propertyLayout)>
						, pro_layout = <cfqueryparam cfsqltype="cf_sql_varchar" value="#propertyLayout#" list="false" />
					</cfif>
					
					<cfif len(propertyFactSheet)>
						, pro_factSheet = <cfqueryparam cfsqltype="cf_sql_varchar" value="#propertyFactSheet#" list="false" />
					</cfif>
					
				WHERE pro_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_id#" list="false" />
			</cfquery>
			
		<cfelse>
		
			<cfquery name="addProperty" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO property (
					pro_title,
					pro_description,
					pro_active,
					pro_priceRange,
					pro_location,
					pro_gallery,
					pro_beds,
					pro_order,
					pro_bullet1,
					pro_bullet2,
					pro_bullet3,
					pro_bullet4,
					pro_bullet5,
					pro_bullet6,
					pro_bullet7,
					pro_bullet8,
					pro_bullet9,
					pro_bullet10,
					pro_bullet11,
					pro_bullet12
					
					<cfif len(propertyLayout)>
						, pro_layout
					</cfif>
					
					<cfif len(propertyFactSheet)>
						, pro_factSheet
					</cfif>
					
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_title#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_description#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.pro_active#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_priceRange#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_location#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_gallery#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_beds#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.pro_order#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet1#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet2#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet3#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet4#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet5#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet6#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet7#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet8#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet9#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet10#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet11#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pro_bullet12#" list="false" />
					
					<cfif len(propertyLayout)>
						, <cfqueryparam cfsqltype="cf_sql_varchar" value="#propertyLayout#" list="false" />
					</cfif>
					
					<cfif len(propertyFactSheet)>
						, <cfqueryparam cfsqltype="cf_sql_varchar" value="#propertyFactSheet#" list="false" />
					</cfif>
					
				)
			</cfquery>
		
		</cfif>
		
	</cffunction>

	<!--- Author: rafe - Date: 3/15/2010 --->
	<cffunction name="villasForSale" output="false" access="public" returntype="string" hint="I return the layout + content for the villas for sale">
		
		<cfset var villasForSale = "" />
		<cfset var qProperties = getProperties(pro_active=1) />
				
		<cfsaveContent variable="villasForSale">
			<cfoutput>

				<hr style="margin-top:10px;margin-bottom:10px">
				
				<cfloop query="qProperties">
					
					<cfset qGallery = application.imageObj.getGalleryImages(qProperties.pro_gallery) />
					
					<div style="width:380px; float: right;">
						<h3>#pro_title#</h3>
						#pro_description#
						<p>Bedrooms: #pro_beds# bedrooms</p>
						<p>Listed Price: #pro_priceRange#</p>
						<cfif len(pro_location)>
							<p>Location: #pro_location#</p>
						</cfif>
						
						<div style="float:right;width:180px">
							<ul>
								<cfif len(pro_bullet2)>
									<li>#pro_bullet2#</li>
								</cfif>
								<cfif len(pro_bullet4)>
									<li>#pro_bullet4#</li>
								</cfif>
								<cfif len(pro_bullet6)>
									<li>#pro_bullet6#</li>
								</cfif>
								<cfif len(pro_bullet8)>
									<li>#pro_bullet8#</li>
								</cfif>
								<cfif len(pro_bullet10)>
									<li>#pro_bullet10#</li>
								</cfif>
								<cfif len(pro_bullet12)>
									<li>#pro_bullet12#</li>
								</cfif>
							</ul>
						</div>
						
						<div style="width:180px">
							<ul>
								<cfif len(pro_bullet1)>
									<li>#pro_bullet1#</li>
								</cfif>
								<cfif len(pro_bullet3)>
									<li>#pro_bullet3#</li>
								</cfif>
								<cfif len(pro_bullet5)>
									<li>#pro_bullet5#</li>
								</cfif>
								<cfif len(pro_bullet7)>
									<li>#pro_bullet7#</li>
								</cfif>
								<cfif len(pro_bullet9)>
									<li>#pro_bullet9#</li>
								</cfif>
								<cfif len(pro_bullet11)>
									<li>#pro_bullet11#</li>
								</cfif>
							</ul>
						</div>
						<br />
						<p>
							<cfif len(pro_layout)>
								<a href="#application.imagePath#villa/#pro_layout#">View Villa Layout</a> | 
							</cfif>
							<cfif len(pro_factSheet)>
								<a href="#application.imagePath#villa/#pro_factSheet#">View Villa Factsheet</a> | 
							</cfif>
							<a href="mailto:villasales@balisentosa.com?subject=Villa Sales: #pro_title#">Send Email Enquiry</a>
						</p>
					</div>
					
					<script type="text/javascript">
					    $(function() {
					        $('##gallery#qProperties.pro_gallery# a').lightBox();
					    });
					</script>
					
					<div style="width:250px" id="gallery#qProperties.pro_gallery#">
						<cfloop query="qGallery">
							<cfif qGallery.currentRow eq 1>
								<a href="#application.imagePath#slideshow/#img_name#" title="#img_title#" rel="lightbox"><img src="#application.imagePath#slideshow/#img_name#" width="250" style="margin-bottom:5px;border-style:solid;border-width:1px;border-color:##8C6239" /></a>
							<cfelse>
								<a href="#application.imagePath#slideshow/#img_name#" title="#img_title#" rel="lightbox"><img src="#application.imagePath#slideshow/#img_name#" width="58" style="border-style:solid;border-width:1px;border-color:##8C6239" /></a>
							</cfif>
						</cfloop>
					</div>
					
					<div class="clear"></div>
				
					<hr style="margin-top:10px;margin-bottom:10px">
						
				</cfloop>
				
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn villasForSale />
		
	</cffunction>

</cfcomponent>


































