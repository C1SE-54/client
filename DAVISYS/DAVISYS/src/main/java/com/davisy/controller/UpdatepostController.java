package com.davisy.controller;

import javax.servlet.http.HttpServletRequest;

import com.davisy.dao.ProvinceDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Province;
import com.davisy.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import com.davisy.dao.PostDao;
import com.davisy.entity.Post;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Controller
public class UpdatepostController {

	@Autowired
	PostDao postDao;
	@Autowired
	UserDao userdao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	ProvinceDao provinceDao;
	@GetMapping("/updatepost/{idPost}")
	public String updatePost(@PathVariable String idPost, Model model) {
		try {
			int id = Integer.valueOf(idPost);
			User userSession = (User) request.getSession().getAttribute("user");
			if (userSession == null) {
				return "redirect:/login";
			}
			int userId = userSession.getID();

			Post updatepost = postDao.findByIdPost(id);
			if (updatepost == null) {
				System.out.println("ID không tồn tại.");
				return "error";
			}

			User userProfile = userdao.findIdUser(userId);

			List<Province> listTP = provinceDao.getAllProvince();


			model.addAttribute("usersProfile", userProfile);
			model.addAttribute("updatepost", updatepost);
			model.addAttribute("listTP",listTP);

			System.out.println(updatepost.getPost());
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "jsp/updatepost";
	}
	@PostMapping("/updatepost/{postId}")
	public String updatePost(@RequestParam(value = "postContent", required = false, defaultValue = "") String postContent,
							 @RequestParam(value = "productName", required = false, defaultValue = "") String productName,
							 @RequestParam(value = "hashtag", required = false, defaultValue = "") String hashtag,
							 @RequestParam(value = "address", required = false, defaultValue = "") String address,
							 @RequestParam(value = "imageUrl", required = false) MultipartFile imageUrl,
							 @PathVariable("postId") int postId,
							 Model model) {
		User userSession = (User) request.getSession().getAttribute("user");
		if (userSession == null) {
			return "redirect:/login";
		}

		// Kiểm tra nếu có file ảnh
		if (!imageUrl.isEmpty() && imageUrl != null) {
			try {
				// Đặt tên file theo tên tài khoản người dùng và thời gian để đảm bảo tính duy nhất
				String userName = userSession.getUsername();
				String fileName = userName + "_" + System.currentTimeMillis() + "_" + imageUrl.getOriginalFilename();

				// Định nghĩa đường dẫn để lưu ảnh
				String uploadDir = "C:\\CAPSTON1\\client\\DAVISYS\\DAVISYS\\src\\main\\webapp\\views\\images\\a";
				Path dirPath = Paths.get(uploadDir);
				Path path = dirPath.resolve(fileName);
				String filePath = path.toString();
				String webAppPath = filePath.substring(filePath.indexOf("views"));

				// Chuyển đổi thành đường dẫn mà trình duyệt có thể sử dụng
				String result = "/" + webAppPath.replace("\\", "/");
				// Lưu file vào thư mục
				Files.copy(imageUrl.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				// Lưu đường dẫn ảnh vào cơ sở dữ liệu
				Post post = postDao.findById(postId).orElse(null);
				post.setPost(postContent);
				post.setProduct(productName);
				post.setHashTag(hashtag);
				post.setAddress_Product(address);
				post.setLink_Image(result);
				postDao.save(post);
//				String result = postDao.updatePost(postContent, productName, hashtag, address, imagePath, postId);
				if (post == null) {
					return "redirect:/profile/" + userSession.getID();
				}
			} catch (IOException e) {
				e.printStackTrace();
				return "error";
			}
		} else {
			Post post = postDao.findById(postId).orElse(null);
			post.setPost(postContent);
			post.setProduct(productName);
			post.setHashTag(hashtag);
			post.setAddress_Product(address);
			postDao.save(post);
		}

		return "redirect:/profile/" + userSession.getID();
	}


}
