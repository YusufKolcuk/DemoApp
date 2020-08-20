<%@page import="com.xperta.entity.City"%>
<%@page import="com.xperta.service.CitiesService"%>
<%@page import="java.util.ArrayList"%>
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
		
		itext pdf
			<a href="generate/pdf.htm">
			<img alt="excel" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
		</a>
	-->
		<a href="generate/excel.htm">
			<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<a href="table/pdf">
			<img alt="pdf" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
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
				<th>Add/Remove</th>
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
					<td>
						<button type="button" class="btn btn-success">+</button>
						<button type="button" class="btn btn-danger">-</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
		<div id="map"></div>
	
	<script>
		
		<%
			String city1,city2,city3,city4,city5,city6,city7,city8,city9,city10,city11,city12,city13;
			String lat1,lat2,lat3,lat4,lat5,lat6,lat7,lat8,lat9,lat10,lat11,lat12,lat13;
			String lon1,lon2,lon3,lon4,lon5,lon6,lon7,lon8,lon9,lon10,lon11,lon12,lon13;
						
			ArrayList<City> list=((ArrayList<City>) request.getAttribute("cities"));
			
			city1=list.get(0).getDesc().toString();
			city2=list.get(1).getDesc().toString();
			city3=list.get(2).getDesc().toString();
			city4=list.get(3).getDesc().toString();
			city5=list.get(4).getDesc().toString();
			city6=list.get(5).getDesc().toString();
			city7=list.get(6).getDesc().toString();
			city8=list.get(7).getDesc().toString();
			city9=list.get(8).getDesc().toString();
			city10=list.get(9).getDesc().toString();
			city11=list.get(10).getDesc().toString();
			city12=list.get(11).getDesc().toString();
			city13=list.get(12).getDesc().toString();
			
			lat1=list.get(0).getLat().toString();
			lat2=list.get(1).getLat().toString();
			lat3=list.get(2).getLat().toString();
			lat4=list.get(3).getLat().toString();
			lat5=list.get(4).getLat().toString();
			lat6=list.get(5).getLat().toString();
			lat7=list.get(6).getLat().toString();
			lat8=list.get(7).getLat().toString();
			lat9=list.get(8).getLat().toString();
			lat10=list.get(9).getLat().toString();
			lat11=list.get(10).getLat().toString();
			lat12=list.get(11).getLat().toString();
			lat13=list.get(12).getLat().toString();
			
			lon1=list.get(0).getLon().toString();
			lon2=list.get(1).getLon().toString();
			lon3=list.get(2).getLon().toString();
			lon4=list.get(3).getLon().toString();
			lon5=list.get(4).getLon().toString();
			lon6=list.get(5).getLon().toString();
			lon7=list.get(6).getLon().toString();
			lon8=list.get(7).getLon().toString();
			lon9=list.get(8).getLon().toString();
			lon10=list.get(9).getLon().toString();
			lon11=list.get(10).getLon().toString();
			lon12=list.get(11).getLon().toString();
			lon13=list.get(12).getLon().toString();
			

			for(int i=0;i<list.size();i++){
				System.out.print(list.get(i).getDesc()+"\n");
				//response.getWriter().print("City " + i +":"+((ArrayList) request.getAttribute("cities")).get(i).toString()+"\n");
			
			}
			
		%>
	  var map;
	  function initMap() {
	    map = new google.maps.Map(
	        document.getElementById('map'),
	    {center: new google.maps.LatLng(38.020793, -121.887831), zoom: 4});

	    var icons = {

	    		  Clouds: {
	              icon: 'assets/login/images/icons/wfimg.ico', 
	              
	              },
	              Clear: {
	                icon: 'assets/login/images/icons/sunny.ico', 
	                
	              },
	              Rain: {
	                icon: 'assets/login/images/icons/rainn.ico', 
	                
	              },
	              Snow: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Drizzle: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Thunderstorm: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Mist: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Smoke: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Haze: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Ash: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Dust: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Fog: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Sand: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Squall: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	              Dust: {
		                icon: 'assets/login/images/icons/rainn.ico', 
		                
		              },
	        };
	    

	
	          var features = [	  
	            {
	        	   position: new google.maps.LatLng(<%=lat1%>, <%=lon1%>),
	               type:'<%=city1%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat2%>, <%=lon2%>),
	               type:'<%=city2%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat3%>, <%=lon3%>),
	               type: '<%=city3%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat4%>, <%=lon4%>),
	               type: '<%=city4%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat5%>, <%=lon5%>),
	               type: '<%=city5%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat6%>, <%=lon6%>),
	               type: '<%=city6%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat7%>, <%=lon7%>),
	               type: '<%=city7%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat8%>, <%=lon8%>),
	               type: '<%=city8%>'
	           	}, {
	               position: new google.maps.LatLng(<%=lat9%>, <%=lon9%>),
	               type: '<%=city9%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat10%>, <%=lon10%>),
	               type: '<%=city10%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat11%>, <%=lon11%>),
	               type: '<%=city11%>'
	            },{
	               position: new google.maps.LatLng(<%=lat12%>, <%=lon12%>),
	               type: '<%=city12%>'
	            }, {
	               position: new google.maps.LatLng(<%=lat13%>, <%=lon13%>),
	               type: '<%=city13%>'
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