$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

	// Form validation-------------------  
	var status = validatePaymentForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 

	// If valid------------------------  
	var t = ($("#hidfidSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "fundingbodiesApi",
		type : t,
		data : $("#formPayment").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onHospitalSaveComplete(response.responseText, status);
		}
	});
}); 

function onHospitalSaveComplete(response, status){
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Saved.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Saving.");
		$("#slertError").show();
	}else{
		$("#alertError").text("Unknown Error while Saving.");
		$("#alertError").show();
	}
	$("#hidfidSave").val("");
	$("#formPayment")[0].reset();
}

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidfidSave").val($(this).closest("tr").find('#hidfidUpdate').val());     
	$("#des").val($(this).closest("tr").find('td:eq(0)').text());    
	$("#amount").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#date").val($(this).closest("tr").find('td:eq(2)').text());     


});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "fundingbodiesaApi",
		type : "DELETE",
		data : "fid=" + $(this).data("fid"),
		dataType : "text",
		complete : function(response, status)
		{
			onPaymentDeletedComplete(response.responseText, status);
		}
	});
});

function onPaymentDeletedComplete(response, status)
{
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Deleting.");
		$("#alertError").show();
	}else{
		$("#alertError").text("Unknown Error While Deleting.");
		$("#alertError").show();
	}
}

//CLIENTMODEL
function validatePaymentForm() {  
	// Description  
	if ($("#Description").val().trim() == "")  {   
		return "Insert Description.";  
		
	} 
	
	 // Amount  
	if ($("#Amount").val().trim() == "")  {   
		return "Insert Amount.";  
		
	} 
	 
	 // is numerical value  
	var tmpDate = $("#Date").val().trim();  
	if (!$.isNumeric(tmpDate))  {   
		return "Insert a numerical value for Date.";  
		
	}
	 
	
	 
	 return true; 
	 
}
