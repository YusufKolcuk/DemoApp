<!DOCTYPE html>
<html>
<head>
<title>Table</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/login/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="assets/login/css/util.css">
<link rel="stylesheet" type="text/css" href="assets/login/css/main.css">
<meta charset="windows-1252">
<style>
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
<body>
	<center><B><h1>WEATHER FORECAST</h1></B></center>
		<h1>${user.name} ${user.surname} WELCOME PAGE <a href="logout">Logout</a><a href="generate/excel.htm">
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
		<a href="generate/pdf.htm">
		<img alt="pdf" src="assets/login/images/icons/pdf.ico" align="right" width="50" height="50">
		</a>
		</h1>
<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="registerBtn" onclick="addTable();">
								Login
							</button>
						</div>
					</div>	<iframe id="txtArea1" style="display:none"></iframe>
	<button id="btnExport" onclick="fnExcelReport();"> EXPORT </button>
	
	<button id="submitButton">Get Weather</button>
	<table id="table"></table>
	
	<div id="map"></div>
	<script>
      var map;
      function initMap() {
        map = new google.maps.Map(
            document.getElementById('map'),
            {center: new google.maps.LatLng(39.925533, 32.866287), zoom: 8});

        //var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
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
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5j_YT2S6LASn412whtKYe6RdhkVCLfn0&callback=initMap">
    </script>
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	
	<script src="assets/custom/table2.js"></script>
	<script>
	function addTable(){
		var param = {
				id:"11231",
				name:"YUSUF",
				temperature:"YUSUF",
				minTemp:"YUSUF",
				maxTemp:"YUSUF",
				humidity:"YUSUF",
				pressure:"YUSUF",
			
		}
		
		var ser_data = JSON.stringify(param);
		
		$.ajax({
			type:"POST",
			contentType:'application/json; charset-UTF-8',
			url:'addTable',
			data:ser_data,
			success:function(data){
					alert("OLUsss");
			},
			error:function(data){
				alert(data);
			}
		});
	}
	</script>
	
	





</body>
</html>