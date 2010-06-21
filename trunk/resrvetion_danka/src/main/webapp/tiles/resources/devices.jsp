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
<b>List of actual devices:</b> <br/><br/>
<s:iterator value="devices" var="device">

	<s:property value="#device.deviceName"/>
		<div>
		<s:if test="%{sessionObject=='admin'}">	
			 <s:url id="deleteDevice" action="deleteDeviceAction" namespace="/">
	            <s:param name="device.id" value="#device.id" />    
	        </s:url>       
	        <s:a href="%{deleteDevice}">REMOVE</s:a>
	        
			 <s:url id="updateDevice" action="goToUpdateDeviceAction" namespace="/">
	            <s:param name="device.id" value="#device.id" />          
	        </s:url>
			<s:a href="%{updateDevice}">EDIT</s:a>
		</s:if>
		
		<s:if test="%{#device.free==1}">
				<s:url id="makeReservation" action="goToAddDeviceReservationAction" namespace="/">
		            <s:param name="device.id" value="#device.id" />          
		        </s:url>
				<s:a href="%{makeReservation}">RESERVE</s:a>
		</s:if>
		<s:else>
		  		 <b>Device reserved</b>
		</s:else>
		</div>
	<br/>
</s:iterator>
<s:if test="%{sessionObject=='admin'}">
	<br/>
	<br/>
	<s:url id="goToAddDevice" action="goToAddDeviceAction" namespace="/"/>
	<s:a href="%{goToAddDevice}">ADD NEW DEVICE</s:a>
</s:if>
<br/>