<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modify Garment Details</title>
<link rel="stylesheet" href="css/bootstrap.min.css"></link>
<link rel="stylesheet" href="css/bootstrap-formhelpers.min.css"></link>
<script	type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script	type="text/javascript" src="js/bootstrap.min.js"></script>
<script	type="text/javascript" src="js/bootstrap-formhelpers.min.js"></script>
<script	type="text/javascript" src="js/jquery.maskMoney.min.js"></script>
	<style>
		#garmentdesc {
			margin-left: 100px;
			width: 550px;
		}
		#saled {
			width: 450px;
			margin-left: 100px;
		}  
		#rcptsel {
			margin-left: 100px;
			width: 200px
		}
		#statsel {
			margin-left: 100px;
			width: 200px;
		}
	</style>
</head>

<body>
	<div class="container">
	<h3>session id: ${id}</h3>
		<h4>Fashion Item Details</h4>
		<form class="form-horizontal" role="form" action="update" method="post" >
			<div class="form-group">
				<label class="control-label col-sm-2" for="loca">Location:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="loca" name="location"
						value="${item.locale }"></input>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="type">Type:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="type" name="type"
						value=""></input>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sea">Season:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="sea" name="season"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sty">Style:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="sty" name="style"
						value=""></input>
				</div>
			</div>
			<div id="garmentdesc" class="form-group">
			  <label for="desc">Description:</label>
			  <textarea class="form-control" rows="3" cols="70" 
			  	id="desc" name="description"></textarea>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="colo">Color:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="colo" name="color"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="len">Length:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="len" name="length"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="siz">Size:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="siz" name="size"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="desi">Designer:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="des" name="designer"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="cost">Cost:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="cost" name="cost"
						value="">
						<script> 
							$("#cost").maskMoney();
						</script>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pri">price:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="pri" name="price"
						value="">
						<script> 
							$("#pri").maskMoney();
						</script>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="paid">Amount Paid:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="paid" name="amountpaid"
						value="">
						<script>
							$("#paid").maskMoney();
						</script>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="saled">Sale Date:</label>
				<div class="bfh-datepicker" data-name="saledate" data-placeholder="" data-close="true" data-id="saled" data-date="" data-format="y-m-d">
				</div>
			</div>
			<div id="rcptsel" class="form-group" >
  				<label for="rcpt">Receipt provided:</label>
  				<select class="form-control" id="rcpt" name="receipt" value="">
  					<option> </option>
    				<option>Yes</option>
    				<option>No</option>
 				 </select>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="cust">Customer:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="cust" name="customer"
						value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sorc">Source:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="sorc" name="Source"
						value="">
				</div>
			</div>
			<div id="statsel" class="form-group" >
  				<label for="stat">Status:</label>
  				<select class="form-control" id="stat" name="status" value="">
  					<option> </option>
    				<option>Sold</option>
    				<option>Pending</option>
    				<option>Gifted</option>
    				<option>Wendy</option>
 				 </select>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">Save</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
