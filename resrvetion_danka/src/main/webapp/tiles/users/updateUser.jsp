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
Update user:
<s:form action="updateUserAction" namespace="/">
	<s:textfield label="User id"  readonly="true" key="user.id"/>
	<s:textfield label="User name"  key="user.username"/>
	<s:textfield label="User password"  key="user.password"/>
	<s:submit/>
</s:form>
<br/>

<s:url id="showUsers" action="showAllUsersAction" namespace="/"/>
<s:a href="%{showUsers}">BACK</s:a>