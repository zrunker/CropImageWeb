// 实现图片裁剪功能
window.onload = function() {
	document.onselectstart=new Function('event.returnValue=false;');
	// 裁剪框拖动
	$("#mainBox").draggable({containment: 'parent', drag: setChoice});
	
	// 获取裁剪框移动范围
	var cropimgElem = document.getElementById("cropimg1");
	var cropimgElemWidth = cropimgElem.clientWidth;
	var cropimgElemHeight = cropimgElem.clientHeight;
	var cropimgElemPosition = getPosition(cropimgElem);
	var minX = cropimgElemPosition.left;// 待裁剪的图片最小x坐标
	var maxX = cropimgElemPosition.left + cropimgElemWidth;// 待裁剪的图片最大x坐标
	var minY = cropimgElemPosition.top;// 待裁剪的图片最小y坐标
	var maxY = cropimgElemPosition.top + cropimgElemHeight;// 待裁剪的图片最大y坐标
	
	// 动态设置父控件的宽度和高度
	var cropBox = document.getElementById("cropBox");
	cropBox.style.width = cropimgElemWidth + "px";
	cropBox.style.height = cropimgElemHeight + "px";
	// 预览框设置
	var preview = document.getElementById("preview");
	preview.style.width = cropimgElemWidth + "px";
	preview.style.height = cropimgElemHeight + "px";
	preview.style.left = cropimgElemWidth + 10 + "px";
	
	// 裁剪框内相关元素
	var mainBoxElem = document.getElementById("mainBox");// 裁剪框
	var rightElem = document.getElementById("right");
	var upElem = document.getElementById("up");
	var leftElem = document.getElementById("left");
	var downElem = document.getElementById("down");
	var leftUpElem = document.getElementById("left-up");
	var rightUpElem = document.getElementById("right-up");
	var leftDownElem = document.getElementById("left-down");
	var rightDownElem = document.getElementById("right-down");
	
	var ifKeyDown = false;// 鼠标按下事件
	var contact = "";// 表示被按下触点
	// 鼠标按下事件
	rightElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "right";
	};
	upElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "up";
	};
	leftElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "left";
	};
	downElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "down";
	};
	leftUpElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "left-up";
	};
	rightUpElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "right-up";
	};
	leftDownElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "left-down";
	};
	rightDownElem.onmousedown = function(e) {
		e.stopPropagation();
		ifKeyDown = true;
		contact = "right-down";
	};
	// 鼠标松开事件
	window.onmouseup = function(e) {
		ifKeyDown = false;
		contact = "";
	};
	// 鼠标移动事件
	window.onmousemove = function(e) {
		e.stopPropagation();
		if (ifKeyDown == true) {
			switch (contact) {
				case "right":
					rightMove(e);
					break;
				case "up":
					upMove(e);
					break;
				case "left":
					leftMove(e);
					break;
				case "down":
					downMove(e);
					break;
				case "left-up":
					leftMove(e);
					upMove(e);
					break;
				case "right-up":
					rightMove(e);
					upMove(e);
					break;
				case "left-down":
					leftMove(e);
					downMove(e);
					break;
				case "right-down":
					rightMove(e);
					downMove(e);
					break;
				default:
					break;
			}
			setChoice();
		}
	};
	
	setChoice();// 初始化选择区域可见
	
	// 右边移动
	function rightMove(e) {
		var x = e.clientX;// 鼠标x坐标
//		if(x > getPosition(cropimgElem).left + cropimgElem.offsetWidth){
//			x = getPosition(cropimgElem).left + cropimgElem.offsetWidth;
//		}
		if (x > maxX || x < minX) {
			return;
		}
		var widthBefore = mainBoxElem.offsetWidth -2;// 裁剪框变化前的宽度
		var addWidth = x - getPosition(mainBoxElem).left - widthBefore;// 鼠标移动后，裁剪框增加的宽度
		var width = widthBefore + addWidth;
		if (width < 1) {
			return;
		}
		mainBoxElem.style.width = width + "px";// 裁剪框变化后，设置宽度
	};

	// 上边移动
	function upMove(e) {
		var y = e.clientY;// 鼠标y坐标
//		if(y < getPosition(cropimgElem).top){
//			y = getPosition(cropimgElem).top;
//		}
		if (y > maxY || y < minY) {
			return;
		}
		var mainY = getPosition(mainBoxElem).top;// 裁剪框相对于屏幕上边的距离
		var addHeight = mainY - y;// 增加的高度
		var heightBefore = mainBoxElem.offsetHeight - 2;// 裁剪框变化前的高度
		var height = heightBefore + addHeight;
		if (height < 1) {
			return;
		}
		mainBoxElem.style.height = height + "px";// 裁剪框变化后，设置高度
		mainBoxElem.style.top = mainBoxElem.offsetTop - addHeight + "px";// 裁剪框相对于父控件的距离
	};

	// 左边移动
	function leftMove(e) {
		var x = e.clientX;// 鼠标x坐标
//		if(x < getPosition(cropimgElem).left){
//			x = getPosition(cropimgElem).left;
//		}
		if (x > maxX || x < minX) {
			return;
		}
		var mainX = getPosition(mainBoxElem).left;
		var widthBefore = mainBoxElem.offsetWidth -2;// 裁剪框变化前的宽度
		var addWidth = mainX - x;// 鼠标移动后，裁剪框增加的宽度
		var width = widthBefore + addWidth;
		if (width < 1) {
			return;
		}
		mainBoxElem.style.width = width + "px";// 裁剪框变化后，设置宽度
		mainBoxElem.style.left = mainBoxElem.offsetLeft - addWidth + "px";// 裁剪框变化后，设置到父元素左边的距离
	};

	// 下边移动
	function downMove(e) {
		var y = e.clientY;// 鼠标y坐标
//		if(y > getPosition(cropimgElem).top + cropimgElem.offsetHeight){
//			y = getPosition(cropimgElem).top + cropimgElem.offsetHeight;
//		}
		if (y > maxY || y < minY) {
			return;
		}
		var heightBefore = mainBoxElem.offsetHeight - 2;// 裁剪框变化前的高度
		var mainY = getPosition(mainBoxElem).top;// 裁剪框相对于屏幕上边的距离
		var addHeight = y - heightBefore - mainY;// 增加的高度
		var height = heightBefore + addHeight;
		if (height < 1) {
			return;
		}
		mainBoxElem.style.height = height + "px";// 裁剪框变化后，设置高度
	};
	
	// 设置裁剪框的位置
	function setChoice() {
		var top = mainBoxElem.offsetTop;
		var right = mainBoxElem.offsetLeft + mainBoxElem.offsetWidth;
		var bottom = mainBoxElem.offsetTop + mainBoxElem.offsetHeight;
		var left = mainBoxElem.offsetLeft;
		var cropimg2 = document.getElementById("cropimg2");
		cropimg2.style.clip = "rect(" + top + "px, " + right + "px, " + bottom + "px, " + left + "px)";
	
		setPreview();
	};
	
	// 预览函数
	function setPreview() {
		var top = mainBoxElem.offsetTop;
		var right = mainBoxElem.offsetLeft + mainBoxElem.offsetWidth;
		var bottom = mainBoxElem.offsetTop + mainBoxElem.offsetHeight;
		var left = mainBoxElem.offsetLeft;
		var previewImg = document.getElementById("cropimg3");
		previewImg.style.top = -top + "px";
		previewImg.style.left = -left + "px";
		previewImg.style.clip = "rect(" + top + "px, " + right + "px, " + bottom + "px, " + left + "px)";
	}
	
};

// 获取元素相对于屏幕左边的距离 offsetLeft，offsetTop
function getPosition(node) {
	var left = node.offsetLeft;
	var top = node.offsetTop;
	var parent = node.offsetParent;
	while (parent != null) {
		left += parent.offsetLeft;
		top += parent.offsetTop;
		parent = parent.offsetParent;
	}
	return {"left":left,"top":top};
};
