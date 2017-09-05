package cc.zimageoper.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cc.zimageoper.dto.ResultData;

@Controller
@RequestMapping("/web/image")
public class UpLoadImageController {
	
	private String serverurl = "http://localhost:8080/ZImageOper/";
	
	/**
	 * 上传裁剪图片，在实际生产中要进行分模块进行开发（MVC模式）
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public ResultData<String> uploadImage(
			@RequestParam(value = "x", required = false) int x,
			@RequestParam(value = "y", required = false) int y,
			@RequestParam(value = "height", required = false) int height,
			@RequestParam(value = "width", required = false) int width,
			@RequestParam(value = "imgFile") MultipartFile imgFile,
			HttpServletRequest request) {

		String imgUrl = null;// 新图片地址
		int resultCode;// 状态码
		String resultMsg;// 状态说明
		try {
			// 接收图片
			if (!imgFile.isEmpty()) {
				// 保存图片
				String realPath = request.getServletContext().getRealPath("/");
				String resourcePath = "images" + File.separator + "upload" + File.separator;
				String fileName = System.currentTimeMillis() + imgFile.getOriginalFilename();
				File file = new File(realPath + resourcePath, fileName);
				FileUtils.copyInputStreamToFile(imgFile.getInputStream(), file);
				// 实现图片裁剪
				Thumbnails.of(file)
						.sourceRegion(x, y, width, height)
						.size(width, height)
						.keepAspectRatio(false)
						.toFile(file);
				// 获取新图片地址
				imgUrl = (serverurl + resourcePath).replaceAll("\\\\", "/") + fileName;
				System.out.println(imgUrl);
				
				if (imgUrl == null || imgUrl.length() <= 0) {
					resultCode = 2;
					resultMsg = "生成图片地址失败";
				} else {
					resultCode = 0;
					resultMsg = "成功";
				}
			} else {
				resultCode = 1;
				resultMsg = "图片不能为空";
			}
		} catch (IOException e) {
			e.printStackTrace();
			resultCode = -1;
			resultMsg = "服务端异常";
		}
		
		return new ResultData<>(resultCode, resultMsg, imgUrl);
	}

}
