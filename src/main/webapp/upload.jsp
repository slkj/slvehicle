<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div id="imgPreview"
		style="margin: 0 0.3em; width: 485px; height: 325px; overflow: auto; z-index: 100">
		<img id="photo" src="images/noheadimage.jpg" height="300" />
	</div>
	<div style="padding-top: 5px"></div>
	<div class="file-box">
		<input type='text' name='textfield' id='textfield' class='txt' /> <input
			type='button' class='btn' value='浏览...' /> <input type="file"
			name="fileField" class="file" id="fileField" size="28"
			accept="image/jpeg,image/png,image/gif,image/jpeg"
			onchange="PreviewImage(this)" />
	</div>

</body>
</html>