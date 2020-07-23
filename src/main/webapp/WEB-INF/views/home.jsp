<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Table</title>
	<meta charset="UTF-8">


	<style>
		#viewContent {
		    padding-left: 20px;
		}
		  
	    #viewContent select, #viewContent button {
	        font-size: 25px;
	    }
	  
	    #viewContent h4 {
	        margin: 10px 0;
	    }
	  
	    #viewContent .textAlignCenter {
	        text-align: center;
	    }
	  
        #viewContent .textAlignCenter img {
            display: none;
            width: 100px;
        }
  
	    #viewContent #message table {
	        width: 100%;
	    }
	  
        #viewContent #message table th {
            text-align: left;
            text-decoration: underline;
        }
		 .select-css {
			display: block;
			font-size: 16px;
			font-family: sans-serif;
			font-weight: 700;
			color: #444;
			line-height: 1.3;
			padding: .6em 1.4em .5em .8em;
			width: 100%;
			max-width: 100%;
			box-sizing: border-box;
			margin: 0;
			border: 1px solid #aaa;
			box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
			border-radius: .5em;
			-moz-appearance: none;
			-webkit-appearance: none;
			appearance: none;
			background-color: #fff;
			background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
			  linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
			background-repeat: no-repeat, repeat;
			background-position: right .7em top 50%, 0 0;
			background-size: .65em auto, 100%;
		}
		.select-css::-ms-expand {
			display: none;
		}
		.select-css:hover {
			border-color: #888;
		}
		.select-css:focus {
			border-color: #aaa;
			box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
			box-shadow: 0 0 0 3px -moz-mac-focusring;
			color: #222;
			outline: none;
		}
		.select-css option {
			font-weight:normal;
		}
		
		.button {
		  display: inline-block;
		  padding: 5px 50px;
		  font-size: 15px;
		  cursor: pointer;
		  text-align: center;
		  text-decoration: none;
		  outline: none;
		  color: #fff;
		  background-color: #5f9b9c;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0 4px #999;
		}
		
		.button:hover {background-color: #3e8e41}
		
		.button:active {
		  background-color: #3e8e41;
		  box-shadow: 0 5px #666;
		  transform: translateY(4px);
		}
		table, td, th {
 		 border: 1px solid black;
		}

		table {
		  border-collapse: collapse;
		  width: 100%;
		}
		
		th {
		  height: 50px;
		  background-color: #4CAF50;
		  color: white;
		}
		#map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
	</style>
</head>
<body style="font-family: Arial">
		<center><B><h1>WEATHER FORECAST</h1></B></center>
		<h1>${user.name} ${user.surname} WELCOME PAGE <a href="logout">Logout</a><a href="generate/excel.htm">
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<a href="generate/pdf.htm">
		<img alt="pdf" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
		</a>
		</h1>
		 
	<select class="select-css" id="citySelect">
		
		
		<option value="Select">Select City</option>
		<option value="5128581">New York</option>
		<option value="5391959">San Francisco</option>
		<option value="2643743">London</option>
		<option value="1275339">Mumbai</option>
		<option value="8199396">Santa Lucia</option>
		<option value="745042">Istanbul</option>
		<option value="2950159">Berlin</option>
		<option value="323786">Ankara</option>
		<option value="304919">Malatya Province</option>
		<option value="1850144">Tokyo</option>
		
	</select>
	<br>
	<button class="button" id="submit">Submit</button>
	<br><br><br><br>	
	<div id="message"></div>
	
	<button id="submitButton">Get Weather</button>
	<table id="table"></table>
	
	<div id="map"></div>
	<script>
	  var map;
	  function initMap() {
	    map = new google.maps.Map(
	        document.getElementById('map'),
	    {center: new google.maps.LatLng(39.925533, 32.866287), zoom: 8});

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
	              position: new google.maps.LatLng(38.630554, 27.422222),
	              type: 'rain'
	            }, {
	              position: new google.maps.LatLng(40.766666, 29.916668),
	              type: 'sunny'
	            }, {
	              position: new google.maps.LatLng(38.499817, 43.378143),
	              
	              type: 'cloud'
	            }, {
	              position: new google.maps.LatLng(41.674965, 26.583481),
	              type: 'cloud'
	            }, {
	              position: new google.maps.LatLng(36.884804, 30.704044),
	              type: 'rain'
	            }, {
	              position: new google.maps.LatLng(37.783333, 29.094715),
	              type: 'cloud'
	            }, {
	              position: new google.maps.LatLng(37.768002, 30.561905),
	              type: 'cloud'
	            }, {
	               position: new google.maps.LatLng(39.925533, 32.866287),
	               type: 'sunny'
	           }, {
	               position: new google.maps.LatLng(38.356869, 38.309669),
	               type: 'rain'
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
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="assets/custom/table2.js"></script>
	<script src="assets/custom/table.js"></script>
	
</body>
</html>