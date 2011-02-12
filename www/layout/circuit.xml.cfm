<?xml version="1.0" encoding="UTF-8"?>
<circuit access="public">

	<fuseaction name="choose">

		<set name="attributes.displayMode" value="nav" overwrite="no" />

		<if condition="attributes.displayMode eq 'nav'">

			<true>

				<do action="v_layout.header" contentVariable="content.header" append="yes" />
				<do action="v_layout.mainMenu" contentVariable="content.mainMenu" append="yes" />
				<do action="v_layout.gloryBox" contentVariable="content.gloryBox" append="yes" />
				<do action="v_layout.footer" contentVariable="content.footer" append="yes" />

				<include template="view/lay_template" />

			</true>

		</if>

		<if condition="attributes.displayMode eq 'noGlory'">

			<true>

				<do action="v_layout.header" contentVariable="content.header" append="yes" />
				<do action="v_layout.mainMenu" contentVariable="content.mainMenu" append="yes" />
				<do action="v_layout.footer" contentVariable="content.footer" append="yes" />

				<include template="view/lay_noGlory" />

			</true>

		</if>

		<if condition="attributes.displayMode eq 'noNav'">

			<true>

				<do action="v_layout.header" contentVariable="content.header" append="yes" />
				<do action="v_layout.footer" contentVariable="content.footer" append="yes" />

				<include template="view/lay_noNav" />

			</true>

		</if>

	</fuseaction>

</circuit>