<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="navbar">
	<s:url id="resources" action="goToResourcesList" namespace="/"/>
	<s:a href="%{resources}">RESOURCES</s:a>
	<s:url id="reservations" action="goToReservationsList" namespace="/"/>
	<s:a href="%{reservations}">RESERVATION</s:a>
	<s:url id="index" action="logoutAction" namespace="/"/>
	<s:a href="%{index}">LOGOUT</s:a>
</div>