<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{sessionObject=='admin'}">
   <div>
		<%@ include file="../admin.jsp"%>
   </div>
</s:if>
<s:else>
	<div>
  		<%@ include file="../user.jsp"%>
	</div>
</s:else>

<br/>
Update room:
<s:form action="updateRoomAction" namespace="/">
	<s:textfield label="Room id" readonly="true" key="room.id"/>
	<s:textfield label="Room name" key="room.roomName"/>
	<s:submit/>
</s:form>
<br/>
<s:url id="showRooms" action="buildingsList" namespace="/"/>
<s:a href="%{showRooms}">BACK</s:a>
