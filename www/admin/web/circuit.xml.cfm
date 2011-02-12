<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">
	
		
		<fuseaction name="contentForm" permissions="1,2,3,4,5|">
			<xfa name="saveContent" value="web.contentForm"/>
			
			<set name="attributes.con_id" overwrite="false" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="contentSave(argumentCollection=attributes)" object="application.contentObj"/>
					<relocate addtoken="false" type="client" url="#myself#web.contentList"/>
				</true>
			</if>
			 
			<invoke methodcall="getContent(con_id=attributes.con_id)" object="application.contentObj" returnVariable="qContent"/>
			<invoke methodcall="getContentParents()" object="application.contentObj" returnVariable="qContentParents"/>
			<invoke methodcall="getNonMenuParents()" object="application.contentObj" returnVariable="qNonMenuParents"/>
			<invoke methodcall="getContentImages(con_id=attributes.con_id)" object="application.imageObj" returnVariable="qOtherContentImages"/>
			
			<if condition="(#application.systemSettings.sys_approval# is 1 AND #listFind('1,2',cookie.prf_id)#) OR #application.systemSettings.sys_approval# is 0">
				<true>
					<set name="NewContentApproveState" value="1"/>
				</true>
				<false>
					<set name="NewContentApproveState" value="0"/>
				</false>
			</if>
			
			<if condition="qContent.recordCount gte 1">
			
				<true>
					<set name="attributes.con_menuTitle" value="#qContent.con_menuTitle#"/>
					<set name="attributes.con_title" value="#qContent.con_title#"/>
					<set name="attributes.con_intro" value="#qContent.con_intro#"/>
					<set name="attributes.con_body" value="#qContent.con_body#"/>
					<set name="attributes.con_isMenu" value="#qContent.con_isMenu#"/>
					<set name="attributes.con_menuArea" value="#qContent.con_menuArea#"/>
					<set name="attributes.con_menuOrder" value="#qContent.con_menuOrder#"/>
					<set name="attributes.con_parentID" value="#qContent.con_parentID#"/>
					<set name="attributes.con_active" value="#qContent.con_active#"/>
					<set name="attributes.con_type" value="#qContent.con_type#"/>
					<set name="attributes.con_childListType" value="#qContent.con_childListType#"/>
					<set name="attributes.con_approved" value="#qContent.con_approved#"/>
					<set name="attributes.con_link" value="#qContent.con_link#"/>
					<set name="attributes.con_metaDescription" value="#qContent.con_metaDescription#"/>
					<set name="attributes.con_metaKeywords" value="#qContent.con_metaKeywords#"/>
					<set name="attributes.img_id" value="#qContent.img_id#"/>
					<set name="attributes.img_name" value="#qContent.img_name#"/>
					<set name="attributes.img_title" value="#qContent.img_title#"/>
					<set name="attributes.img_altText" value="#qContent.img_altText#"/>
				</true>
				
				<false>
					<set name="attributes.con_menuTitle" value=""/>
					<set name="attributes.con_title" value=""/>
					<set name="attributes.con_intro" value=""/>
					<set name="attributes.con_body" value=""/>
					<set name="attributes.con_isMenu" value="0"/>
					<set name="attributes.con_menuArea" value="0"/>
					<set name="attributes.con_menuOrder" value="1"/>
					<set name="attributes.con_parentID" value="0"/>
					<set name="attributes.con_active" value="1"/>
					<set name="attributes.con_type" value="Content"/>
					<set name="attributes.con_childListType" value="0"/>
					<set name="attributes.con_approved" value="#NewContentApproveState#"/>
					<set name="attributes.con_link" value=""/>
					<set name="attributes.con_metaDescription" value=""/>
					<set name="attributes.con_metaKeywords" value=""/>
					<set name="attributes.img_id" value=""/>
					<set name="attributes.img_name" value=""/>
					<set name="attributes.img_title" value=""/>
					<set name="attributes.img_altText" value=""/>
				</false>
				
			</if>
			
			<invoke methodcall="getMenuAreas()" object="application.menuObj" returnVariable="qMenuAreas"/>
			<invoke methodcall="getGloryBoxes()" object="application.contentObj" returnVariable="qGloryBoxes"/>
			
			<do action="v_web.contentForm" append="yes" contentVariable="content.mainContent"/>
		</fuseaction>
	
		
		<fuseaction name="contentList" permissions="1,2,3,4,5|">
			<xfa name="editContent" value="web.contentForm"/>
			<xfa name="searchContent" value="web.contentList"/>
			
			<set name="attributes.mna_id" overwrite="false" value="0"/>
			<set name="attributes.searchContentType" overwrite="false" value="Content"/>
			<set name="attributes.searchMenuArea" overwrite="false" value="0"/>
			<set name="attributes.fastFind" overwrite="false" value=""/>
			
			<invoke methodcall="getMenuAreas()" object="application.menuObj" returnVariable="qMenuAreas"/>
			  
			<invoke methodcall="getAllContent(mna_id=attributes.mna_id,con_type=attributes.searchContentType,menuArea=attributes.searchMenuArea,fastFind=attributes.fastFind)" object="application.contentObj" returnVariable="qAllContent"/>
			
			<do action="v_web.contentSearchForm" append="yes" contentVariable="content.mainContent"/>
			
			<do action="v_web.contentList" append="yes" contentVariable="content.mainContent"/>
		</fuseaction>
	
		
		<fuseaction name="ctaList" permissions="1,2,3,4,5|">
			<set name="attributes.cta_id" overwrite="no" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="ctaSave(argumentCollection=attributes)" object="application.ctaObj"/>
				</true>
			</if>
			
			<invoke methodcall="displayCTAForm(cta_id=attributes.cta_id)" object="application.ctaObj" returnVariable="ctaForm"/>
			
			<invoke methodcall="displayCTAList(cta_id=attributes.cta_id)" object="application.ctaObj" returnVariable="ctaList"/>
			
			<set name="content.mainContent" overwrite="yes" value="#ctaForm##ctaList#"/>
		</fuseaction>
	
		
		<fuseaction name="galleryImagesForm" permissions="1,2,3,4,5|">
			<xfa name="saveGalleryImages" value="web.galleryImagesForm"/>
			
			<set name="attributes.gal_id" overwrite="no" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="galleryImagesSave(argumentCollection=attributes)" object="application.imageObj"/>
				</true>
			</if>
			 
			<invoke methodcall="getGalleryImages(gal_id=attributes.gal_id)" object="application.imageObj" returnVariable="qGalleryImages"/>
			
			<do action="v_web.galleryImagesForm" append="yes" contentVariable="content.mainContent"/> 
		</fuseaction>
	
		
		<fuseaction name="galleryList" permissions="1,2,3,4,5|">
			<set name="attributes.gal_id" overwrite="no" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="gallerySave(argumentCollection=attributes)" object="application.imageObj"/>
				</true>
			</if>
			
			<invoke methodCall="displayGalleryForm(gal_id=attributes.gal_id)" object="application.imageObj" returnVariable="galleryForm"/>
			
			<invoke methodCall="adminGalleryList()" object="application.imageObj" returnVariable="galleryList"/>
			
			<set name="content.mainContent" overwrite="yes" value="#galleryForm##galleryList#"/>
		</fuseaction>
	
		
		<fuseaction name="gloryBoxList" permissions="1,2,3,4,5|">
			<set name="attributes.gbx_id" overwrite="false" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="gloryBoxSave(argumentCollection=attributes)" object="application.contentObj"/>
					<set name="attributes.gbx_id" overwrite="true" value="0"/>
			 	</true>
			</if>
			
			<invoke methodcall="displayGloryBoxForm(attributes.gbx_id)" object="application.contentObj" returnVariable="gloryBoxForm"/>
			
			<invoke methodcall="displayGloryBoxList()" object="application.contentObj" returnVariable="gloryBoxList"/>
			
			<set name="content.mainContent" value="#gloryBoxForm##gloryBoxList#"/>
		</fuseaction>
	
		
		<fuseaction name="gloryMessage" permissions="1,2,3,4,5|">
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="gloryMessageSave(argumentCollection=attributes)" object="application.contentObj"/>
			 	</true>
			</if>
			
			<invoke methodcall="displayGloryMessageForm()" object="application.contentObj" returnVariable="content.mainContent"/>
		</fuseaction>
	
		
		<fuseaction name="menuAreaList" permissions="1,2,3,4,5|">
			<xfa name="saveMenuArea" value="web.menuAreaList"/>
			<xfa name="editMenuArea" value="web.menuAreaList"/>
			
			<set name="attributes.mna_id" overwrite="false" value="0"/>
			
			<if condition="isDefined('attributes.save')">
				<true>
					<invoke methodcall="menuAreaSave(argumentCollection=attributes)" object="application.menuObj"/>
				</true>
			</if>
			 
			<invoke methodcall="getMenuArea(attributes.mna_id)" object="application.menuObj" returnVariable="qMenuArea"/>
			
			<if condition="qMenuArea.recordCount gte 1">
				<true>
					<set name="attributes.mna_title" value="#qMenuArea.mna_title#"/>
					<set name="attributes.mna_active" value="#qMenuArea.mna_active#"/>
				</true>
				<false>
					<set name="attributes.mna_title" value=""/>
					<set name="attributes.mna_active" value="0"/>
				</false>
			</if>
			
			<do action="v_web.menuAreaForm" append="yes" contentVariable="content.mainContent"/>
			
			<invoke methodcall="getMenuAreas()" object="application.menuObj" returnVariable="qMenuAreas"/>
			
			<do action="v_web.menuAreaList" append="yes" contentVariable="content.mainContent"/>
		</fuseaction>
	
	</circuit>
