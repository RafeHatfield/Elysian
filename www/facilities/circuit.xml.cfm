<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="events">

		<if condition="isDefined('attributes.save')">
			<true>
				<invoke object="application.contactObj" methodcall="facilitiesFormSave(argumentCollection=attributes)" returnVariable="attributes.facilitiesFormSuccess" />
			</true>
		</if>

		<set name="attributes.facilitiesFormSuccess" value="0" overwrite="no" />

		<invoke object="application.contentObj" methodcall="displayContent(fuseAction=attributes.fuseAction)" returnVariable="attributes.displayContentOutput" />
<!-- 

		<invoke object="application.contactObj" methodcall="displayFacilitiesForm(facilitiesSuccess=attributes.facilitiesFormSuccess,fuseAction=attributes.fuseAction)" returnVariable="attributes.displayFacilitiesFormOutput" />

		<set name="content.mainContent" value="#attributes.displayContentOutput##attributes.displayFacilitiesFormOutput#" />
 -->

		<set name="content.mainContent" value="#attributes.displayContentOutput#" />

	</fuseaction>

</circuit>
