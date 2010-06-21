<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{user.username=='admin'}">
   <div>
		<%@ include file="admin.jsp"%>
   </div>
</s:if>
<s:else>
	<div>
  		<%@ include file="user.jsp"%>
	</div>
</s:else>
<br/><br/>
You have successfuly loged in.
