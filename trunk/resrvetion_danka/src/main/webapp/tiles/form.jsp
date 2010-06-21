<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<br/>

<s:form action="helloAction" namespace="/">
	<s:textfield label="User name: " key="user.username"/>
	<s:password label="User password: "key="user.password"/>
	<s:submit label="Log in"/>
</s:form>