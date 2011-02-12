<cfoutput>

<!--- 	<div align="center">

		<form name="frmFeedback" method="post" action="">
			 --->
						<div class="formbox">
							<cfform>
								<p><label>Title</label><select><option>Mr</option><option>Mrs</option><option>Ms</option><option>Dr</option></select></p>
								<p><label>First Name*</label><cfinput required="yes" message="Please provide your first name." name="mem_firstName" style="width: 300px;" type="text"></p>
								<p><label>Last Name*</label><cfinput required="yes" message="Please provide your last name." name="mem_surname" style="width: 300px;" type="text"></p>
								<p><label>Email Address*</label><cfinput validate="email" required="yes" message="Please enter a valid email address" name="mem_email" style="width: 300px;" type="text" /></p>
								<p class="btn_submit"><input type="submit" value="submit" /></p>
							</cfform>
						</div>
<!--- 			<table style="border: medium none ;" border="0" cellpadding="0" cellspacing="6" width="400">

				<tbody>

					<tr>
						<td align="left">
							<strong>Title*:</strong>

							<br>

							<select name="mem_title" style="width: 300px;">
								<option value=""></option>
								<option value="Mr">Mr</option>
								<option value="Mrs">Mrs</option>
								<option value="Miss">Miss</option>
								<option value="Ms">Ms</option>
								<option value="Dr">Dr</option>
							</select>
						</td>
					</tr>

					<tr>
						<td align="left"><strong>First Name*:</strong><br><input name="mem_firstName" style="width: 300px;" type="text"></td>
					</tr>

					<tr>
						<td align="left"><strong>Last Name*:</strong><br><input name="mem_surname" style="width: 300px;" type="text"></td>
					</tr>

					<tr>
						<td align="left"><strong>Email Address*:</strong><br><input name="mem_email" style="width: 300px;" type="text"></td>
					</tr>

					<tr>
						<td align="left"><input value="Submit" name="save" style="width: 100px;" type="submit">&nbsp;<input value="Clear Form" style="width: 100px;" type="reset"></td>
					</tr>

				</tbody>

			</table> --->

<!--- 		</form>

	</div> --->

</cfoutput>