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
			input[type=text], select {
			  width: 100%;
			  padding: 12px 20px;
			  margin: 8px 0;
			  display: inline-block;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			  box-sizing: border-box;
			}
			
			input[type=submit] {
			  width: 100%;
			  background-color: #4CAF50;
			  color: white;
			  padding: 14px 20px;
			  margin: 8px 0;
			  border: none;
			  border-radius: 4px;
			  cursor: pointer;
			}
			
			input[type=submit]:hover {
			  background-color: #45a049;
			}
			
			div {
			  border-radius: 5px;
			  background-color: #f2f2f2;
			  padding: 20px;
			}
	</style>
	
</head>
<body>
	<center><B><h1>WEATHER FORECAST</h1></B></center>
		<a onclick="exportTableToExcel('excelTableData')">
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		
		</h1>
		<table class="blueTable" id="excelTableData">
		<thead>
				<th>id</th>
				<th>name</th>
				<th>temp</th>
				<th>temp_min</th>
				<th>temp_max</th>
				<th>pressure</th>
				<th>humidity</th>
				<th>key</th>
		</thead>
		<tbody>
			<c:forEach var="emp" items="${listEmp}" varStatus="status">
				<tr>
					<td>${emp.id}</td>
					<td>${emp.name}</td>
					<td>${emp.temp}</td>
					<td>${emp.tempMax}</td>
					<td>${emp.tempMin}</td>
					<td>${emp.humidity}</td>
					<td>${emp.pressure}</td>
					<td>${emp.key}</td>
				</tr>
			</c:forEach>
		</tbody>
				
			
		</table>
<script type="text/javascript">
function exportTableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}
</script>

		
</body>
</html>