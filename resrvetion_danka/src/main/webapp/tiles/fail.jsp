<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

You are not allowed to view this resource.
Please  
<s:url id="redirectUser" action="indexAction" namespace="/"/>
<s:a href="%{redirectUser}">Log in</s:a>