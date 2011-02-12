<cfcomponent hint="I am the system settings function" output="false">

	<!--- Author: Rafe - Date: 10/7/2009 --->
	<cffunction name="displayFeedbackForm" output="false" access="public" returntype="string" hint="I display the feedback form">

		<cfargument name="feedbackSuccess" type="boolean" default="0" required="false" />

		<cfset var feedbackForm = "" />

		<cfoutput>

			<cfsaveContent variable="feedbackForm">
				
				<h3>Feedback Form</h3>

				<cfif yesNoFormat(arguments.feedbackSuccess)>

					<div>
						<p><strong>Thank you for contacting us.</strong></p>

						<p><strong>We will respond to your enqiry as soon as possible.</strong></p>
					</div>
					
				<cfelse>
				
					<p>To contact us electronically, please submit the on-line form. You will receive an immediate on-screen confirmation letting you know that we have received your questions, requests or comments. We will reply as soon as we can.</p>
	
					<p>Please note that all fields marked with the asterisk (*) are required fields.</p>
	
					<div class="formboxMain">
						<cfform action="index.cfm?fuseaction=contact.feedbackForm" name="newsletterForm">
							<p><label>Title</label><select><option>Mr</option><option>Mrs</option><option>Ms</option><option>Dr</option></select></p>
							<p><label>First Name*</label><cfinput required="yes" message="Please provide your first name." name="mem_firstName" type="text"></p>
							<p><label>Last Name*</label><cfinput required="yes" message="Please provide your last name." name="mem_surname" type="text"></p>
							<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" type="text" /></p>
							<p><label>Feedback</label><textarea name="mes_body"></textarea></p>
							<p class="btn_submit"><input type="submit" value="submit" name="save" /></p>
						</cfform>
					</div>

				</cfif>
					
			</cfsaveContent>

			<cfreturn feedbackForm />

		</cfoutput>

	</cffunction>

	<!--- Author: Rafe - Date: 10/7/2009 --->
	<cffunction name="feedbackFormSave" output="false" access="public" returntype="any" hint="I save the results of submitting the feedback form on the website">

		<cfset var memberID = "" />
		<cfset var addMemberGroup = "" />
		<cfset var memberGroup = "" />
		<cfset var feedbackSuccess = "0" />
		<cfset var messageID = "" />

			<cfset memberID = application.memberObj.memberSave(argumentCollection=arguments) />

			<cfset memberGroup = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="2") />

			<cfset messageID = messageSave(mem_id=memberID,mes_title="Website Feedback Form Submission",mes_body=arguments.mes_body) />

			<cfset feedbackEmail = messageEmail(mes_id=messageID,toEmail=application.feedbackEmail) />

			<cfset feedbackSuccess = "1" />
			
			<!--- send response --->
<!--- 
<cfmail to="#mem_email#" from="info@balisentosa.com" subject="Thanks for contacting Sentosa!" type="html">Dear #arguments.mem_firstName#,
Ê
Many thanks for sending us a message at Sentosa Private Villas and Spa.
Ê
Your email address has been recorded in our database and from time to time we will be sending you emails about Sentosa Private Villas and Spa, Bali including information on special offers and packages we have available.
Privacy is important to us and we will not sell, rent, or give your name or email address to anyone. At any point, you can select the link at the bottom of every email to unsubscribe from our mailing list.
Thanks again for your interest in Sentosa Private Villas and Spa, Bali. If you have any questions or comments, feel free to contact us.

Have a great day,

Sentosa Private Villas and Spa Team

<a href="#application.baseURL##request.myself#contact.unsubscribe&email=#arguments.mem_email#">Click here to unsubscribe</a>.
</cfmail>
 --->


		<cfreturn feedbackSuccess />

	</cffunction>

	<!--- Author: Rafe - Date: 10/7/2009 --->
	<cffunction name="messageSave" output="false" access="public" returntype="any" hint="I save the feedback message into the database">

		<cfargument name="mem_id" type="numeric" default="0" required="false" />
		<cfargument name="mes_title" type="string" default="" required="false" />
		<cfargument name="mes_body" type="string" default="" required="false" />

		<cfset var addMessage = "" />

		<cfquery name="addMessage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			INSERT INTO Message (
				mes_title,
				mes_body,
				mes_member
			) VALUES (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mes_title#" list="false" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mes_body#" list="false" />,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.mem_id#" list="false" />
			)
			SELECT SCOPE_IDENTITY() AS messageID
		</cfquery>

		<cfreturn addMessage.messageID />

	</cffunction>

	<!--- Author: Rafe - Date: 10/7/2009 --->
	<cffunction name="messageEmail" output="false" access="public" returntype="any" hint="I email the feedback message to the site feedback email address">

		<cfargument name="mes_id" type="numeric" default="" required="false" />
		<cfargument name="toEmail" type="string" default="" required="false" />

		<cfset var emailSuccess = "0" />
		<cfset var getMessage = "" />

		<cfif len(arguments.toEmail)>

			<cfquery name="getMessage" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				SELECT mes_title, mes_body, mes_member,
					mem_email
				FROM Message
					INNER JOIN Member on mes_member = mem_id
				WHERE mes_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.mes_id#" list="false" />
			</cfquery>

			<cfmail to="#arguments.toEmail#" bcc="#application.adminEmail#" from="#getMessage.mem_email#" subject="#getMessage.mes_title#">
				#mes_body#
			</cfmail>

		</cfif>

		<cfset emailSuccess = "1" />

		<cfreturn emailSuccess />

	</cffunction>

	<!--- Author: Rafe - Date: 11/9/2009 --->
	<cffunction name="displayFacilitiesForm" output="false" access="public" returntype="any" hint="">

		<cfargument name="facilitiesSuccess" type="boolean" default="0" required="false" />

		<cfset var facilitiesForm = "" />

		<cfoutput>

			<cfsaveContent variable="facilitiesForm">

				<cfif yesNoFormat(arguments.facilitiesSuccess)>

					<div>
						<p><strong>Thank you for contacting us.</strong></p>

						<p><strong>We will respond to your enqiry as soon as possible.</strong></p>
					</div>

				</cfif>

				<div align="center">

					<cfform name="feedbackForm" method="post" action="index.cfm?fuseaction=#arguments.fuseAction#" style="font-size: 1.2em;">

						<table style="border: medium none ;" border="0" cellpadding="0" cellspacing="6" width="400">

							<tbody>

								<tr>
									<td align="left"><strong>Title:</strong><br>
										<select name="mem_title" style="width: 300px;">
											<option value=""></option>
											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Miss">Miss</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</td>
								</tr>

								<tr>
									<td align="left"><strong>First Name*:</strong><br><cfinput required="yes" message="Please provide your first name." name="mem_firstName" style="width: 300px;" type="text"></td>
								</tr>

								<tr>
									<td align="left"><strong>Last Name*:</strong><br><cfinput required="yes" message="Please provide your last name." name="mem_surname" style="width: 300px;" type="text"></td>
								</tr>

								<tr>
									<td align="left"><strong>Email Address*:</strong><br><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" style="width: 300px;" type="text"></td>
								</tr>

								<tr>
									<td align="left"><strong>Requirements:</strong><br><textarea name="mes_body" style="width: 300px; height: 100px;"></textarea></td>
								</tr>

								<tr>
									<td align="left"><input value="Submit" name="save" style="width: 100px;" type="submit">&nbsp;<input value="Clear Form" style="width: 100px;" type="reset"></td>
								</tr>

							</tbody>

						</table>

					</cfform>

				</div>

			</cfsaveContent>

			<cfreturn facilitiesForm />

		</cfoutput>

	</cffunction>

	<!--- Author: Rafe - Date: 12/9/2009 --->
	<cffunction name="facilitiesFormSave" output="false" access="public" returntype="any" hint="">

		<cfset var memberID = "" />
		<cfset var addMemberGroup = "" />
		<cfset var memberGroup = "" />
		<cfset var feedbackSuccess = "0" />
		<cfset var messageID = "" />

		<!--- <cftry> --->

			<cfset memberID = application.memberObj.memberSave(argumentCollection=arguments) />

			<cfset memberGroup = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="10") />

			<cfset messageID = messageSave(mem_id=memberID,mes_title="Website Event Enquiry Form Submission",mes_body=arguments.mes_body) />

			<cfset facilitiesEmail = messageEmail(mes_id=messageID,toEmail=application.feedbackEmail) />

			<cfset feedbackSuccess = "1" />

		<!--- 	<cfcatch>
			</cfcatch>

		</cftry> --->

		<cfreturn feedbackSuccess />

	</cffunction>
	
	<!--- Author: Rafe - Date: 12/9/2009 --->
	<cffunction name="newsletterFormSave" output="false" access="public" returntype="any" hint="I save the results of submitting the feedback form on the website">

		<cfset var memberID = "" />
		<cfset var addMemberGroup = "" />
		<cfset var memberGroup = "" />
		<cfset var feedbackSuccess = "0" />
		<cfset var messageID = "" />

		<!--- <cftry> --->

			<cfset memberID = application.memberObj.memberSave(argumentCollection=arguments) />

			<cfset memberGroup = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="2") />

			<cfset messageID = messageSave(mem_id=memberID,mes_title="Newsletter Sign-up") />

			<cfset feedbackEmail = messageEmail(mes_id=messageID,toEmail=application.feedbackEmail) />

			<cfset feedbackSuccess = "1" />

		<!--- 	<cfcatch>
			</cfcatch>

		</cftry> --->

		<cfreturn feedbackSuccess />

	</cffunction>

	<!--- Author: rafe - Date: 2/15/2010 --->
	<cffunction name="miniNewsLetterSave" output="false" access="public" returntype="numeric" hint="I save the newsletter subscription from the home page with only an email address and return a var indicating success">
		
		<cfargument name="memberEmail" type="string" default="" required="false" />
		
		<cfset var saveSuccess = "0" />
		<cfset var checkMember = "" />
		<cfset var removeGroup = "" />
		<cfset var addGroup = "" />
		<cfset var addMember = "" />
		
		<cfif len(arguments.memberEmail) gt 5>
		
			<cfquery name="checkMember" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				SELECT mem_id
				FROM member
				WHERE mem_email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.memberEmail)#" list="false" />
			</cfquery>
			
			<cfif checkMember.recordCount>
				
				<cfquery name="removeGroup" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					DELETE FROM member_group
					WHERE mgr_member = <cfqueryparam cfsqltype="cf_sql_integer" value="#checkMember.mem_id#" list="false" />
						AND mgr_group = 1
				</cfquery>
				
				<cfquery name="addGroup" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO member_group (
						mgr_member,
						mgr_group
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_integer" value="#checkMember.mem_id#" list="false" />,
						1
					)
				</cfquery>
				
			<cfelse>
			
				<cfquery name="addMember" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO member (
						mem_email
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.memberEmail)#" list="false" />
					)
					SELECT SCOPE_IDENTITY() AS memberID
				</cfquery>
			
				<cfquery name="addGroup" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
					INSERT INTO member_group (
						mgr_member,
						mgr_group
					) VALUES (
						<cfqueryparam cfsqltype="cf_sql_integer" value="#addMember.memberID#" list="false" />,
						1
					)
				</cfquery>
				
			</cfif>
		
			<cfset saveSuccess = "1" />
		
		</cfif>
		
		<cfreturn saveSuccess />	
		
	</cffunction>

	<!--- Author: rafe - Date: 3/1/2010 --->
	<cffunction name="unsubscribe" output="false" access="public" returntype="string" hint="I unsubscribe a member based on email address">
		
		<cfargument name="email" type="string" default="" required="true" />
		
		<cfset var unsubscribe = "" />
		<cfset var unsubscribeCheck = "" />
		<cfset var unsubscribeStatus = "" />
		
		<!--- first check we have a member with this email address --->
		<cfquery name="unsubscribeCheck" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mem_id
			FROM member
			WHERE mem_email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" list="false" />
		</cfquery>
		
		<cfif unsubscribeCheck.recordCount>
			
			<cfquery name="unsubscribe" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE member SET
					mem_dnd = 1
				WHERE mem_email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#" list="false" />
			</cfquery>
			
			<cfset unsubscribeStatus = 1 />
			
		<cfelse>
			
			<cfset unsubscribeStatus = 0 />
			
		</cfif>
		
		<cfreturn unsubscribeStatus />
		
	</cffunction>

	<!--- Author: rafe - Date: 3/1/2010 --->
	<cffunction name="unsubscribeForm" output="false" access="public" returntype="string" hint="I provide a form to unsubscribe, or a message for a successful unsubscription.">
		
		<cfargument name="unsubscribeStatus" type="boolean" default="0" required="false" />
		
		<cfset var unsubscribeForm = "" />
		
		<cfsaveContent variable="unsubscribeForm">
			<cfoutput>
				<cfif arguments.unsubscribeStatus is 1>
					
					<h1>Unsubscribe Successful!</h1>
					
					<p>If at any time you wish to be part of our regular updates again, please sign up to our newsletter.</p>
					
				<cfelse>
				
					<h1>Unsubscribe</h1>
					
					<p>Please enter your email below and press the "Remove Me" button.</p>
					
					<div class="formboxMain">
						<cfform action="index.cfm?fuseaction=contact.unsubscribe" name="newsletterForm">
							<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="email" type="text" /></p>
							<p class="btn_submit"><input type="submit" value="remove me" name="save" /></p>
						</cfform>
					</div>
					
				</cfif>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn unsubscribeForm />
		
	</cffunction>

	<!--- Author: rafe - Date: 10/17/2010 --->
	<cffunction name="displayRecruitForm" output="false" access="public" returntype="string" hint="I return the recruitment form in an iframe">
		
		<cfset var recruitForm = "" />
		
		<cfsaveContent variable="recruitForm">
			<cfoutput>
				<iframe height="733" allowTransparency="true" frameborder="0" scrolling="no" style="width:100%;border:none"  src="http://balisentosa.wufoo.com/embed/z7x4a3/"><a href="http://balisentosa.wufoo.com/forms/z7x4a3/" title="Employment Application" rel="nofollow">Fill out my Wufoo form!</a></iframe>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn recruitForm />
		
	</cffunction>

</cfcomponent>















