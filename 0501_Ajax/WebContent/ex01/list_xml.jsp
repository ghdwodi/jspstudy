<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<members>
	<c:forEach var="k" items="${list}" varStatus="vs">
		<member idx="${k.idx}" id="${k.id}" pwd="${k.pwd}" name="${k.name}" age="${k.age}" addr="${k.addr}"></member>
	</c:forEach>
</members>