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
			
		
			
			#map {
		        height: 1000px;  /* The height is 400 pixels */
		        width: 100%;  /* The width is the width of the web page */
		       }
		       
		  
	</style>
	
</head>
<body>
	<center><B><h1>WEATHER FORECAST</h1></B></center>
	<!--
		  <a href="generate/excel.htm">Generate Excel</a>  
		  <a href="generate/pdf.htm">Generate Pdf    </a>  
	
		<a onclick="exportTableToExcel('excelTableData')">
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<input type="image" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50" id="btnExport" value="Export" />
	-->
		<a href="generate/excel.htm">
			<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<a href="generate/pdf.htm">
			<img alt="excel" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
		</a>
		
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
			<c:forEach var="city" items="${cities}" varStatus="status">
				<tr>
					<td>${city.id}</td>
					<td>${city.name}</td>
					<td>${city.temp}</td>
					<td>${city.tempMax}</td>
					<td>${city.tempMin}</td>
					<td>${city.humidity}</td>
					<td>${city.pressure}</td>
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
	    {center: new google.maps.LatLng(38.020793, -121.887831), zoom: 4});

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
	        	/*  
	        	  for (var i = 0; i < 13; i++) {
	        		  position: new google.maps.LatLng(${city.lat}, ${city.lon}),
		               type:${city.descr}  
				    }
	        	  */	  
	            {
	               position: new google.maps.LatLng(53.551086, 9.993682),
	               type:'sunny'
	            }, {
	               position: new google.maps.LatLng(50.110924, 8.682127),
	               type:'sunny'
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
	        icon: {url: icons[features[i].type].icon,
        	scaledSize: new google.maps.Size(70, 70)},
            
	        map: map
	      });
	    };
	  }
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5j_YT2S6LASn412whtKYe6RdhkVCLfn0&callback=initMap"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>		
	
	
	
<script type="text/javascript">
	//datatable plugin
	$(document).ready(function() {
	    $('#excelTableData').DataTable();
	    } 
	);
	</script>
	
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script type="text/javascript">
//pdf converter with javascript
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
//excel converter with javascript
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