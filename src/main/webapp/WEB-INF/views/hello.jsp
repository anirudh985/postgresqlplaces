<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Place Lookup</title>

    <!-- Bootstrap -->
    <link href="resources/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <h1 style="text-align:left; float:left">Place Lookup</h1>
	 <h3 id="totalCount" style="text-align:right; float:right"><span class="label label-default">Total Places: </span></h3>
	 
	<table class="data-contacts-js table table-striped" id="dataTable">
		<thead>
			<tr>
				<th> Place </th>
				<th> Category </th>
				<th> Rating </th>
				<th> Latitude </th>
				<th> Longitude </th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<input type="text" style="text-align:center; float:center">
	<button id="fetchPlaces" class = "btn btn-default" type = "submit">Fetch Places</button>
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	    $("#fetchPlaces").bind("click", function() {
	
	    	$("#dataTable > tbody").empty();
	    	
	        $.get("/list", function(data) {
	
	            $.each(data, function(i, place) {
	
	                $(".data-contacts-js").append(
	                    "<tr><td>" + place.locName + "</td>" +
	                    "<td>" + place.category + "</td>" +
	                    "<td>" + place.rating + "</td>" +
	                    "<td>" + place.latitude + "</td>" +
	                    "<td>" + place.longitude + "</td></tr>");
	            });
	        });
	    });
	    
	    
	    
	    $("#dataTable").ready(function() {
	    	
	        $.get("/list", function(data) {
	
	            $.each(data, function(i, place) {
	                $(".data-contacts-js").append(
	                    "<tr><td>" + place.locName + "</td>" +
	                    "<td>" + place.category + "</td>" +
	                    "<td>" + place.rating + "</td>" +
	                    "<td>" + place.latitude + "</td>" +
	                    "<td>" + place.longitude + "</td></tr>");
	            });
	        });
	    });
    </script>
    
    <script type="text/javascript">
    	$("#totalCount").ready(function(){
    		$.get("/count", function(data) {
    			$("#totalCount").append("<span class=\"label label-default\">" + data + "</span>");
    		});
    	});
    </script>
  </body>
</html>
