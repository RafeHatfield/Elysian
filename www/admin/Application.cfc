<cfcomponent name="Application" extends="fusebox5.Application" output="false">

	<cfscript>
		this.name="elyAdmin_ii";
		this.sessionManagement = true;
		this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
	</cfscript>

	<!--- enable debugging --->
	<cfif listFind(cgi.SERVER_NAME,'local','.')>
		<cfset FUSEBOX_PARAMETERS.debug = true />
	</cfif>
	
	<cfset FUSEBOX_PARAMETERS.mode = "development-full-load" />

	<!--- force the directory in which we start to ensure CFC initialization works: --->
	<cfset FUSEBOX_CALLER_PATH = getDirectoryFromPath(getCurrentTemplatePath()) />

	<cfset application.rootPath = "/" />
	<cfset application.rootDir = GetDirectoryFromPath(GetTemplatePath()) />

	<cfsetting requesttimeout="60" />

	<cffunction name="onApplicationStart" returntype="boolean" output="false" access="public" hint="I am executed when the application starts">

		<cfset application.path = ExpandPath('/')>

		<!--- development --->
		<cfif listFindNoCase(cgi.SERVER_NAME,"local",".")>

			<cfset application.imageUploadPath = application.path & "assets/images/upload/" />
			<cfset application.downloadPath = application.path & "assets/download/" />
			<cfset application.flashUploadPath = application.path & "assets/flash/" />

			<cfset application.baseURL = "http://local.elysian.local/" />
			<cfset application.DBDSN = "elysianDSN" />
			<cfset application.DBUserName = "sa" />
			<cfset application.DBPassword = "g3t0ut" />
			
			<cfset application.wwwURL = "http://" & cgi.server_name & "/" />
			<cfset application.adminURL = "http://" & cgi.server_name & "/admin/" />

			<cfset application.assetsPath = "/assets/" />
			<cfset application.flashPath = "/assets/flash/" />
			<cfset application.imagePath = "/assets/images/upload/" />
			<cfset application.imagePathBase = "/assets/images/" />

			<cfset application.reservationObj = createObject( 'component', 'elysian.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'elysian.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'elysian.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'elysian.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'elysian.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'elysian.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'elysian.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'elysian.com.contact' ) />
			<cfset application.systemObj = createObject( 'component', 'elysian.com.system' ) />
			<cfset application.ctaObj = createObject( 'component', 'elysian.com.cta' ) />


		<cfelseif listFindNoCase(cgi.SERVER_NAME,"temppublish",".")>

			<cfset application.imageUploadPath = application.path & "assets\images\upload\" />
			<cfset application.downloadPath = application.path & "assets\download\" />
			<cfset application.flashUploadPath = application.path & "assets\flash\" />

			<cfset application.baseURL = "http://theelysian.temppublish.com/" />
			<cfset application.DBDSN = "elysianDSN" />
			<cfset application.DBUserName = "elydbUser" />
			<cfset application.DBPassword = "TheElysian2010" />

			<cfset application.wwwURL = "http://" & cgi.server_name & "/balisentosa/" />
			<cfset application.adminURL = "http://" & cgi.server_name & "/balisentosa/admin/" />

			<cfset application.assetsPath = "/assets/" />
			<cfset application.flashPath = "/assets/flash/" />
			<cfset application.imagePath = "/assets/images/upload/" />
			<cfset application.imagePathBase = "/assets/images/" />

			<cfset application.reservationObj = createObject( 'component', 'elysianH211909.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'elysianH211909.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'elysianH211909.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'elysianH211909.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'elysianH211909.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'elysianH211909.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'elysianH211909.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'elysianH211909.com.contact' ) />
			<cfset application.systemObj = createObject( 'component', 'elysianH211909.com.system' ) />
			<cfset application.ctaObj = createObject( 'component', 'elysianH211909.com.cta' ) />

		<cfelse>
		<!--- live --->
			<cfset application.imageUploadPath = application.path & "assets\images\upload\" />
			<cfset application.downloadPath = application.path & "assets\download\" />
			<cfset application.flashUploadPath = application.path & "assets\flash\" />

			<cfset application.baseURL = "http://www.theelysian.com/" />
			<cfset application.DBDSN = "elysianDSN" />
			<cfset application.DBUserName = "elydbUser" />
			<cfset application.DBPassword = "TheElysian2010" />
			<cfset application.wwwURL = "http://" & cgi.server_name & "/" />
			<cfset application.adminURL = "http://" & cgi.server_name & "/admin/" />

			<cfset application.assetsPath = "/assets/" />
			<cfset application.flashPath = "/assets/flash/" />
			<cfset application.imagePath = "/assets/images/upload/" />
			<cfset application.imagePathBase = "/assets/images/" />

			<cfset application.reservationObj = createObject( 'component', 'elysianH211909.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'elysianH211909.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'elysianH211909.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'elysianH211909.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'elysianH211909.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'elysianH211909.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'elysianH211909.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'elysianH211909.com.contact' ) />
			<cfset application.systemObj = createObject( 'component', 'elysianH211909.com.system' ) />
			<cfset application.ctaObj = createObject( 'component', 'elysianH211909.com.cta' ) />


		</cfif>

		<cfset application.imageStandardWidth = "240" />

		<cfinclude template="system/model/act_createCircuits.cfm" />

		<cfset super.onApplicationStart() />

		<cfset application.systemSettings = application.systemObj.getSystemSettings() />

		<cfreturn True />

	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean" output="false" access="public" hint="I am executed at the start of each request">

		<cfargument name="targetPage" />

		<cfset super.onRequestStart(argumentCollection=arguments) />

		<cfif StructKeyExists(URL, "appReload")>
			<!--- reinitialise the application scope --->
			<cfset onApplicationStart() />
		</cfif>

		<cfset tickBegin = GetTickCount()>

		<!--- these vars are used in the layout files --->
		<cfparam name='request.styleSheetList' default='' />
		<cfparam name='request.jsList' default='' />
		<cfparam name='request.bodyParams' default='' />
		<cfparam name='request.footerJS' default='' />

		<cfset request.pathInfo = cgi.script_name & cgi.path_info />

		<cfset request.TinyMCEIncluded="false"/>
		<cfset request.url = "http://" & cgi.http_host />

		<cfset tickBegin = GetTickCount()>
<!---

		<cfparam name="url.circuitRewrite" default='0' />

		<cfif url.circuitRewrite is 1>
			<cfinclude template="system/model/act_createCircuits.cfm" />
		</cfif>
 --->

		<cfif ListFirst(attributes.fuseaction,".") neq "login" AND (not isDefined("cookie.usr_id"))>
			<cflocation url="#myself#login.form&gotofa=#attributes.fuseaction#" addtoken="no" />
		</cfif>

		<cfreturn True />

	</cffunction>

	<cffunction name="onRequestEnd" returntype="void" output="true" access="public" hint="I am executed when all pages in the request have finished processing">

		<cfargument name="targetPage" />
		<!--- Pass request to Fusebox. --->
		<cfset super.onRequestEnd(arguments.targetPage) />

		<cfset tickEnd = GetTickCount()>
		<cfset executionTime = tickEnd - tickBegin>
		<cfoutput>executionTime: #executionTime# ms</cfoutput>

	</cffunction>

</cfcomponent>