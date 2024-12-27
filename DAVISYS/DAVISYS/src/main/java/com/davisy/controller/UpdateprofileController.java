package com.davisy.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.davisy.dao.ProvinceDao;
import com.davisy.dao.UserDao;

import com.davisy.entity.Province;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
public class UpdateprofileController {
    @Autowired
    UserDao userDao;
    @Autowired
    ProvinceDao provinceDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    SessionService sessionService;
    @Autowired
    ServletContext app;

    public static String renameFile(String fileName, String id) {
        return FilenameUtils.getBaseName(id) + ".png";
    }

    @ModelAttribute("listTP")
    public List<Province> list(Model m) {
        return provinceDao.findAll();
    }

    @GetMapping("/updatepro")
    public String profile(Model model) {
        User userSession = sessionService.get("user");
        if (userSession == null) {
            return "error";
        }
        return "jsp/updateprofile";
    }

    @PostMapping("/updatepro")
    public String profile2(Model model, @RequestParam("file") MultipartFile file) {
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");

        String pattern = "yyyy-MM-dd";
        User user = sessionService.get("user");
        User findUser = userDao.findByUsername(username);
        User use = userDao.findIdUser(user.getID());
        User findEmail = userDao.findByEmail(email);

        // Kiểm tra trùng lặp username
        if (!username.equals(user.getUsername()) && findUser != null) {
            model.addAttribute("messageupdate", "Tên đăng nhập đã tồn tại!");
            return "jsp/updateprofile";
        }

// Kiểm tra trùng lặp email
        if (!email.equals(user.getEmail()) && findEmail != null) {
            model.addAttribute("messageupdate", "Email đã tồn tại!");
            return "jsp/updateprofile";
        }

// Kiểm tra khi cả username và email đều thay đổi
        if (!email.equals(user.getEmail()) && !username.equals(user.getUsername())) {
            if (findEmail != null) {
                model.addAttribute("messageupdate", "Email đã tồn tại!");
                return "jsp/updateprofile";
            }
            if (findUser != null) {
                model.addAttribute("messageupdate", "Tên đăng nhập đã tồn tại!");
                return "jsp/updateprofile";
            }
        }


        // Cập nhật ngày sinh
        DateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            Date date = dateFormat.parse(birthday);
            use.setBirthday(date);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Xử lý ảnh đại diện
        try {
            String uploadRootPath = app.getRealPath("/views/images/user/");
            String newName = user.getUsername(); // Đặt tên file theo tên người dùng
            File uploadRootDir = new File(uploadRootPath);
            if (!uploadRootDir.exists()) {
                uploadRootDir.mkdirs();
            }

            String fileName = file.getOriginalFilename();
            File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator + UpdateprofileController.renameFile(fileName, newName));
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(file.getBytes());
            stream.close();
            use.setAvatar("/views/images/user/" + newName + ".png");
        } catch (Exception e) {
            System.out.println("Lỗi upload ảnh: " + e);
            return "jsp/updateprofile";
        }

        // Cập nhật các thông tin còn lại
        Province pr = provinceDao.findIdProvince(Integer.valueOf(address));
        use.setUsername(username);
        use.setFullname(fullname);
        use.setEmail(email);
        use.setGender(gender);
        use.setProvince(pr);

        // Lưu lại vào cơ sở dữ liệu và cập nhật session
        userDao.saveAndFlush(use);
        sessionService.set("user", use);

        // Thêm thông báo thành công
        model.addAttribute("messageupdate", "Cập nhật thành công!");

        return "jsp/updateprofile";
    }


    @RequestMapping("/huy")
    public String huy() {
        return "redirect:/updatepro";
    }
}