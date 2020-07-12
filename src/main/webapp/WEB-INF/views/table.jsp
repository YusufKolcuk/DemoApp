<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>HOME</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="assets/login/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="assets/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/login/css/main.css">
	
	
	<style type="text/css">
				table.blueTable {
			  font-family: "Arial Black", Gadget, sans-serif;
			  border: 6px solid #1C6EA4;
			  background-color: #EEEEEE;
			  width: 100%;
			  height: 200px;
			  text-align: left;
			  border-collapse: collapse;
			}
			table.blueTable td, table.blueTable th {
			  border: 4px solid #AAAAAA;
			  padding: 10px 2px;
			}
			table.blueTable tbody td {
			  font-size: 15px;
			}
			table.blueTable tr:nth-child(even) {
			  background: #D0E4F5;
			}
			table.blueTable thead {
			  background: #1C6EA4;
			  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  border-bottom: 2px solid #444444;
			}
			table.blueTable thead th {
			  font-size: 20px;
			  font-weight: bold;
			  color: #FFFFFF;
			  border-left: 2px solid #D0E4F5;
			}
			table.blueTable thead th:first-child {
			  border-left: none;
			}
			
			table.blueTable tfoot {
			  font-size: 8px;
			  font-weight: bold;
			  color: #FFFFFF;
			  background: #D0E4F5;
			  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  border-top: 2px solid #444444;
			}
			table.blueTable tfoot td {
			  font-size: 8px;
			}
			table.blueTable tfoot .links {
			  text-align: right;
			}
			table.blueTable tfoot .links a{
			  display: inline-block;
			  background: #1C6EA4;
			  color: #FFFFFF;
			  padding: 2px 8px;
			  border-radius: 5px;
			}
	</style>
</head>
<body>
		<center><B><h1>WEATHER FORECAST</h1></B></center>	
		 <a href="generate/excel.htm">Generate Excel</a>  
		
		<img alt="excel" src="assets/login/images/icons/excel.ico" width="100" height="100">
	
		<table class="blueTable">
				<thead>
				<tr>
				<th>City</th>
				<th>Minimum</th>
				<th>Maximum</th>
				</tr>
				</thead>
				<tfoot>
				<tr>
				<td colspan="3">
				<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
				</td>
				</tr>
				</tfoot>
				<tbody>
				<tr>
				<td>cell1_1</td><td>cell2_1</td><td>cell3_1</td></tr>
				<tr>
				<td>cell1_2</td><td>cell2_2</td><td>cell3_2</td></tr>
				<tr>
				<td>cell1_3</td><td>cell2_3</td><td>cell3_3</td></tr>
				<tr>
				<td>cell1_4</td><td>cell2_4</td><td>cell3_4</td></tr>
				<tr>
				<td>cell1_5</td><td>cell2_5</td><td>cell3_5</td></tr>
				<tr>
				<td>cell1_6</td><td>cell2_6</td><td>cell3_6</td></tr>
				<tr>
				<td>cell1_7</td><td>cell2_7</td><td>cell3_7</td></tr>
				<tr>
				<td>cell1_8</td><td>cell2_8</td><td>cell3_8</td></tr>
				<tr>
				<td>cell1_9</td><td>cell2_9</td><td>cell3_9</td></tr>
				<tr>
				<td>cell1_10</td><td>cell2_10</td><td>cell3_10</td></tr>
				</tbody>
				</tr>
		</table>
				
</body>
</html>