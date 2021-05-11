<%@page import="model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Funding Bodies Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="css/footer.css">

<script src="components/jquery-3.2.1.min.js"></script>
<script src="components/pay.js"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">GadgetBadget</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">FundingBodies
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Customer</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Researcher</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Product</a></li>
			</ul>
		</div>
	</div>
</nav>
</head>
<body>


	<br>
	<br>


	<div class="container">
		<div class="row">

			<div class="col-8">
				<center>
					<h1 class="m-3">FundingBodies Management</h1>
				</center>


				<form id="formPayment" name="formPayment" method="post"
					action="Payment.jsp">
					Payment Date: <input id="PaymentDate" name="PaymentDate"
						type="text" class="form-control form-control-sm"> <br>
					Payment Type: <input id="PaymentType" name="PaymentType"
						type="text" class="form-control form-control-sm"> <br>
					Amount: <input id="Amount" name="Amount" type="text"
						class="form-control form-control-sm"> <br> Card
					Number: <input id="CardNumber" name="CardNumber" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidPaymentIDSave" name="hidPaymentIDSave" value="">

				</form>
			</div>
		</div>
	</div>
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	<center>
		<div id="divItemsGrid">
			<%
			Payment paymentObj = new Payment();
			out.print(paymentObj.readPayment());
			%>
		</div>
	</center>
	<br>
</body>
<br>
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<h5>
					<i class="fa fa-road"></i>GadgetBadget (GB) is a company who funds
					innovative projects and help the young researches to sell their
					products via company’s online platform
				</h5>
				<div class="row">
					<div class="col-6">
						<ul class="list-unstyled">
							<li><a href="">Product</a></li>
							<li><a href="">Benefits</a></li>
							<li><a href="">Partners</a></li>
							<li><a href="">Team</a></li>
						</ul>
					</div>
					<div class="col-6">
						<ul class="list-unstyled">
							<li><a href="">Documentation</a></li>
							<li><a href="">Support</a></li>
							<li><a href="">Legal Terms</a></li>
							<li><a href="">About</a></li>
						</ul>
					</div>
				</div>
				<ul class="nav">
					<li class="nav-item"><a href="" class="nav-link pl-0"><i
							class="fa fa-facebook fa-lg"></i></a></li>
					<li class="nav-item"><a href="" class="nav-link"><i
							class="fa fa-twitter fa-lg"></i></a></li>
					<li class="nav-item"><a href="" class="nav-link"><i
							class="fa fa-github fa-lg"></i></a></li>
					<li class="nav-item"><a href="" class="nav-link"><i
							class="fa fa-instagram fa-lg"></i></a></li>
				</ul>
				<br>
			</div>
			<div class="col-md-2">
				<h5 class="text-md-right">Contact Us</h5>
				<hr>
			</div>
			<div class="col-md-5">
				<form>
					<fieldset class="form-group">
						<input type="email" class="form-control" id="exampleInputEmail1"
							placeholder="Enter email">
					</fieldset>
					<fieldset class="form-group">
						<textarea class="form-control" id="exampleMessage"
							placeholder="Message"></textarea>
					</fieldset>
					<fieldset class="form-group text-xs-right">
						<button type="button" class="btn btn-secondary-outline btn-lg">Send</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</footer>


</html>