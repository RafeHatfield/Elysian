<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="newsletterForm">

		<if condition="isDefined('attributes.save')">
			<true>
				<invoke object="application.newsObj" methodcall="newsletterFormSave(argumentCollection=attributes)" returnVariable="attributes.newsletterSuccess" />
			</true>
		</if>

		<set name="attributes.newsletterSuccess" value="0" overwrite="no" />

		<!-- <invoke object="application.contentObj" methodcall="displayContent(fuseAction=attributes.fuseAction)" returnVariable="attributes.displayContentOutput" /> -->

		<invoke object="application.newsObj" methodcall="displayNewsletterForm(newsletterSuccess=attributes.newsletterSuccess)" returnVariable="attributes.newsletterFormOutput" />
<!-- 

		<set name="content.mainContent" value="#attributes.displayContentOutput##attributes.newsletterFormOutput#" />
 -->

		<set name="content.mainContent" value="#attributes.newsletterFormOutput#" />

	</fuseaction>

</circuit>