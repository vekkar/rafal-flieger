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
Add new building:
<s:form action="addNewBuilding" namespace="/">

	<s:textfield label="Building name" key="building.buildingName"/>
	<s:submit/>
</s:form>
<br/>
<s:url id="showUsers" action="buildingsList" namespace="/"/>
<s:a href="%{showUsers}">BACK</s:a>
