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
	text-align: left;
	min-height: 202px;
	min-width: 372px;
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

#uploadImage #imgFile {
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
			<img src="" id="target" alt="待裁剪图片" />
		</div>
	
		<div id="crop_image_bottom">
			<input class="btn" type="button" value="取消">
			<input id="submitBtn" class="btn" type="button" value="确定" onclick="saveCropImage()">
		</div>
	</div>
	
	<!-- 上传图片表单 -->
	<form id="uploadForm" action="<%=basePath%>web/image/upload" method="post" enctype="multipart/form-data">
		<div id="uploadImage">
			<img id="cropimg" alt="" src="">
			<a href="javascript:;" class="addImage">
				<span>上传图片</span>
				<input id="imgFile" type="file" name="imgFile">
			</a>
		</div>
		<input id="x" type="hidden" name="x">
		<input id="y" type="hidden" name="y">
		<input id="width" type="hidden" name="width">
		<input id="height" type="hidden" name="height">
	</form>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.Jcrop.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	var width;// 裁剪框的宽度
	var height;// // 裁剪框的高度
	var x;// 相对于裁剪图片x左边
	var y;// 相对于裁剪图片y左边
	var api = null;// 定义一个全局api，这样操作起来比较灵活
	$(function() {
		<%--上传图片并预览--%>
		$('#imgFile').change(function(event) {
			// 根据这个 <input> 获取文件的 HTML5 js对象
			var files = event.target.files, file;
			if (files && files.length > 0) {
				// 获取目前上传的文件
				file = files[0];

				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					$('#target').removeAttr('src');
					$('#target').attr('src', e.target.result);
					$('#cropimg').attr('src', e.target.result);
					
					api = $.Jcrop('#target', {
						setSelect : [ 20, 20, 150, 150 ],
						aspectRatio : 1,
						onSelect : updateCoords
					});
				};
				
				if (api != undefined) {
					api.destroy();
				}
				 
				function updateCoords(obj) {
					width = obj.w;
					height = obj.h;
					x = obj.x;
					y = obj.y;
					
					$("#x").val(obj.x);
	                $("#y").val(obj.y);
	                $("#width").val(obj.w);
	                $("#height").val(obj.h);
				};
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
	
		<%-- // 直接执行表单提交
		$('#uploadForm').submit();  --%>
		
		<%-- // ajaxFileUpload提交
		$.ajaxFileUpload({
			url : '<%=basePath%>web/image/upload', // 用于文件上传的服务器端请求地址
			data : {
                x : x,
                y : y,
                width : width,
                height : height
            },
			secureuri : false, // 是否需要安全协议，一般设置为false
			fileElementId : 'imgFile', // 文件上传域的ID
			dataType : 'json', // 返回值类型 一般设置为json
			success : function(data, status) {// 服务器成功响应处理函数
				
			},
			error : function(data, status, e) {// 服务器响应失败处理函数
				
			}
		});  --%>
		
		// Ajax Post提交
		var form = new FormData(document.getElementById("uploadForm"));  
		$.ajax({
			url : "<%=basePath%>web/image/upload",  
			type : "post",  
			data : form,  
			cache : false,  
			processData : false,  
			contentType : false,  
			success : function(result) {  
				if (result) {
					if (result.resultCode == 0) {
						$('#cropimg').attr('src', result.data);
					} else {
						alert(result.resultMsg);  
					}
				} else {

				}
			},  
			error : function(e) {  
				alert("网络错误，请重试！！");  
			}
		});
		
	};
</script>
</html>


