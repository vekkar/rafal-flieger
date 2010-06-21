<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>

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
<s:if test="%{sessionObject=='admin'}">
RESRVATION FILTER:
<sx:head/>
<s:form action="searchForReservation" namespace="/">

	<s:textfield label="wlasciciel rezerwacji(user id)" key="reservation.user.username"/>

	<sx:datetimepicker label="after" displayFormat="dd-MM-yyyy" 
	key="reservation.startDate" />
	<sx:datetimepicker  label="before" displayFormat="dd-MM-yyyy" 
	key="reservation.endDate" />
	<s:submit/>
</s:form>
<br/>
</s:if>
List of actual reservations: <br/>
<table cellpadding="5" cellspacing="5">
<th>id </th><th>name </th><th>end date </th><th>start date </th><th>user id </th><th>mark</th>

<s:iterator value="reservations" var="reservation">
<tr>
	<td> <s:property value="#reservation.id"/></td>
	<td> <s:property value="#reservation.reservationName"/></td>
	<td> <s:property value="#reservation.startDate"/></td>
	<td> <s:property value="#reservation.endDate"/></td>
	<td> <s:property value="#reservation.user.id"/></td>

	<s:url id="markResAsFinished" action="markResAsFinishedAction" namespace="/">
            <s:param name="reservation.id" value="#reservation.id" />    
        </s:url>       
        <td> <s:a href="%{markResAsFinished}">MARK AS FINISHED</s:a></td>

	<br/>
</s:iterator>

</tr>
</table>
<br/>
<br/>