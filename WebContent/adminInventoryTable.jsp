<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wendy's Fashion Management</title>
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script	src="js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {	
		oTable = $("#fashions").dataTable({
			"bProcessing" : false,
			"bServerSide" : false,
			"sort" : "position",
			"sAjaxSource" : "./InventoryTable",
			"aoColumns" : [ {
				"mData" : "type"
			}, {
				"mData" : "season"
			}, {
				"mData" : "style"
			}, {
				"mData" : "color"
			}, {
				"mData" : "length"
			}, {
				"mData" : "size"
			}, {
				"mData" : "designer"
			}, {
				"mData" : "locale"
			}, {
				"mData" : "inventoryid"
			}, ],
			"columnDefs" : [ {
				"visible" : false,
				"targets" : 8
			} ]
		});
		var iid="";
		$('#fashions tbody').on('click','tr',function(event)  {
			$(oTable.fnSettings().aoData).each(function (){
		   		 $(this.nTr).removeClass('row_selected');
	      });
		$(event.target.parentNode).addClass('row_selected');
		var iPos = oTable.fnGetPosition( this );
		var aData = oTable.fnGetData(iPos);
		iid=aData.inventoryid;
		console.warn("ID: "+iid);
		});
		$("#add-but").on('click', function() {
			$.get("AddItem");
		});
		$("#edit-but").on('click', function() {	
			 if (iid==""){
				alert("Please select a row-item to edit...")
			} else {
				$.get("EditItem",{inventoryid:iid});
			}	
		});
		$("#del-but").on('click', function() {
			if (iid==""){
				alert("Please select a row-item to delete...")
			} else {
				$.get("DeleteItem",{inventoryid:iid});
			}	
		}) 
	});
</script>
	<style>
		#mainForm {
			margin-left: 8px;
		}
		td {
			font-size: 10px;
			padding: 6px 4px;
		}
		#but-grp {
			left-margin: 15px;
		}
		.row_selected {
			color: #6600ff;
		}
	</style>
</head>
<body>
	<form id="mainForm" action="">
		<div id="but-grp" class="container">
			<h4>Fashion Management</h4>
			<button id="add-but" type="button" class="btn btn-success">
				<span class="glyphicon glyphicon-log-in"></span>Add
			</button>
			<button id="edit-but" type="button" class="btn btn-warning">
				<span class="glyphicon glyphicon-edit"></span>Edit
			</button>
			<button id="del-but" type="button" class="btn btn-danger">
				<span class="glyphicon glyphicon-trash"></span>Delete
			</button>
		</div>
		<h6></h6>
		<table width="95%"
			style="border: 3px; background: rgb(248, 243, 252);">
			<tr>
				<td>
					<table id="fashions" class="display" cellspacing="0" width="95%">
						<thead>
							<tr>
								<th>Type</th>
								<th>Season</th>
								<th>Style</th>
								<th>Color</th>
								<th>Length</th>
								<th>Size</th>
								<th>Designer</th>
								<th>Location</th>
								<th>inventoryid</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
