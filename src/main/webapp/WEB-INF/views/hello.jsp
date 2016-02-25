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
	 
	 <br/><br/><br/><br/>
	 	<div class="col-lg-6">
    		<div class="input-group">
      			<input id ="searchInput" type="text" class="form-control" placeholder="Search(by name or category)">
      			<span class="input-group-btn">
        			<button class="btn btn-default" type="submit" id="fetchPlaces">Search</button>
      			</span>
    		</div><!-- /input-group -->
  		</div><!-- /.col-lg-6 -->
  
  
	<table class="data-contacts-js table table-striped" id="dataTable">
		<thead>
			<tr>
				<th> Place </th>
				<th> Category </th>
				<th> Rating </th>
				<th> Map </th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<br/><br/>
	<div id="googleMap" style="width:500px;height:380px;text-align: center; float: center"></div>
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap.min.js"></script>
    
    <script src="http://maps.googleapis.com/maps/api/js"> </script>
    

    <script type="text/javascript">
	    $("#searchInput").keyup(function(event){
	        if(event.keyCode == 13){
	            $("#fetchPlaces").click();
	        }
	    });
    
	    $("#fetchPlaces").bind("click", function() {
	
	    	$("#dataTable > tbody").empty();
	    	
	    	var searchInput = $("#searchInput").val()
	    	if(jQuery.trim(searchInput).length > 0){
	    		jQuery.ajax(
					{
	    				url : "/searchMulti",
	    				type: 'POST',
	    				contentType : "application/json",
	    				data: JSON.stringify({'locName':searchInput, 'category':searchInput}),
	    				success:function(data) { 
	    					$.each(data, function(i, place) {
	    		                $(".data-contacts-js").append(
	    		                    "<tr><td>" + place.locName + "</td>" +
	    		                    "<td>" + place.category + "</td>" +
	    		                    "<td>" + place.rating + "</td>" +
	    		                    "<td> <p id='map' onClick=initialize("+place.latitude+","+place.longitude+")> Map </p> </td></tr>");
	    		            });	
	    				},
	    				error: function() {}
	    			}
	    		);
	    	} 
	    	else{
	    		$.get("/list", function(data) {
	    			
		            $.each(data, function(i, place) {
		
		                $(".data-contacts-js").append(
		                    "<tr><td>" + place.locName + "</td>" +
		                    "<td>" + place.category + "</td>" +
		                    "<td>" + place.rating + "</td>" +
		                    "<td> <p id='map' onClick=initialize("+place.latitude+","+place.longitude+")> Map </p> </td></tr>");
		            });
		        });
	    	}
	    });
	    
	    
	    
	    $("#dataTable").ready(function() {
	        $.get("/list", function(data) {

	            $.each(data, function(i, place) {
	                $(".data-contacts-js").append(
	                    "<tr><td>" + place.locName + "</td>" +
	                    "<td>" + place.category + "</td>" +
	                    "<td>" + place.rating + "</td>" +
	                    "<td> <p id='map' onClick=initialize("+place.latitude+","+place.longitude+")> Map </p> </td></tr>");
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
    
 	<script type="text/javascript">

		function initialize(lat,lon) {
			var userLatLng = new google.maps.LatLng(lat,lon)
			var mapProp = {
				center : userLatLng,
				zoom : 16,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var mapObject = new google.maps.Map(document.getElementById("googleMap"), mapProp);
			new google.maps.Marker({map: mapObject, position: userLatLng });
			
		}		
	        google.maps.event.addDomListener(window, 'load', initialize(51.508742,-0.120850));
	</script>

  </body>
</html>
