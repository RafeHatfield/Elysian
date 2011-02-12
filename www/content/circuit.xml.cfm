<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="display">

		<set name="attributes.page" value="home" overwrite="no" />
 
		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />
		
		<invoke object="application.contentObj" methodCall="gloryBox(page=attributes.page)" returnVariable="content.gloryBox" />

	</fuseaction>

	<fuseaction name="showImage">

		<set name="attributes.displayMode" value="noNav" overwrite="yes" />

		<invoke object="application.imageObj" methodcall="getImageByID(img_id)" returnVariable="qImage" />

		<do action="v_content.showImage" contentVariable="content.mainContent" append="yes" />

	</fuseaction>

	<fuseaction name="sitemap">
	
		<do action="v_content.displayContent" contentVariable="content.mainContent" append="yes" />

		<invoke object="application.contentObj" methodCall="displaySiteMap()" returnVariable="sitemap" />
		
		<set name="content.mainContent" value="#content.mainContent##sitemap#" overwrite="yes" />

	</fuseaction>

</circuit>