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
<s:url id="rooms" action="buildingsList" namespace="/"/>
<s:a href="%{rooms}">BUILDINGS</s:a>

 <s:url id="devices" action="devicesList" namespace="/"/>
<s:a href="%{devices}">DEVICES</s:a>
		

<br/>