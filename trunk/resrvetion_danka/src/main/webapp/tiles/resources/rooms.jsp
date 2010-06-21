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
<b>List of actual rooms:</b> <br/> <br/>
<s:iterator value="rooms" var="room">

	<s:property value="#room.roomName"/>
		<div>
		<s:if test="%{sessionObject=='admin'}">	
			 <s:url id="deleteRoom" action="deleteRoomAction" namespace="/">
	            <s:param name="room.id" value="#room.id" />    
	        </s:url>       
	        <s:a href="%{deleteRoom}">REMOVE</s:a>
	        
			 <s:url id="updateRoom" action="goToUpdateRoomAction" namespace="/">
	            <s:param name="room.id" value="#room.id" />          
	        </s:url>
			<s:a href="%{updateRoom}">EDIT</s:a>
		</s:if>
		
		<s:if test="%{#room.free==1}">
				<s:url id="makeReservation" action="goToAddRoomReservationAction" namespace="/">
		            <s:param name="room.id" value="#room.id" />          
		        </s:url>
				<s:a href="%{makeReservation}">RESERVE</s:a>
		</s:if>
		<s:else>
		  	 <b>Room reserved</b>
		</s:else>
		</div>
	<br/>
</s:iterator>

<br/>
<s:url id="showRooms" action="buildingsList" namespace="/"/>
<s:a href="%{showRooms}">BACK</s:a>