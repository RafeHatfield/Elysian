<cfoutput>

	<cfparam name="attributes.page" default="home" />

	#trim(application.contentObj.displayContent(page=attributes.page))#

</cfoutput>