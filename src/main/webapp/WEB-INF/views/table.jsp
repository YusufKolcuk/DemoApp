<!DOCTYPE html>
<html>
    <head>
        <title>Table</title>
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
        <meta charset="windows-1252">
        
        <style>
            
            .container{overflow: hidden}
            .tab{float: left;}
            .tab-2{margin-left: 50px}
            .tab-2 input{display: block;margin-bottom: 10px}
            tr{transition:all .25s ease-in-out}
            tr:hover{background-color:#EEE;cursor: pointer}
            table.table {
			  font-family: "Arial Black", Gadget, sans-serif;
			  border: 6px solid #1C6EA4;
			  background-color: #EEEEEE;
			  width: 100%;
			  height: 200px;
			  text-align: left;
			  border-collapse: collapse;
			}
			table.table td, table.table th {
			  border: 4px solid #AAAAAA;
			  padding: 10px 2px;
			}
			table.table tbody td {
			  font-size: 15px;
			}
			table.table tr:nth-child(even) {
			  background: #D0E4F5;
			}
			table.table thead {
			  background: #1C6EA4;
			  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			  border-bottom: 2px solid #444444;
			}
			table.table thead th {
			  font-size: 20px;
			  font-weight: bold;
			  color: #FFFFFF;
			  border-left: 2px solid #D0E4F5;
			}
			table.table thead th:first-child {
			  border-left: none;
			}
			
			table.table tfoot {
			  font-size: 8px;
			  font-weight: bold;
			  color: #FFFFFF;
			  background: #D0E4F5;
			  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			  border-top: 2px solid #444444;
			}
			table.table tfoot td {
			  font-size: 8px;
			}
			table.table tfoot .links {
			  text-align: right;
			}
			table.table tfoot .links a{
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
        </style>
        
    </head>
    <body>
        <center><B><h1>WEATHER FORECAST</h1></B></center>	
		 <a href="generate/excel.htm">
		
		<img alt="excel" src="assets/login/images/icons/excel.ico" align="right" width="50" height="50">
		</a>
        <div class="container">
            <div class="tab tab-1">
                <table id="table" border="1">
                    <tr>
                        <th>City</th>
                        <th>Minimum</th>
                        <th>Maximum</th>
                    </tr>
                    <tr>
                        <td>Istanbul</td>
                        <td>32</td>
                        <td>39</td>
                    </tr>
                    <tr>
                        <td>Ankara</td>
                        <td>28</td>
                        <td>33</td>
                    </tr>
                    <tr>
                        <td>Malatya</td>
                        <td>33</td>
                        <td>37</td>
                    </tr>
                </table>
            </div>
            <div class="tab tab-2">
                City Name :<input type="text" name="cname" id="cname">
                Minimum Temperature :<input type="number" name="mitem" id="mitem">
                Maximum Temperature :<input type="number" name="matem" id="matem">
                
                <button onclick="addHtmlTableRow();">Add</button>
                <button onclick="editHtmlTbleSelectedRow();">Edit</button>
                <button onclick="removeSelectedRow();">Remove</button>
            </div>
        </div>
        
        <script>
            
            var rIndex,
                table = document.getElementById("table");
            
            // check the empty input
            function checkEmptyInput()
            {
                var isEmpty = false,
                    fname = document.getElementById("cname").value,
                    lname = document.getElementById("mitem").value,
                    age = document.getElementById("matem").value;
            
                if(fname === ""){
                    alert("City Name Connot Be Empty");
                    isEmpty = true;
                }
                else if(lname === ""){
                    alert("Minimum Connot Be Empty");
                    isEmpty = true;
                }
                else if(age === ""){
                    alert("Maximum Connot Be Empty");
                    isEmpty = true;
                }
                return isEmpty;
            }
            
            // add Row
            function addHtmlTableRow()
            {
                if(!checkEmptyInput()){
                var newRow = table.insertRow(table.length),
                    cell1 = newRow.insertCell(0),
                    cell2 = newRow.insertCell(1),
                    cell3 = newRow.insertCell(2),
                    cname = document.getElementById("cname").value,
                    mitem = document.getElementById("mitem").value,
                    matem = document.getElementById("matem").value;
            
                cell1.innerHTML = cname;
                cell2.innerHTML = mitem;
                cell3.innerHTML = matem;
                // call the function to set the event to the new row
                selectedRowToInput();
            }
            }
            
            // display selected row data into input text
            function selectedRowToInput()
            {
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                      // get the seected row index
                      rIndex = this.rowIndex;
                      document.getElementById("cname").value = this.cells[0].innerHTML;
                      document.getElementById("mitem").value = this.cells[1].innerHTML;
                      document.getElementById("matem").value = this.cells[2].innerHTML;
                    };
                }
            }
            selectedRowToInput();
            
            function editHtmlTbleSelectedRow()
            {
                var fname = document.getElementById("cname").value,
                    lname = document.getElementById("mitem").value,
                    age = document.getElementById("matem").value;
               if(!checkEmptyInput()){
                table.rows[rIndex].cells[0].innerHTML = cname;
                table.rows[rIndex].cells[1].innerHTML = mitem;
                table.rows[rIndex].cells[2].innerHTML = matem;
              }
            }
            
            function removeSelectedRow()
            {
                table.deleteRow(rIndex);
                // clear input text
                document.getElementById("cname").value = "";
                document.getElementById("mitem").value = "";
                document.getElementById("matem").value = "";
            }
        </script>
        
    </body>
</html>