<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>How to capture picture from webcam with Webcam.js</title>

</head>
</head>
<body>
    <!-- CSS -->
    <style>
    #my_camera{
        width: 320px;
        height: 240px;
        border: 1px solid black;
    }
	</style>

	<div id="my_camera"></div>
	<input type=button value="Take Snapshot" onClick="take_snapshot()">
	
    <div id="results" ></div>
	
	<!-- Webcam.min.js -->
    <script type="text/javascript" src="webcamjs/webcam.min.js"></script>

	<!-- Configure a few settings and attach camera -->
	<script language="JavaScript">
		Webcam.set({
			width: 320,
			height: 240,
			image_format: 'jpeg',
			jpeg_quality: 90
		});
		Webcam.attach( '#my_camera' );
	</script>
	<!-- A button for taking snaps -->
	
	<!-- Code to handle taking the snapshot and displaying it locally -->
	<script language="JavaScript">

		function take_snapshot() {
			
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				Webcam.reset();
				// display results in page
				document.getElementById('my_camera').innerHTML = 
					'<img src="'+data_uri+'"/>';
				document.getElementById('Take Snapshot').innerHTML = 
					'<img src="'+data_uri+'"/>';
			} );
		}
	</script>
	
</body>
</html>