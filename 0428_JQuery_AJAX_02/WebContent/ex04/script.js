// 자바스크립트가 너무 길어지면 더러우니까 파일로 따로 만든다.

var tableData = [
	{"name":"우유","price":"1000"},
	{"name":"음료수","price":"1200"},
	{"name":"커피","price":"500"},
	{"name":"차","price":"1500"}
];

$("#out").empty();
var table = "<table>"+
			"<thead><tr><th>제품명</th><th>가격</th></tr></thead>"+
			"<tbody>";
$.each(tableData,function(data){
	table += "<tr><td>"+this.name+"</td><td>"+this.price+"</td></tr>";
});
table += "</tbody></table>";
$("#out").append(table);