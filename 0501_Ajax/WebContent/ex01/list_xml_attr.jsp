<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<members>
	<c:forEach var="k" items="${list}" varStatus="vs">
		<member>
			<idx>${vs.count}</idx>
			<id>${k.id}</id>
			<pwd>${k.pwd}</pwd>
			<name>${k.name}</name>
			<age>${k.age}</age>
			<addr>${k.addr}</addr>
		</member>
	</c:forEach>
</members>