<br /><br />

<cfparam name="attributes.emailsOnly" default="0" />

<cfoutput>

	<table id="dataTable">
		<cfif not attributes.emailsOnly>
			<tr class="tableHeader">
				<td colspan="4">
					<div class="tableTitle">Member List #attributes.emailsOnly#</div>
					<div class="showAll">#qMembers.recordCount# Records</div>
				</td>
			</tr>
	
			<tr>
				<th style="text-align:center;">ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Communication</th>
			</tr>
	
			<cfloop query='qMembers'>
	
				<tr <cfif currentRow mod 2 eq 0>class="darkData"<cfelse>class="lightData"</cfif>>
					<td align="center"><a href="#myself##xfa.editMember#&mem_id=#mem_id#">#mem_id#</a></td>
					<td><a href="#myself##xfa.editMember#&mem_id=#mem_id#">#mem_title# #mem_firstName# #mem_surname#</a></td>
					<td>#mem_email#</td>
					<td>
						<cfif val(messageCount) gt 0>
							<a href="#myself##xfa.memberMessages#&mem_id=#mem_id#">View Communication</a>
						<cfelse>
							-
						</cfif>
					</td>
				</tr>
	
			</cfloop>
			
		<cfelse>
			
			<tr class="tableHeader">
				<td>
					<div class="tableTitle">Email List</div>
					<div class="showAll">#qMembers.recordCount# Records</div>
				</td>
			</tr>
			
			<tr>
				<th>If you use this for a mail out, <strong>make sure</strong> you put this list into the "bcc" field</th>
			</tr>
			
			<tr>
				<td><cfloop query='qMembers'><cfif len(trim(mem_email)) and findNoCase("@",mem_email) and mem_dnd neq 1>#mem_email#<cfif qMembers.currentRow neq qMembers.recordCount>, </cfif></cfif></cfloop></td>
			</tr>
			
		</cfif>
	</table>

</cfoutput>
