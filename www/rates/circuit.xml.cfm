<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="promotions">
	
		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />

		<invoke object="application.villaObj" methodcall="displayPromotions()" returnVariable="promotionsList" />
		
		<set name="content.mainContent" value="#content.mainContent##promotionsList#" overwrite="yes" />

	</fuseaction>

	<fuseaction name="promotionView">

		<set name="attributes.prm_id" value="0" overwrite="no" />
		<set name="attributes.contactSuccess" value="0" overwrite="no" />

		<if condition="isDefined('attributes.save')">
			<true>
				<invoke object="application.villaObj" methodCall="promotionContactSave(argumentCollection=attributes)" returnVariable="attributes.contactSuccess" />
			</true>
		</if>

		<invoke object="application.villaObj" methodcall="displayPromotion(prm_id=attributes.prm_id,contactSuccess=attributes.contactSuccess)" returnVariable="content.mainContent" />

		<invoke object="application.villaObj" methodcall="displayPromotionGloryBox(prm_id=attributes.prm_id)" returnVariable="content.gloryBox" />

	</fuseaction>

	<fuseaction name="bookNow">
	
		<set name="attributes.beds" value="1" overwrite="no" />
		<set name="attributes.contactSuccess" value="0" overwrite="no" />
		
		<if condition="isDefined('attributes.save')">
			<true>
				<invoke object="application.villaObj" methodCall="bookNowFormSave(argumentCollection=attributes)" returnVariable="attributes.contactSuccess" />
			</true>
		</if>
		
		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />
		
		<invoke object="application.villaObj" methodcall="displayBookNowForm(beds=attributes.beds,contactSuccess=attributes.contactSuccess)" returnVariable="bookNowForm" />
	
		<set name="content.mainContent" value="#content.mainContent##bookNowForm#" overwrite="yes" />
	
	</fuseaction>

</circuit>