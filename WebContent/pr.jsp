<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ajax Progress</title>

<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

<!-- Google CDN -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/black-tie/jquery-ui.css" />

<script src="js/jquery.ajax-progress.js"></script>
<script>
	$(function() {
		$('#prog').progressbar({
			value : 0
		});

		$.ajax({
			method : 'GET',
			url : 'data/bird.json',
			dataType : 'json',
			success : function() {
				console.log('YAYE!', arguments[0]);
			},
			error : function() {
				console.log('AWWW!');
			},
			progress : function(e) {
				if (e.lengthComputable) {
					var pct = (e.loaded / e.total) * 100;
					$('#prog').progressbar('option', 'value', pct).children(
							'.ui-progressbar-value').html(
							pct.toPrecision(3) + '%').css('display', 'block');
				} else {
					console.warn('Content Length not reported!');
				}
			}
		});
	});
</script>
</head>
<body>
	<div id="prog"></div>
</body>
</html>