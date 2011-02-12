<cfcomponent hint="I am the reservations function" output="false">

	<!--- Author: Rafe - Date: 9/26/2009 --->
	<cffunction name="displayReservationForm" output="false" access="public" returntype="string" hint="I return a variable that holds the reservation form.">

		<cfset var reservationForm = "" />

		<cfsaveContent variable="reservationForm">
		
			<cfoutput>
								
				<!--Start Date Select-->
				<script src="assets/globekey/globekeyJS.js" type="text/javascript" language="javascript"></script>

	            <h2>BOOK ONLINE</h2>

				<form name="DateSelect" action="http://www.globekey.com/reserve.php" method="POST" target="_self">

	                <p>
		                <label>Arrival:</label>
	               	 	<select class="select_1" name="fd" id="fd" onChange="updateDates(this.form);setWkd(this.form)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<select class="long select_2" name="fm" id="fm" size="1" onChange="updateDates(this.form);setWkd(this.form)">
							<option value="1">Jan</option>
							<option value="2">Feb</option>
							<option value="3">Mar</option>
							<option value="4">Apr</option>
							<option value="5">May</option>
							<option value="6">Jun</option>
							<option value="7">Jul</option>
							<option value="8">Aug</option>
							<option value="9">Sep</option>
							<option value="10">Oct</option>
							<option value="11">Nov</option>
							<option value="12">Dec</option>
						</select>
						<select class="longer select_3" name="fy" id="fy" size="1" onChange="updateDates(this.form);setWkd(this.form)">
							<script language="JavaScript" type="text/javascript">year_option();</script>
						</select>
						<script language="JavaScript" type="text/javascript">
						<!-- Display calendar for Arrival Date
						  calendarArrive = new dynCalendar("calendarArrive", "calendarCallback", numberYears, "DateSelect", imgDir);
						//-->
						</script>
	                    <!--- <select class="longer">
	                         <option>2010</option>
	                    </select><img src="/assets/images/icon_calender.png" alt="" width="16" height="16" />   --->
					</p>
	                <p>
		                <label>Depart:</label>
		                <select class="select_1" name="td" id="td" size="1" onChange="setWkd(this.form)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<select class="long select_2" name="tm" id="tm" size="1" onChange="setWkd(this.form)">
							<option value="1">Jan</option>
							<option value="2">Feb</option>
							<option value="3">Mar</option>
							<option value="4">Apr</option>
							<option value="5">May</option>
							<option value="6">Jun</option>
							<option value="7">Jul</option>
							<option value="8">Aug</option>
							<option value="9">Sep</option>
							<option value="10">Oct</option>
							<option value="11">Nov</option>
							<option value="12">Dec</option>
						</select>
						<select class="longer select_3" name="ty" id="ty" size="1" onChange="setWkd(this.form)">
							<script language="JavaScript" type="text/javascript">year_option();</script>
						</select><script language="JavaScript" type="text/javascript">
			            <!-- Display calendar for Departure Date
			              calendarDepart = new dynCalendar("calendarDepart", "calendarCallback", numberYears, "DateSelect", imgDir);
			            //-->
			            </script>

<!--- 	                    <select class="longer">
	                         <option>2010</option>
	                    </select><img src="/assets/images/icon_calender.png" alt="" width="16" height="16" /> --->  
					</p>
	                <p>								
		                <label>Adults:</label>
						<select class="short" name="adults" id="adults">
							<option >1</option>
							<option selected>2</option>
							<option >3</option>
							<option >4</option>
							<option >5</option>
							<option >6</option>
							<option >7</option>
							<option >8</option>
							<option >9</option>
							<option >10</option>
						</select>
						<label class="short">Children:</label>
						<select class="short" name="child" id="child">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option >3</option>
							<option >4</option>
							<option >5</option>
							<option >6</option>
							<option >7</option>
							<option >8</option>
							<option >9</option>
							<option >10</option>
						</select>
					</p>
					<p><input class="chck_availability btn" type="submit" name="availcheck" value="CHECK AVAILABILITY / BOOK" onClick="return checkDates(this.form)"></p>
	                <!--- <p><input type="submit" value="CHECK AVAILABILITY/BOOK NOW"  class="btn"/></p> --->
	                
					<input type="hidden" name="settings1" value="daysinAdvance=7;numberNights=2;numberYears=4;numberNightsMin=1;">
					<input type="hidden" name="settings2" value="wdDisplay=1;numberNightsDisplay=1;departDateDisplay=1;">
					<input type="hidden" name="sh" value="yes">
					<input type="hidden" name="lang" value="en">
					<input type="hidden" name="hid" value="DPS2031">
					

	           </form>
	           		
           		<script language="JavaScript">
				  LoadDates(document.DateSelect);
				</script>
	           
			</cfoutput>
			
		</cfsaveContent>

		<cfreturn reservationForm />

	</cffunction>

</cfcomponent>