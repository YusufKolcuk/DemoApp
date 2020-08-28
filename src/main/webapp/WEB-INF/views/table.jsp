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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	
	<style type="text/css">
			
		    .frame {
				  width: 1200px;
				  height: 800px;
				  border: 10px solid #ccc;
				  background: #eee;
				  margin: auto;
				  padding: 15px 10px;
			},
			#map {
		        height: 100%;  /* The height is 400 pixels */
		        width: 100%;  /* The width is the width of the web page */
		       },
		      
						       
		  
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
		${user.name} ${user.surname} WELCOME PAGE <a href="logout">Logout</a>
		<a href="generate/excel.xls">
			<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<a href="table/pdf">
			<img alt="pdf" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
		</a>
		<br>
		<input type="number" name="addRow" id="addRow" style="border:1px solid #003bd1" >
		
		<button onclick="searchURL()"><i class="glyphicon glyphicon-cloud"></i></button>
		<table class="blueTable" id="excelTableData">
		<thead>
				<th>id</th>
				<th>name</th>
				<th>temp</th>
				<th>temp_max</th>
				<th>temp_min</th>
				<th>humidity</th>
				<th>pressure</th>
				<th>Action</th>
		</thead>
		<tbody>
			<c:set var="count" value="0" scope="page" />
			<c:forEach var="city" items="${cities}" varStatus="status" >
				
				<c:set var="count" value="${count + 1}" scope="page"/>
				
				<tr id="rec-${count}">
					<td>${city.id}</td>
					<td>${city.name}</td>
					<td>${city.temp}</td>
					<td>${city.tempMax}</td>
					<td>${city.tempMin}</td>
					<td>${city.humidity}</td>
					<td>${city.pressure}</td>
					
					<td>
				<!--  	<a  class="btn btn-xs delete-record"  data-id="${count}"><i class="glyphicon glyphicon-trash"></i></a>    -->
					<a href="<c:url value='/table/delete/${city.id}' />"><i class="glyphicon glyphicon-trash"></i></a> 
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
		<div class="frame" id="map"></div>
	
	<script>
		
		<%
			String city1,city2,city3,city4,city5,city6,city7,city8,city9,city10,city11,city12,city13;
			String lat1,lat2,lat3,lat4,lat5,lat6,lat7,lat8,lat9,lat10,lat11,lat12,lat13;
			String lon1,lon2,lon3,lon4,lon5,lon6,lon7,lon8,lon9,lon10,lon11,lon12,lon13;
						
			ArrayList<City> list=((ArrayList<City>) request.getAttribute("cities"));
			ArrayList<String> city_list_des=new ArrayList();
			ArrayList<String> city_list_lat=new ArrayList();
			ArrayList<String> city_list_lon=new ArrayList();
			
			for(int i=0;i<list.size();i++){
				city_list_des.add(list.get(i).getDesc().toString());
			}
			for(int i=0;i<list.size();i++){
				city_list_lat.add(list.get(i).getLat().toString());
			}
			for(int i=0;i<list.size();i++){
				city_list_lon.add(list.get(i).getLon().toString());
			}
			

			for(int i=0;i<list.size();i++){
				System.out.print(list.get(i).getDesc()+"\n");
				//response.getWriter().print("City " + i +":"+((ArrayList) request.getAttribute("cities")).get(i).toString()+"\n");
			
			}
			
		%>
	  var map;
	  function initMap() {
	    map = new google.maps.Map(
	        document.getElementById('map'),
	    {center: new google.maps.LatLng(51.260197, 4.402771), zoom: 4});

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
	    
	    var features = [];
	    
	    <%  for( int j=0; j<list.size(); j++) { %>
	  		 features.push(
	      	        	{
	      	        		position: new google.maps.LatLng(<%=city_list_lat.get(j)%>, <%=city_list_lon.get(j)%>),
	      		            type:'<%=city_list_des.get(j)%>'
	      	        	}	  
	      	          )
	  		<% } %>
	
	    
	// Create markers.
	    for (var i = 0; i < features.length; i++) {
	      var marker = new google.maps.Marker({
	        position: features[i].position,
	        icon: {url: icons[features[i].type].icon,
        	scaledSize: new google.maps.Size(40, 40)},
            
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
	
	
	
	var input = document.getElementById("addRow");
	function searchURL() {
	     window.location = "table/add/"+input.value;
	}
	</script>
	
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>


<script type="text/javascript">
	//datatable delete row 
	jQuery(document).delegate('a.delete-record', 'click', function(e) {
	     e.preventDefault();    
	     var didConfirm = confirm("Are you sure You want to delete");
	     if (didConfirm == true) {
	      var id = jQuery(this).attr('data-id');
	      var targetDiv = jQuery(this).attr('targetDiv');
	      jQuery('#rec-' + id).remove();
	      
	    //regnerate index number on table
	    $('#tbl_posts_body tr').each(function(index) {
	      //alert(index);
	      $(this).find('span.sn').html(index+1);
	    });
	    return true;
	  } else {
	    return false;
	  }
	});


</script>

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