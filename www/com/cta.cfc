<cfcomponent hint="I am the CTA function" output="false">

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="getCTA" output="false" access="public" returntype="query" hint="I return a query with the given cta">

		<cfargument name="cta_id" type="numeric" default="" required="true" />
		<cfargument name="cta_position" type="numeric" default="0" required="false" />
		<cfargument name="cta_active" type="boolean" default="1" required="false" />

		<cfset var getCTA = "" />
		<cfset var getSystemSettings = "" />

		<cfquery name="getCTA" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT TOP(1) cta_title, cta_link, cta_body, cta_linkText, cta_image, cta_active, cta_random, cta_position, cta_expiry
			FROM wwwCallToAction
			WHERE 1 = 1
			
				<cfif arguments.cta_id gt 0>
					AND cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_id#" list="false" />
				</cfif>
				
				<cfif arguments.cta_id is 0 AND arguments.cta_position is 0>
					AND 1 = 0
				</cfif>

				<cfif arguments.cta_position gt 0>
					AND cta_position = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_position#" list="false" />
					AND (cta_expiry IS NULL or cta_expiry > getDate())
				</cfif>
				
				<cfif arguments.cta_active is 1>
					AND cta_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.cta_active#" list="false" />
				</cfif>			
		</cfquery>
		
		<!--- if arguments.cta_position has been passed in and something has expired or there are no returns for whatever reason, we go check if there is site default for this position --->
		<cfif arguments.cta_position gt 0 AND getCTA.recordCount lte 0>
			
			<cfset getSystemSettings = application.systemObj.getSystemSettings() />

			<cfquery name="getCTA" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				SELECT top(1) cta_title, cta_link, cta_body, cta_linkText, cta_image, cta_active, cta_random, cta_position, cta_expiry
				FROM wwwCallToAction
				
				<cfif arguments.cta_position is 1>
					WHERE cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getSystemSettings.sys_cta1#" list="false" />
				<cfelseif  arguments.cta_position is 2>
					WHERE cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getSystemSettings.sys_cta2#" list="false" />
				<cfelseif  arguments.cta_position is 3>
					WHERE cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getSystemSettings.sys_cta3#" list="false" />
				<cfelse>
					WHERE cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getSystemSettings.sys_cta4#" list="false" />
				</cfif>
				
			</cfquery>
			
		</cfif>


		<cfreturn getCTA />

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="getCTAs" output="false" access="public" returntype="query" hint="I return a query with all the ctas">

		<cfset var getCTAs = "" />

		<cfquery name="getCTAs" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT cta_id, cta_title, cta_body, cta_linkText, cta_link, cta_image, cta_active, cta_random, cta_expiry
			FROM wwwCallToAction
			WHERE cta_active = 1
			ORDER BY cta_dateEntered DESC
		</cfquery>

		<cfreturn getCTAs />

	</cffunction>

	<!--- Author: Rafe - Date: 10/13/2009 --->
	<cffunction name="ctaSave" output="false" access="public" returntype="any" hint="i save the information for a cta">

		<cfargument name="cta_active" type="string" default="0" required="false" />

		<cfset var updateCTA = "" />
		<cfset var addCTA = "" />

		<cfset var imageInterpolation = "highQuality" />

		<cfset arguments.cta_active = yesNoFormat(arguments.cta_active) />

		<cfif len(arguments.cta_image)>

			<cffile action="upload" filefield="cta_image" destination="#application.imageUploadPath#" nameconflict="makeUnique" accept="image/png, image/gif, image/jpeg, image/jpg, image/pjpeg">

			<cfset FileName = cffile.serverFileName & '.' & cffile.serverFileExt />
			<cfset newFileName = cffile.serverFileName & '_cta.' & cffile.serverFileExt />

			<cfimage action="read" name="imageInMem" source="#application.imageUploadPath#/#FileName#" />

			<cfimage action="info" source="#imageInMem#" structName="ImageCR" />

			<cfset origWidth = imageCR.width />
			<cfset origHeight = imageCR.height />

			<cfset ImageSetAntialiasing(imageInMem) />

			<cfset ImageResize(imageInMem, "215", "", imageInterpolation) />

			<cfset ImageCrop(imageInMem, "0", "0", "215", "151") />

			<cfimage action="info" source="#imageInMem#" structName="ImageCR" />

			<cfset finalWidth = imageCR.width />
			<cfset finalHeight = imageCR.height />

			<cfimage source="#imageInMem#" action="write" destination="#application.imageUploadPath#/#newFileName#" overwrite="yes" />

		</cfif>
		
		<cfif listLen(arguments.cta_expiry,"/") is 3>
			<cfset arguments.cta_expiry = createDate(listGetAt(arguments.cta_expiry,3,'/'),listGetAt(arguments.cta_expiry,2,'/'),listGetAt(arguments.cta_expiry,1,'/')) />
		<cfelse>
			<cfset arguments.cta_expiry = "" />
		</cfif>



		<cfif arguments.cta_id gt 0>

			<cfquery name="updateCTA"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				UPDATE wwwCallToAction SET
					cta_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_title#" list="false" />,
					cta_body = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_body#" list="false" />,
					cta_link = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_link#" list="false" />,
					cta_linkText = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_linkText#" list="false" />,
					cta_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.cta_active#" list="false" />,
					cta_random = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.cta_random#" list="false" />,
					cta_position = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_position#" list="false" />
					
					<cfif isDate(arguments.cta_expiry)>
						, cta_expiry = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.cta_expiry#" list="false" />
					<cfelse>
						, cta_expiry = NULL
					</cfif>

					<cfif len(arguments.cta_image)>
						, cta_image = <cfqueryparam cfsqltype="cf_sql_varchar" value="#newFileName#" list="false" />
					</cfif>

				WHERE cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_id#" list="false" />
			</cfquery>

		<cfelse>

			<cfquery name="addCTA"  datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO wwwCallToAction	(
					cta_title,
					cta_body,
					cta_link,
					cta_linkText,
					cta_active,
					cta_random,
					cta_position
					
					<cfif isDate(arguments.cta_expiry)>
						, cta_expiry
					</cfif>

					<cfif len(arguments.cta_image)>
						, cta_image
					</cfif>

				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_title#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_body#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_link#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cta_linkText#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.cta_active#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.cta_random#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_position#" list="false" />
					
					<cfif isDate(arguments.cta_expiry)>
						, <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.cta_expiry#" list="false" />
					</cfif>

					<cfif len(arguments.cta_image)>
						, <cfqueryparam cfsqltype="cf_sql_varchar" value="#newFileName#" list="false" />
					</cfif>

				)
				SELECT SCOPE_IDENTITY() AS ctaID
			</cfquery>

			<cfset arguments.cta_id = addCTA.ctaID />

		</cfif>

	</cffunction>

	<!--- Author: Rafe - Date: 10/15/2009 --->
	<cffunction name="RandomCallToAction" returntype="string" output="false" hint="Returns a list of CallToActionIDs on a selected number of random Call To Actions">

		<cfargument name="Quantity" type="numeric" default="1"/>
		<cfargument name="ExcludeIDs" type="string" default=""/>

		<cfset var temp = StructNew()/>
		<cfset var i = "" />

		<cfquery name="temp.qAllCallToActions" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT cta_id, cta_image, cta_title, cta_link
			FROM wwwCallToAction
			WHERE cta_active = 1

				<cfif ListLen(arguments.ExcludeIDs)>
					AND cta_id NOT IN (
						<cfqueryparam cfsqltype="cf_sql_integer" value="#ListChangeDelims(arguments.ExcludeIDs, ',')#" list="true">
					)
				</cfif>

		</cfquery>

		<cfset temp.Result = ""/>

		<cfloop from="1" to="#temp.qAllCallToActions.RecordCount#" index="i">

			<cfset temp.TestCTAID = temp.qAllCallToActions.cta_id[RandRange(1, temp.qAllCallToActions.recordCount)]/>

			<cfif not listFind(temp.Result, temp.TestCTAID)>
				<cfset temp.Result = listAppend(temp.Result, temp.TestCTAID)/>
			</cfif>

			<cfif ListLen(temp.Result) gte Min(arguments.Quantity, temp.qAllCallToActions.recordCount)>
				<cfbreak/>
			</cfif>

		</cfloop>

		<cfreturn temp.Result/>

	</cffunction>

	<!--- Author: Rafe - Date: 10/15/2009 --->
	<cffunction name="getCallToAction" returntype="query" output="false">

		<cfargument name="cta_id" type="numeric" default="" required="true" />

		<cfset var getCallToAction = "" />

		<cfquery name="getCallToAction" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT cta_id, cta_image, cta_title, cta_link
			FROM wwwCallToAction
			WHERE cta_active = 1
				AND cta_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cta_id#" list="false">
		</cfquery>

		<cfreturn getCallToAction />

	</cffunction>

	<!--- Author: rafe - Date: 2/13/2010 --->
	<cffunction name="displayCTAForm" output="false" access="public" returntype="string" hint="I return a form for editing / adding a CTA ">
		
		<cfargument name="cta_id" type="numeric" default="0" required="false" />
	
		<cfset var ctaForm = "" />
		<cfset var qCTA = getCTA(arguments.cta_id) />
		
		<cfsaveContent variable="ctaForm">
			
			<cfoutput>
				
				<table id="formTable">

					<form action="#request.myself#web.ctaList" method="post" enctype="multipart/form-data">
			
						<input type="hidden" name="cta_id" value="#arguments.cta_id#" />
			
						<tr class="tableHeader">
							<td colspan='5'><div class="tableTitle">CTA</div></td>
						</tr>
			
						<tr>
							<td class="leftForm">CTA Title</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="cta_title" value="#qCTA.cta_title#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Copy</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
			
								<cfmodule template="#application.assetsPath#tiny_mce/tinyMCE.cfm"
								  instanceName="cta_body"
								  value="#qCTA.cta_body#"
								  width="400"
								  height="150"
								  toolbarset="Basic" />
			
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>

						<tr>
							<td class="leftForm">Link Text</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="cta_linkText" value="#qCTA.cta_linkText#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Link</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="cta_link" value="#qCTA.cta_link#" style="width:250px" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Active</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="checkbox" name="cta_active" value="1"<cfif yesNoFormat(qCTA.cta_active)> checked</cfif>>
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Expiry (d/m/yyyy)</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="text" name="cta_expiry" value="<cfif isDate(qCTA.cta_expiry)>#dateFormat(qCTA.cta_expiry,'d/m/yyyy')#</cfif>" />
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
						
						<input type="hidden" name="cta_random" value="0" />
			<!--- 
						<tr>
							<td class="leftForm">Include in Random?</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<input type="checkbox" name="cta_random" value="1"<cfif yesNoFormat(qCTA.cta_random)> checked</cfif>>
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			 --->
						<tr>
							<td class="leftForm">Position</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<select name="cta_position" style="width:250px">
									<cfloop from="1" to="4" index="thisCount">
										<option value="#thisCount#"<cfif thisCount is qCTA.cta_position> selected</cfif>>#thisCount#</option>
									</cfloop>
								</select>
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="leftForm">Image</td>
							<td class="whiteGutter">&nbsp;</td>
							<td>
								<cfif len(qCTA.cta_image) gt 0>
									<img src="#application.imagePath##qCTA.cta_image#" />
									<br />
								</cfif>
								<input type="file" name="cta_image" value="" style="width:250px">
							</td>
							<td class="whiteGutter">&nbsp;</td>
							<td class="rightForm">&nbsp;</td>
						</tr>
			
						<tr>
							<td class="formFooter" colspan="5">
								<input type="submit" value="Save" name="save" class="button" onMouseOver="this.className='buttonOver';" onMouseOut="this.className='button';">
							</td>
						</tr>
			
					</form>
			
				</table>
				
			</cfoutput>
			
		</cfsaveContent>
		
		<cfreturn ctaForm />
		
	</cffunction>

	<!--- Author: rafe - Date: 2/13/2010 --->
	<cffunction name="displayCTA" output="false" access="public" returntype="string" hint="I return a string with the CTA ">
		
		<cfargument name="cta_id" type="numeric" default="0" required="false" />
		<cfargument name="cta_position" type="numeric" default="0" required="false" />
	
		<cfset var displayCTA = "" />
		<cfset var qCTA = getCTA(arguments.cta_id,arguments.cta_position) />
		
		<cfsaveContent variable="displayCTA">
			<cfoutput>
				<cfloop query="qCTA">
					<a href="#qCTA.cta_link#"><h3>#ucase(qCTA.cta_title)#</h3></a>
					<a href="#qCTA.cta_link#"><img src="#application.imagePath##qCTA.cta_image#" alt="#qCTA.cta_title#" width="215" height="151" /></a>
					#qCTA.cta_body#
					<p><a href="#qCTA.cta_link#">#qCTA.cta_linkText#</a></p>
				</cfloop>				
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn displayCTA />
		
	</cffunction>

	<!--- Author: rafe - Date: 2/13/2010 --->
	<cffunction name="displayCTAList" output="false" access="public" returntype="string" hint="I display a list of the CTA's in the system">
		
		<cfset var qCTAs = getCTAs() />
		<cfset var ctaList = "" />
		
		<cfsaveContent variable="ctaList">
			
			<cfoutput>
				
				<table id="dataTable">

					<tr class="tableHeader">
						<td colspan="4">
							<div class="tableTitle">CTAs</div>
							<div class="showAll">#qCTAs.recordCount# Records</div>
						</td>
					</tr>
			
					<tr>
						<th style="text-align:center;">ID</th>
						<th>Title</th>
						<th>Link</th>
						<th>Active</th>
						<!--- <th>Random</th> --->
					</tr>
			
					<cfloop query="qCTAs">
			
						<tr <cfif currentRow mod 2 eq 0>class="darkData"<cfelse>class="lightData"</cfif>>
							<td align="center">#qCTAs.cta_id#</td>
							<td><a href="#request.myself#web.ctaList&cta_id=#qCTAs.cta_id#">#qCTAs.cta_title#</a></td>
							<td>#qCTAs.cta_link#</td>
							<td><cfif qCTAs.cta_active>Yes<cfelse>No</cfif></td>
							<!--- <td><cfif qCTAs.cta_random>Yes<cfelse>No</cfif></td> --->
						</tr>
			
					</cfloop>
			
				</table>
				
			</cfoutput>
			
		</cfsaveContent>
		
		<cfreturn ctaList />
		
	</cffunction>

</cfcomponent>


































