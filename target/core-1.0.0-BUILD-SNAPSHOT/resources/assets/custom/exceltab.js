function addTable(){
	var param = {
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
				alert("OLUŞTU SASDŞASDŞLAS");
		},
		error:function(data){
			alert(data);
		}
	});
}