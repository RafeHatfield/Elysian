<cfoutput>

	<table id="formTable">

		<form action="#myself##xfa.saveSystemSettings#" method="post">

			<tr class="tableHeader">
				<td colspan='5'><div class="tableTitle">System Settings</div></td>
			</tr>
			
			<input type="hidden" name="sys_approval" value="#attributes.sys_approval#" />
			<input type="hidden" name="sys_buildNumber" value="#attributes.sys_buildNumber#" />

			<tr>
				<td class="leftForm">Default Page Title</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					The Elysian Bali Villas, Seminyak - <input type="text" name="sys_pageTitle" value="#attributes.sys_pageTitle#" style='width:200px'>
					<br />
					<em>Note: you can only change the page title after the resort intro</em>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="leftForm">Default Meta Description</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<textarea name="sys_metaDescription" style="width: 400px">#attributes.sys_metaDescription#</textarea>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="leftForm">Default Meta Keywords</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<textarea name="sys_metaKeywords" style="width: 400px">#attributes.sys_metaKeywords#</textarea>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>
<!--- 
			<input type="hidden" name="sys_cta1" value="0" />
			<input type="hidden" name="sys_cta2" value="0" />
			<input type="hidden" name="sys_cta3" value="0" />
			<input type="hidden" name="sys_cta4" value="0" />
			 --->

			<tr>
				<td class="leftForm">Default CTA 1</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<select name="sys_cta1" style="width:400px">
						<option value="0">-</option>
						<cfloop query="qCTAs">
							<option value="#qCTAs.cta_id#"<cfif attributes.sys_cta1 is qCTAs.cta_id> selected</cfif>>#qCTAs.cta_title#</option>
						</cfloop>
					</select>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="leftForm">Default CTA 2</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<select name="sys_cta2" style="width:400px">
						<option value="0">-</option>
						<cfloop query="qCTAs">
							<option value="#qCTAs.cta_id#"<cfif attributes.sys_cta2 is qCTAs.cta_id> selected</cfif>>#qCTAs.cta_title#</option>
						</cfloop>
					</select>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="leftForm">Default CTA 3</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<select name="sys_cta3" style="width:400px">
						<option value="0">-</option>
						<cfloop query="qCTAs">
							<option value="#qCTAs.cta_id#"<cfif attributes.sys_cta3 is qCTAs.cta_id> selected</cfif>>#qCTAs.cta_title#</option>
						</cfloop>
					</select>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="leftForm">Default CTA 4</td>
				<td class="whiteGutter">&nbsp;</td>
				<td>
					<select name="sys_cta4" style="width:400px">
						<option value="0">-</option>
						<cfloop query="qCTAs">
							<option value="#qCTAs.cta_id#"<cfif attributes.sys_cta4 is qCTAs.cta_id> selected</cfif>>#qCTAs.cta_title#</option>
						</cfloop>
					</select>
				</td>
				<td class="whiteGutter">&nbsp;</td>
				<td class="rightForm">&nbsp;</td>
			</tr>

			<tr>
				<td class="formFooter" colspan="5">
					<input type="submit" value="Save" name='save' onMouseOver="this.className='buttonOver'" onMouseOut="this.className='button'" class="button">
				</td>
			</tr>

		</form>

	</table>

</cfoutput>