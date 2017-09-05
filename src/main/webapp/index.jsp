<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>裁剪图片</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<%-- 公共body样式 --%>
<link rel="stylesheet" rev="stylesheet" href="css/common/body.css" type="text/css" />
<style type="text/css">
#crop_image {
	float: left;
	width: 55%;
	background-color: #333;
	user-select: none;
	margin: 5% 20%;
	border: 1px solid #DEDEDE;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
	box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

#crop_image_top,#crop_image_bottom {
	float: left;
	width: 96%;
	padding: 2%;
	background-color: white;
}
/* 底部 */
#crop_image_bottom {
	text-align: right;
}

#crop_image_bottom input {
	height: 30px;
	padding: 5px 15px;
	border-radius: 3px;
	border: none;
	margin-left: 20px;
	outline: none;
}

#submitBtn {
	background-color: #40aff2;
	color: white;
	cursor: pointer;
}

#submitBtn:HOVER {
	background-color: #409ff2;
}
/* 顶部 */
#crop_image_top h4 {
	margin: 0;
	padding: 0;
	font-weight: normal;
}
/* 裁剪部分 */
#crop_image_content {
	float: left;
	position: relative;
	text-align: center;
	width: 92%;
	margin: 4%;
}

#cropBox {
	position: relative;
}

#crop_image_content #cropimg1 {
	opacity: 0.5;
	position: absolute;
	top: 0;
	left: 0;
}

#crop_image_content #cropimg2 {
	position: absolute;
	top: 0;
	left: 0;
	clip: rect(0, 150px, 150px, 0);
}

#crop_image_content #mainBox {
	border: 1px solid white;
	position: absolute;
	top: 0;
	left: 0;
	width: 150px;
	height: 150px;
	cursor: move;
}

.minBox {
	position: absolute;
	height: 8px;
	width: 8px;
	background-color: white;
}

.left-up {
	top: -4px;
	left: -4px;
	cursor: nw-resize;
}

.up {
	left: 50%;
	margin-left: -4px;
	top: -4px;
	cursor: n-resize;
}

.right-up {
	right: -4px;
	top: -4px;
	cursor: ne-resize;
}

.left {
	top: 50%;
	margin-top: -4px;
	left: -4px;
	cursor: w-resize;
}

.right {
	top: 50%;
	margin-top: -4px;
	right: -4px;
	cursor: w-resize;
}

.left-down {
	bottom: -4px;
	left: -4px;
	cursor: sw-resize;
}

.down {
	bottom: -4px;
	left: 50%;
	margin-left: -4px;
	cursor: s-resize;
}

.right-down {
	bottom: -4px;
	right: -4px;
	cursor: se-resize;
}
/* 预览框 */
#preview {
	position: absolute;
	top: 0;
}

#preview #cropimg3 {
	position: absolute;
}

/* 上传图片区域 */
#uploadForm {
	float: left;
	margin: -2% 20% 5% 20%;
}

#uploadImage {
	position: relative;
	width: 372px;
	height: 202px;
	background-color: #40aff2;
	text-align: center;
}

#uploadImage #cropimg4 {
	position: absolute;
	height: 100%;
	width: 100%;
	padding: 0;
	margin: 0;
	top: 0;
	left: 0;
}

#uploadImage .addImage {
	display: inline-block;
	position: relative;
	min-width: 80px;
	height: 40px;
	overflow: hidden;
	padding: 0 30px;
	margin: 81px auto;
	border: none;
	background-color: #F3F3F3;
	color: #555;
	font: 14px/40px 'MicroSoft Yahei', 'Simhei';
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#uploadImage .addImage:HOVER {
	background-color: #DEDEDE;
}

#uploadImage #imgFile
	{
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 140px;
	height: 40px;
	cursor: pointer;
	cursor: hand;
	border: none;
	font-size: 0;
	padding: 0;
	/* older safari/Chrome browsers */ 
    -webkit-opacity: 0;  
    /* Netscape and Older than Firefox 0.9 */ 
    -moz-opacity: 0;  
    /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/ 
    -khtml-opacity: 0;  
    /* IE9 + etc...modern browsers */ 
    opacity: 0;  
    /* IE 4-9 */ 
    filter:alpha(opacity=0);  
    /*This works in IE 8 & 9 too*/ 
    -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";  
    /*IE4-IE9*/ 
    filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
}

#uploadImage #imgFile::-webkit-file-upload-button {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 140px;
	height: 40px;
	cursor: pointer;
	cursor: hand;
	border: none;
	font-size: 0;
	padding: 0;
	/* older safari/Chrome browsers */ 
    -webkit-opacity: 0;  
    /* Netscape and Older than Firefox 0.9 */ 
    -moz-opacity: 0;  
    /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/ 
    -khtml-opacity: 0;  
    /* IE9 + etc...modern browsers */ 
    opacity: 0;  
    /* IE 4-9 */ 
    filter:alpha(opacity=0);  
    /*This works in IE 8 & 9 too*/ 
    -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";  
    /*IE4-IE9*/ 
    filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
}
</style>
</head>

<body>
	<%-- 裁剪图片布局 --%>
	<div id="crop_image">
		<div id="crop_image_top">
			<h4>编辑图片</h4>
			<!-- <a>X</a> -->
		</div>

		<div id="crop_image_content">
			<%-- 裁剪部分 --%>
			<div id="cropBox">
				<img id="cropimg1" alt="" src="images/test.jpg"> 
				<img id="cropimg2" alt="" src="images/test.jpg">
				<%-- 裁剪框 --%>
				<div id="mainBox">
					<div id="left-up" class="minBox left-up"></div>
					<div id="up" class="minBox up"></div>
					<div id="right-up" class="minBox right-up"></div>
					<div id="left" class="minBox left"></div>
					<div id="right" class="minBox right"></div>
					<div id="left-down" class="minBox left-down"></div>
					<div id="down" class="minBox down"></div>
					<div id="right-down" class="minBox right-down"></div>
				</div>
			</div>
			<%-- 预览部分 --%>
			<div id="preview">
				<img id="cropimg3" alt="" src="images/test.jpg">
			</div>
		</div>
		
		<div id="crop_image_bottom">
			<input class="btn" type="button" value="取消">
			<input id="submitBtn" class="btn" type="button" value="确定" onclick="saveCropImage()">
		</div>
	</div>

	<!-- 上传图片表单 -->
	<form id="uploadForm" action="">
		<div id="uploadImage">
			<img id="cropimg4" alt="" src="images/test.jpg">
			<a href="javascript:;" class="addImage">
				<span>上传图片</span>
				<input id="imgFile" type="file" name="imgFile">
			</a>
		</div>
	</form>
</body>

<script type="text/javascript" src="js/clip-image.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">
 	$(function() {
 		<%--上传图片并预览--%>
		$('#imgFile').change(function(event) {
			// 根据这个 <input> 获取文件的 HTML5 js对象
			var files = event.target.files, file;
			if (files && files.length > 0) {
				// 获取目前上传的文件
				file = files[0];
				// 获取window的 URL工具
				var URL = window.URL || window.webkitURL;
				// 通过 file生成目标 url
				var imgURL = URL.createObjectURL(file);
				// 用这个URL产生一个 <img> 将其显示出来
				$('#cropimg1').attr('src', imgURL);
				$('#cropimg2').attr('src', imgURL);
				$('#cropimg3').attr('src', imgURL);
				$('#cropimg4').attr('src', imgURL);
			}
		});
	});
	
	<%--保存裁剪之后的图片--%>
	function saveCropImage() {
		// 需要获取裁剪之后，裁剪框的宽度和高度，以及裁剪框相对于裁剪图片的坐标位置
		var mainBox = document.getElementById("mainBox");
		// 裁剪框的宽度
		var width = mainBox.clientWidth;
		// 裁剪框的高度
		var height = mainBox.clientHeight;
		// 相对于裁剪图片x左边
		var x = mainBox.offsetLeft;
		// 相对于裁剪图片y左边
		var y = mainBox.offsetTop;
		
		alert(width);
		alert(height);
		alert(x);
		alert(y);
		
		// AjaxFileUpload提交
		// jQuery提交表单
	};
</script>
</html>
