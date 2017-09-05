package cc.zimageoper.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/image")
public class UpLoadImageController {
	
	@RequestMapping(value = "/upload")
	@ResponseBody
	public void uploadImage(
			@RequestParam(value = "x", required = false) String x,
			@RequestParam(value = "y", required = false) String y,
			@RequestParam(value = "height", required = false) String height,
			@RequestParam(value = "width", required = false) String width,
			@RequestParam(value = "imgFile") MultipartFile imageFile,
			HttpServletRequest request) {

		
		// 实现图片裁剪
		
	}

	@RequestMapping(value = "/crop")
	@ResponseBody
	public void cropImage(
			@RequestParam(value = "x", required = false) String x,
			@RequestParam(value = "y", required = false) String y,
			@RequestParam(value = "height", required = false) String height,
			@RequestParam(value = "width", required = false) String width,
			HttpServletRequest request) {

		
		// 实现图片裁剪
		
	}

}
