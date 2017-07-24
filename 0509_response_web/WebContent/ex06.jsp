<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width, initial-scale=1.0">
		<title>반응형 웹 : border-box</title>
		<style type="text/css">
			* {
				box-sizing: border-box;
			}
			.header {
				border: 1px solid red;
				padding: 15px;
			}
			[class*="col-"] {
				float: left;
				padding: 15px;
				border: 1px solid red;
			}
			.col-1 {width: 8.33%;}
			.col-2 {width: 16.66%;}
			.col-3 {width: 25%;}
			.col-4 {width: 33.33%;}
			.col-5 {width: 41.66%;}
			.col-6 {width: 50%;}
			.col-7 {width: 58.33%;}
			.col-8 {width: 66.66%;}
			.col-9 {width: 75%;}
			.col-10 {width: 83.33%;}
			.col-11 {width: 91.66%;}
			.col-12 {width: 100%;}
			/* "글꼴", 글꼴모음 */
			html{font-family: "Times", serif;}
			.header{
				background-color: #9933cc;
				color: #ffffff;
				padding: 15px;
			}
			.menu ul{
				list-style-type: none;
				margin: 0;
				padding: 0;
			}
			.menu li{
				padding: 8px;
				margin-bottom: 7px;
				background-color: #33b5e5;
				color: #ffffff;
				box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
			}
			.menu li:hover {
				background-color: #0099cc;
			}
		</style>
	</head>
	<body>
		<div class="header">
			<h1>Chania</h1>
		</div>
		<div class="row">
			<div class="col-5 menu">
				<ul>
					<li>The Flight</li>
					<li>The City</li>
					<li>The Island</li>
					<li>The Food</li>
				</ul>
			</div>
			<div class="col-7">
				<h1>The City</h1>
				<p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
				<p>Resize the browser window to see how the content respond to the resizing.</p>
			</div>
		</div>
	</body>
</html>