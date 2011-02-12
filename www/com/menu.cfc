<cfcomponent hint="I hold the menu functions" output="false">

	<!--- Author: Rafe - Date: 9/26/2009 --->
	<cffunction name="displayMenu" output="false" access="public" returntype="string" hint="I return the main menu for the site">

		<cfargument name="menuArea" type="numeric" default="1" required="true" />

		<cfset var menu = "" />
		<cfset var qMenu = getMenu(menuArea=arguments.menuArea,active=1) />
		<cfset var qSubMenu = getSubMenus() />
		<cfset var qThisSubMenu = "" />
		<cfset var subMenuCount = 1 />

		<cfsaveContent variable="menu">
			<cfoutput>
<!--- 				<ul class="menulist" id="listMenuRoot">
			      <li><a href="##">THE RESORT</a>
			        <ul>
			          <li><a href="##">1 bedroom villa</a></li>
			          <li><a href="##">2 bedroom villa</a></li>
			          <li><a href="##">Restaurant &amp; bar</a></li>
			          <li><a href="##">spa &amp; wellness</a></li>
			          <li><a href="##">facilities &amp; activities</a></li>
			          <li><a href="##">gallery</a></li>
			        </ul>
			      </li>
			      <li><a href="##">RATES</a></li>
			      <li><a href="##">PACKAGES</a></li>
			      <li><a href="##">MEDIA</a></li>
			      <li><a href="##">NEWS</a></li>
			      <li class="last"><a href="##">CONTACT</a></li>
			    </ul> --->

				<ul class="menulist" id="listMenuRoot">
				
					<cfloop query="qMenu">
					
						<li<cfif qMenu.recordCount is currentRow> class="last"</cfif>>
							<cfif qMenu.con_type is "Content" and not len(qMenu.con_fuseAction)>
								<a href="#request.myself#content.display&page=#qMenu.con_sanitise#">#ucase(qMenu.con_menuTitle)#</a>
							<cfelseif qMenu.con_type is "Content" and len(qMenu.con_fuseAction)>
								<a href="#request.myself##qMenu.con_fuseAction#&page=#qMenu.con_sanitise#">#ucase(qMenu.con_menuTitle)#</a>
							<cfelseif qMenu.con_type is "Link">
								<a href="#qMenu.con_link#">#ucase(qMenu.con_menuTitle)#</a>
							</cfif>
							
							<cfquery name="qThisSubMenu" dbType="query">
								SELECT *
								FROM qSubMenu
								WHERE con_parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#qMenu.con_id#" list="false" />
								ORDER BY con_menuOrder
							</cfquery>
							
							<cfif qThisSubMenu.recordCount>
								<ul>
									<cfloop query="qThisSubMenu">
										<li<cfif subMenuCount is 1> class="first"</cfif>>
											<cfif qThisSubMenu.con_type is "Content" and not len(qThisSubMenu.con_fuseAction)>
												<a href="#request.myself#content.display&page=#qThisSubMenu.con_sanitise#">#qThisSubMenu.con_menuTitle#</a>
											<cfelseif qThisSubMenu.con_type is "Content" and len(qThisSubMenu.con_fuseAction)>
												<a href="#request.myself##qThisSubMenu.con_fuseAction#&page=#qThisSubMenu.con_sanitise#">#qThisSubMenu.con_menuTitle#</a>
											<cfelseif qThisSubMenu.con_type is "Link">
												<a href="#qThisSubMenu.con_link#">#qThisSubMenu.con_menuTitle#</a>
											</cfif>
										</li>
										<cfset subMenuCount = 2 />
									</cfloop>
								</ul>
								<cfset subMenuCount = 1 />
							</cfif>
							
						</li>
						
					</cfloop>
					
				</ul>

			</cfoutput>
		</cfsaveContent>

		<cfreturn menu />

	</cffunction>

	<!--- Author: Rafe - Date: 9/27/2009 --->
	<cffunction name="getMenu" output="false" access="public" returntype="query" hint="I return all the items in the specified menu">

		<cfargument name="active" type="string" default="1" required="false" />
		<cfargument name="menuArea" type="string" default="" required="false" />

		<cfset var getMenu = "" />

		<cfquery name="getMenu" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mna_title, 
				con_id, con_fuseAction, con_menuTitle, con_sanitise, con_type, con_link, con_parentID
			FROM wwwContent
				INNER JOIN wwwMenuArea ON con_menuArea = mna_id
					AND con_menuArea IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.menuArea#" list="true" />)
			WHERE 1 = 1
				AND con_parentID = 0
				AND con_isMenu = 1
			
				<cfif yesNoFormat(arguments.active)>
					AND con_active = 1
				</cfif>
			
			ORDER BY mna_order, con_menuOrder
		</cfquery>

		<cfreturn getMenu />

	</cffunction>
	
	<!--- Author: rafe - Date: 2/13/2010 --->
	<cffunction name="getSubMenus" output="false" access="public" returntype="any" hint="">
		
		<cfset var getSubMenus = "" />
		
		<cfquery name="getSubMenus" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT con_id, con_fuseAction, con_menuTitle, con_sanitise, con_type, con_link, con_parentID, con_menuOrder
			FROM wwwContent
			WHERE con_parentID <> 0
				AND con_active = 1
				AND con_isMenu = 1
		</cfquery>
		
		<cfreturn getSubMenus />
		
	</cffunction>
	
	<!--- Author: rafe - Date: 12/6/2009 --->
	<cffunction name="getSubMenu" output="false" access="public" returntype="query" hint="I return a query with the corrent submenu displayed">
		
		<cfargument name="parentID" type="numeric" default="#val(request.qContent.con_parentID)#" required="false" />
		<cfargument name="contentID" type="numeric" default="#request.qContent.con_id#" required="false" />
	
		<cfset var getSubMenu = "" />
		
		<cfquery name="getSubMenu" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT con_id, con_fuseAction, con_menuTitle, con_sanitise, con_type, con_link, con_parentID
			FROM wwwContent
			WHERE (
				con_parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.parentID#" list="false" />
				OR 
				con_parentID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contentID#" list="false" />
			)
				AND con_parentID != 0
			ORDER BY con_menuOrder
		</cfquery>
		
		<cfreturn getSubMenu />
		
	</cffunction>

	<!--- Author: Rafe - Date: 9/27/2009 --->
	<cffunction name="displayMenuMenuArea" output="false" access="public" returntype="any" hint="">

		<cfargument name="menuArea" type="numeric" default="1" required="true" />
		<cfargument name="showMenuArea" type="boolean" default="1" required="false" />

		<cfset var menuMenuArea = "" />
		<cfset var qMenu = getMenu(menuArea=arguments.menuArea) />

		<cfsaveContent variable = "menuMenuArea">
			<cfif qMenu.recordCount>

				<cfoutput query="qMenu" group="mna_title">

					<cfif arguments.showMenuArea>
						<h2>#mna_title#</h2>
					</cfif>

					<ul>
						<cfoutput>
							<li>
								<cfif con_type is "Content" and not len(con_fuseAction)>
									<a href="#request.myself#content.display&page=#con_sanitise#">#con_menuTitle#</a>
								<cfelseif con_type is "Content" and len(con_fuseAction)>
									<a href="#request.myself##con_fuseAction#&page=#con_sanitise#">#con_menuTitle#</a>
								<cfelseif con_type is "Link">
									<a href="#con_link#">#con_menuTitle#</a>
								</cfif>
							</li>
						</cfoutput>
					</ul>

				</cfoutput>

			<cfelseif request.qContent.con_leftMenuArea is 10>

				<cfset qMenu = application.villaObj.getPromotions() />

				<cfif arguments.showMenuArea>
					<h2>Promotions</h2>
				</cfif>

					<ul>
						<cfoutput query="qMenu">

							<li>
								<a href="#request.myself#rates.promotionView&prm_id=#prm_id#">#prm_title#</a>
							</li>

						</cfoutput>

					</ul>

			</cfif>

		</cfsaveContent>

		<cfreturn menuMenuArea />

	</cffunction>

	<!--- Author: Rafe - Date: 10/2/2009 --->
	<cffunction name="getMenuArea" output="false" access="public" returntype="query" hint="I return the specific menu area">

		<cfargument name="mna_id" type="numeric" default="0" required="true" />

		<cfset var getMenuArea = "" />

		<cfquery name="getMenuArea" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mna_title, mna_active
			FROM wwwMenuArea
			WHERE mna_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.mna_id#" list="false" />
		</cfquery>

		<cfreturn getMenuArea />

	</cffunction>

	<!--- Author: Rafe - Date: 10/2/2009 --->
	<cffunction name="getMenuAreas" output="false" access="public" returntype="query" hint="I return the specific menu area">

		<cfset var getMenuAreas = "" />

		<cfquery name="getMenuAreas" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mna_id, mna_title, mna_active
			FROM wwwMenuArea
			ORDER BY mna_title
		</cfquery>

		<cfreturn getMenuAreas />

	</cffunction>

	<!--- Author: Rafe - Date: 10/02/2009 --->
	<cffunction name="getMenuItem" output="false" access="public" returntype="query" hint="I return all the items in the specified menu">

		<cfargument name="mnu_id" type="numeric" default="0" required="false" />

		<cfset var getMenuItem = "" />

		<cfquery name="getMenuItem" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mnu_title, mnu_fuseAction, mnu_order, mnu_active, mnu_menuArea
			FROM wwwMenu
			WHERE mnu_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.mnu_id#" list="false" />
			ORDER BY mnu_order
		</cfquery>

		<cfreturn getMenuItem />

	</cffunction>

	<!--- Author: Rafe - Date: 10/4/2009 --->
	<cffunction name="menuAreaSave" output="false" access="public" returntype="any" hint="I save the details about the menu area">

		<cfargument name="mna_active" type="boolean" default="0" required="false" />

		<cfset var updateMenuArea = "" />
		<cfset var addMenuArea = "" />

		<cfif arguments.mna_id gt 0>

			<cfquery name="updateMenuArea"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE wwwMenuArea SET
					mna_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mna_title#" list="false" />,
					mna_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.mna_active#" list="false" />
				WHERE mna_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.mna_id#" list="false" />
			</cfquery>

		<cfelse>

			<cfquery name="addMenuArea"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO wwwMenuArea	(
					mna_title,
					mna_active
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mna_title#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.mna_active#" list="false" />
				)
			</cfquery>

		</cfif>

	</cffunction>

	<!--- Author: rafe - Date: 12/6/2009 --->
	<cffunction name="displaySpecialOffersMenu" output="false" access="public" returntype="string" hint="I return the special offers menu">
		
		<cfset var specialOffersMenu = "" />
		
		<cfsaveContent variable="specialOffersMenu">
			<h2>SPECIAL OFFERS</h2>
			
	           <ul>
	               <li><a href="index.cfm?fuseaction=content.display&page=special-events">SPECIAL EVENTS</a></li>
	               <li><a href="index.cfm?fuseaction=content.display&page=promotions">PACKAGES</a></li>
	               <li><a href="index.cfm?fuseaction=rates.promotions&page=sentosa-promotions">PROMOTIONS</a></li>
	               <!--- <li><a href="index.cfm?fuseaction=content.display&page=specials">SPECIAL OFFERS</a></li> --->
	               <li><a href="index.cfm?fuseaction=content.display&page=stand-by-rates">STANDBY RATES</a></li>
	               <li><a href="##">BOOK NOW</a></li>
	           </ul>
		</cfsaveContent>
		
		<cfreturn specialOffersMenu />
		
	</cffunction>

	<!--- Author: rafe - Date: 12/12/2010 --->
	<cffunction name="displayFooterMenu" output="false" access="public" returntype="string" hint="I return the footer menu">
		
		<cfset var footerMenu = "" />
		
		<cfquery name="getFooterMenu" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT mna_title, 
				con_id, con_fuseAction, con_menuTitle, con_sanitise, con_type, con_link, con_parentID
			FROM wwwContent
				INNER JOIN wwwMenuArea ON con_menuArea = mna_id
					AND con_menuArea = 12
			WHERE 1 = 1
				AND con_parentID = 0
				AND con_isMenu = 1
				AND con_active = 1
			ORDER BY mna_order, con_menuOrder DESC
		</cfquery>
		
		<cfsaveContent variable="footerMenu">
			<cfoutput>
			    <ul id="footer_nav">
				    <cfloop query="getFooterMenu">
				        <li<cfif getFooterMenu.currentRow is getFooterMenu.recordCount> class="last"</cfif>>								
				        	<cfif getFooterMenu.con_type is "Content" and not len(getFooterMenu.con_fuseAction)>
								<a href="#request.myself#content.display&page=#getFooterMenu.con_sanitise#">#getFooterMenu.con_menuTitle#</a>
							<cfelseif getFooterMenu.con_type is "Content" and len(getFooterMenu.con_fuseAction)>
								<a href="#request.myself##getFooterMenu.con_fuseAction#&page=#getFooterMenu.con_sanitise#">#getFooterMenu.con_menuTitle#</a>
							<cfelseif getFooterMenu.con_type is "Link">
								<a href="#getFooterMenu.con_link#">#getFooterMenu.con_menuTitle#</a>
							</cfif>
						</li>
				    </cfloop>
			    </ul>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn footerMenu />
		
	</cffunction>


</cfcomponent>