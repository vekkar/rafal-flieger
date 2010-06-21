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
Add new reservation:
<sx:head/>
Available free resources, click to add to reservation:
<br/>

<s:form action="addNewDeviceReservation" namespace="/">

<sx:datetimepicker name="reservation.startDate" label="Start day (dd-MM-yyyy)" displayFormat="dd-MM-yyyy" 
	key="reservation.startDate" />
<sx:datetimepicker name="reservation.endDate" label="End day (dd-MM-yyyy)" displayFormat="dd-MM-yyyy" 
	key="reservation.endDate" />
	<s:textfield label="Device id" readonly="true" key="device.id"/>
	<s:textfield label="Reservation name"  key="reservation.reservationName"/>
	<s:submit/>
</s:form>
<br/>
<br/>
<s:url id="showDevices" action="devicesList" namespace="/"/>
<s:a href="%{showDevices}">BACK</s:a>