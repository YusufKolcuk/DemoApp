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
		
			
			#map {
		        height: 400px;  /* The height is 400 pixels */
		        width: 100%;  /* The width is the width of the web page */
		       }
	</style>
	
</head>
<body>
	<center><B><h1>WEATHER FORECAST</h1></B></center>
		 <a href="generate/excel.htm">Generate Excel</a>  
		  <a href="generate/pdf.htm">Generate Pdf</a>  
		 
		
		<a onclick="exportTableToExcel('excelTableData')">
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<input type="image" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50" id="btnExport" value="Export" />
		
		
		</h1>
		<table class="blueTable" id="excelTableData">
		<thead>
				<th>id</th>
				<th>name</th>
				<th>temp</th>
				<th>temp_max</th>
				<th>temp_min</th>
				<th>humidity</th>
				<th>pressure</th>
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
				</tr>
			</c:forEach>
		</tbody>
				
			
		</table>
		
		
	<div id="map"></div>
	<script>
	  var map;
	  function initMap() {
	    map = new google.maps.Map(
	        document.getElementById('map'),
	    {center: new google.maps.LatLng(38.020793, -121.887831), zoom: 8});

	    var icons = {
	            cloud: {
	              icon: 'assets/login/images/icons/wfimg.ico', 
	              
	            },
	            sunny: {
	                icon: 'assets/login/images/icons/sunny.ico', 
	                
	              },
	            rain: {
	                icon: 'assets/login/images/icons/rainn.ico', 
	                
	              },
	        };

	          var features = [
	            {
	               position: new google.maps.LatLng(53.551086, 9.993682),
	               type: 'rain'	               	               
	            }, {
	               position: new google.maps.LatLng(50.110924, 8.682127),
	               type: 'sunny'
	            }, {
	               position: new google.maps.LatLng(52.520008, 13.404954),
	               type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(48.856613, 2.352222),
	               type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(47.218372, -1.553621),
	               type: 'rain'
	            }, {
	               position: new google.maps.LatLng(40.249540, -3.827210),
	               type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(41.385063, 2.173404),
	               type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(30.267153, -97.743057),
	               type: 'sunny'
	           	}, {
	               position: new google.maps.LatLng(38.892062, -77.019912),
	               type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(39.951061, -75.16562),
	               type: 'rain'
	            }, {
	               position: new google.maps.LatLng(39.960339, -76.734668),
	               type: 'sunny'
	            },{
	               position: new google.maps.LatLng(37.128849, -84.083677),
	               type: 'rain'
	            }, {
	               position: new google.maps.LatLng(33.545948, 33.545948),
	               type: 'sunny'
	            },{
	               position: new google.maps.LatLng(41.673037, -72.945791),
	               type: 'cloud'
	            }
	           
	          ];

	// Create markers.
	    for (var i = 0; i < features.length; i++) {
	      var marker = new google.maps.Marker({
	        position: features[i].position,
	        icon: icons[features[i].type].icon,
	        map: map
	      });
	    };
	  }
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5j_YT2S6LASn412whtKYe6RdhkVCLfn0&callback=initMap"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>		
	
	
	
	
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script type="text/javascript">
    $("body").on("click", "#btnExport", function () {
        html2canvas($('#excelTableData')[0], {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500
                    }]
                };
                pdfMake.createPdf(docDefinition).download("weatherforecast.pdf");
            }
        });
    });
</script>
		
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