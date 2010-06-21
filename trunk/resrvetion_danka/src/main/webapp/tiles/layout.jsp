<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<tiles:importAttribute/>
<html>
  <head>
      <title></title>
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta http-equiv="Expires" content="-1"/>
      <link rel="stylesheet" href="tiles/main.css" type="text/css"></link>
  </head>
  <body>
  	<div id="baner"></div>
	<div id="main">
		<tiles:insertAttribute name='body'/>
	</div>
  </body>
</html>