<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="contactDetails">
	
		<if condition="isDefined('attributes.save')">
			<true>
				<invoke object="application.contactObj" methodcall="feedbackFormSave(argumentCollection=attributes)" returnVariable="attributes.feedbackFormSuccess" />
			</true>
		</if>
		
		<set name="attributes.feedbackFormSuccess" value="0" overwrite="no" />

<!--

		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />
 -->

		<invoke object="application.villaObj" methodcall="displayVillaAddress(attributes.feedbackFormSuccess)" returnVariable="attributes.VillaAddress" />

		<invoke object="application.contactObj" methodcall="displayFeedbackForm(attributes.feedbackFormSuccess)" returnVariable="attributes.feedbackForm" />

		<set name="content.mainContent" value="#attributes.VillaAddress##attributes.feedbackForm#" />

	</fuseaction>

	<fuseaction name="feedbackForm">

		<if condition="isDefined('attributes.save')">
		
			<true>
				<invoke object="application.contactObj" methodcall="feedbackFormSave(argumentCollection=attributes)" returnVariable="attributes.feedbackFormSuccess" />
				<set name="attributes.displayContentOutput" value="" overwrite="yes" />
			</true>
			
			<false>
				<invoke object="application.contentObj" methodcall="displayContent(fuseAction=attributes.fuseAction)" returnVariable="attributes.displayContentOutput" />
			</false>
			
		</if>

		<set name="attributes.feedbackFormSuccess" value="0" overwrite="no" />

		<invoke object="application.contactObj" methodcall="displayFeedbackForm(feedbackSuccess=attributes.feedbackFormSuccess)" returnVariable="attributes.displayFeedbackFormOutput" />

		<set name="content.mainContent" value="#attributes.displayContentOutput##attributes.displayFeedbackFormOutput#" />

	</fuseaction>
	
	<fuseaction name="unsubscribe">
	
		<set name="attributes.email" value="" overwrite="no" />
		
		<if condition="#len(attributes.email)#">
		
			<true>
				<invoke object="application.contactObj" methodCall="unsubscribe(#attributes.email#)" returnVariable="unsubscribeStatus" />
			</true>
			
			<false>
				<set name="unsubscribeStatus" value="0" overwrite="yes" />
			</false>
		
		</if>
		
		<invoke object="application.contactObj" methodCall="unsubscribeForm(unsubscribeStatus=#unsubscribeStatus#)" returnVariable="content.mainContent" />
	
	</fuseaction>


	<fuseaction name="googleMap">

		<set name="request.googleMap" value="1" overwrite="yes" />

		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />

		<do action="v_contact.googleMap" contentVariable="content.mainContent" append="yes" />

	</fuseaction>

	<fuseaction name="recruitForm">
	
		<invoke object="application.contactObj" methodcall="displayRecruitForm()" returnVariable="attributes.recruitForm" />
		
		<set name="content.mainContent" value="#attributes.recruitForm#" />

	</fuseaction>

</circuit>
