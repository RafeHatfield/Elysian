<cfcomponent hint="I am the news functions" output="false">

	<!--- Author: Rafe - Date: 10/5/2009 --->
	<cffunction name="displayNewsletterForm" output="false" access="public" returntype="string" hint="I display the newsletter form">

		<cfargument name="newsletterSuccess" type="boolean" default="0" required="false" />

		<cfset var newsForm = "" />

		<cfoutput>

			<cfsaveContent variable="newsForm">
		
				<h3>NEWSLETTER SIGN-UP</h3>

				<p>
					Register with us today to receive our regular newsletter, featuring all the latest deals at Sentosa and other information.
				</p>

				<div class="formboxMain">
					<cfform action="index.cfm?fuseaction=news.newsletterForm" name="newsletterForm">
						<p><label>Title</label><select><option>Mr</option><option>Mrs</option><option>Ms</option><option>Dr</option></select></p>
						<p><label>First Name*</label><cfinput required="yes" message="Please provide your first name." name="mem_firstName" style="width: 300px;" type="text"></p>
						<p><label>Last Name*</label><cfinput required="yes" message="Please provide your last name." name="mem_surname" style="width: 300px;" type="text"></p>
						<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" style="width: 300px;" type="text" /></p>
						<p class="btn_submit"><input type="submit" value="submit" name="save" /></p>
					</cfform>
				</div>
						
			</cfsaveContent>

			<cfreturn newsForm />

		</cfoutput>

	</cffunction>

	<!--- Author: Rafe - Date: 10/6/2009 --->
	<cffunction name="newsletterFormSave" output="false" access="public" returntype="any" hint="I save the results of submitting the newsletter sign up form">

		<cfset var addNewsletterSignup = "" />
		<cfset var memberID = "" />
		<cfset var addMemberGroup = "" />
		<cfset var newsletterSuccess = "0" />

		<cfset memberID = application.memberObj.memberSave(argumentCollection=arguments) />

		<cfset memberGroup = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="1") />

		<cfset newsletterSuccess = application.memberObj.memberGroupSave(mem_id=memberID, grp_id="1") />

		<cfreturn newsletterSuccess />

	</cffunction>

</cfcomponent>