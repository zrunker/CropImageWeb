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

<link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
<style type="text/css">
/* Apply these styles only when #preview-pane has
   been placed within the Jcrop widget */
.jcrop-holder #preview-pane {
	display: block;
	position: absolute;
	z-index: 2000;
	top: 10px;
	right: -280px;
	padding: 6px;
	border: 1px rgba(0, 0, 0, .4) solid;
	background-color: white;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
	box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here */
#preview-pane .preview-container {
	width: 250px;
	height: 170px;
	overflow: hidden;
}
</style>
<%-- 公共body样式 --%>
<link rel="stylesheet" rev="stylesheet" href="css/common/body.css" type="text/css" />
<style type="text/css">
#crop_image {
	float: left;
	width: 55%;
	background-color: #333;
	user-select: none;
	margin: 10% 20%;
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

#uploadImage #cropimg {
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
		</div>
		
		<div id="crop_image_content">
			<img src="images/test.jpg" id="target" alt="待裁剪图片" />
			<!-- 预览 -->
			<div id="preview-pane">
				<div class="preview-container">
					<img src="images/test.jpg" class="jcrop-preview" alt="Preview" />
				</div>
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
			<img id="cropimg" alt="" src="images/test.jpg">
			<a href="javascript:;" class="addImage">
				<span>上传图片</span>
				<input id="imgFile" type="file" name="imgFile">
			</a>
		</div>
	</form>
	
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.Jcrop.js"></script>
<script type="text/javascript">
	var width;// 裁剪框的宽度
	var height;// 裁剪框的高度
	var x;// 相对于裁剪图片x左边
	var y;// 相对于裁剪图片y左边
	var jcrop_api;
	// 实现裁剪
	jQuery(function($) {
		// 创建变量(在这个生命周期)的API和图像大小
		var jcrop_api = null, boundx, boundy,
		
		// 获取预览窗格相关信息
		$preview = $('#preview-pane'), 
		$pcnt = $('#preview-pane .preview-container'), 
		$pimg = $('#preview-pane .preview-container img'),

		xsize = $pcnt.width(), ysize = $pcnt.height();

		$('#target').Jcrop({
			setSelect: [ 20, 20, 150, 150 ],
			// allowResize:false,
			onChange : updatePreview,
			onSelect : updatePreview,
			aspectRatio : xsize / ysize
		}, function() {
			// 使用API来获得真实的图像大小
			var bounds = this.getBounds();
			boundx = bounds[0];
			boundy = bounds[1];
			// jcrop_api变量中存储API
			jcrop_api = this;

			// 预览进入jcrop容器css定位
			$preview.appendTo(jcrop_api.ui.holder);
		});

		function updatePreview(c) {
			// 设置预览
			if (parseInt(c.w) > 0) {
				var rx = xsize / c.w;
				var ry = ysize / c.h;
				$pimg.css({
					width : Math.round(rx * boundx) + 'px',
					height : Math.round(ry * boundy) + 'px',
					marginLeft : '-' + Math.round(rx * c.x) + 'px',
					marginTop : '-' + Math.round(ry * c.y) + 'px'
				});
			}
			// 赋值
			x = c.x;
		    y = c.y;
		    width = c.w;
		    height = c.h;
		};
		
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
				if (jcrop_api) {
					jcrop_api.setImage(imgURL);
				}
				
				$('#cropimg').attr('src', imgURL);
				$('.jcrop-preview').attr('src', imgURL);
			}
		});
	});

	<%--保存裁剪之后的图片--%>
	function saveCropImage() {
		// 需要获取裁剪之后，裁剪框的宽度和高度，以及裁剪框相对于裁剪图片的坐标位置
		alert(width);
		alert(height);
		alert(x);
		alert(y);
		
		// Ajax提交
		
	};
</script>
</html>


