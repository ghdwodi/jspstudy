<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="k" begin="0" end="${list.size()-2}" step="1" varStatus="vs">
	{"idx":${k.idx},"id":${k.id},"name":${k.name},"pwd":${k.pwd},"age":${k.age},"addr":${k.addr}},
</c:forEach>
<c:forEach var="k" begin="${list.size()-1}" end="${list.size()-1}" step="1" varStatus="vs">
	{"idx":${k.idx},"id":${k.id},"name":${k.name},"pwd":${k.pwd},"age":${k.age},"addr":${k.addr}},
</c:forEach>
]