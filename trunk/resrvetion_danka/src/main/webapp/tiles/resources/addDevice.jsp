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
Add new device:
<s:form action="addNewDevice" namespace="/">

	<s:textfield label="Device name" key="device.deviceName"/>
	<s:submit/>
</s:form>
<br/>
<s:url id="showDevices" action="devicesList" namespace="/"/>
<s:a href="%{showDevices}">BACK</s:a>