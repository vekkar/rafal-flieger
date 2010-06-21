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
<b>List of actual users:</b> <br/> <br/>
<s:iterator value="users" var="user">

	<s:property value="#user.username"/>
		<div>
		 <s:url id="deleteUser" action="deleteUserAction" namespace="/">
            <s:param name="user.id" value="#user.id" />    
        </s:url>       
        <s:a href="%{deleteUser}">REMOVE</s:a>
        
		 <s:url id="updateUser" action="goToUpdateUserAction" namespace="/">
            <s:param name="user.id" value="#user.id" />          
        </s:url>
		<s:a href="%{updateUser}">EDIT</s:a>
		</div>
	<br/>
</s:iterator>
<br/>
<br/>
<s:url id="goToAddUser" action="goToAddUserAction" namespace="/"/>
<s:a href="%{goToAddUser}">ADD NEW USER</s:a>

<br/>