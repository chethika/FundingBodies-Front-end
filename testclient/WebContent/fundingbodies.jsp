<%@page import="model.fundingbodies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="components/jquery-3.2.1.min.js"></script>
<script src="components/main.js"></script>
</head>
<body>
<div class="container"> 
		<div class="row">  
		
			<div class="col-8">       
				<h1 class="m-3">Payment Management</h1>        
				
				<form id="formPayment" name="formAppointment" method="post" action="fundingbodies.jsp">  
					Description:  
					<input id="Description" name="Description" type="text" class="form-control form-control-sm">  
					
					<br> 
					Amount:  
					<input id="Amount" name="Amount" type="text" class="form-control form-control-sm">  
					
					<br>
					 Date:  
					 <input id="Date" name="Date" type="text" class="form-control form-control-sm">  
					 
					 
					 
					 <br>  
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					 <input type="hidden" id="hidAppIDSave" name="hidAppIDSave" value=""> 
					 
				</form> 
				
				<div id="alertSuccess" class="alert alert-success"></div>  
				<div id="alertError" class="alert alert-danger"></div> 
				
				<br>  
				<div id="divItemsGrid">   
					<%    
						fundingbodies appObj = new fundingbodies();
						out.print(appObj.readPayment());   
					%>  
					
				</div> 
				  
 			</div>
 		 
 		</div>    
 		
 
	</div> 

</body>

</html>