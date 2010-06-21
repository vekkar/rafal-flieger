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
<b>List of actual buildings:</b> <br/><br/>
<s:iterator value="buildings" var="building">

	<s:property value="#building.buildingName"/>
	<div>
		<s:if test="%{sessionObject=='admin'}">
			 <s:url id="deleteBuilding" action="deleteBuildingAction" namespace="/">
	            <s:param name="building.id" value="#building.id" />    
	        </s:url>       
	      	  <s:a href="%{deleteBuilding}">REMOVE</s:a>
			 <s:url id="updateBuilding" action="goToUpdateBuildingAction" namespace="/">
	            <s:param name="building.id" value="#building.id" />          
	        </s:url>
				<s:a href="%{updateBuilding}">EDIT</s:a>
			
			 <s:url id="goToAddRoom" action="goToAddRoomAction" namespace="/">
	            <s:param name="building.id" value="#building.id" />          
	        </s:url>
				<s:a href="%{goToAddRoom}">ADD NEW ROOM</s:a>
		</s:if>
		
		 <s:url id="roomsList" action="roomsList" namespace="/">
            <s:param name="building.id" value="#building.id" />          
        </s:url>
			<s:a href="%{roomsList}">SEE ROOMS</s:a>
		</div>
	<br/>
</s:iterator>
<br/>
<s:if test="%{sessionObject=='admin'}">
	<br/>
	<s:url id="goToAddBuilding" action="goToAddBuildingAction" namespace="/"/>
	<s:a href="%{goToAddBuilding}">ADD NEW BUILDING</s:a>
</s:if>
<br/>