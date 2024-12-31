package com.davisy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import java.util.Properties;
import java.util.List;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.davisy.dao.CommentDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Comment;
import com.davisy.entity.CommentEntity;
import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.CookieService;
import com.davisy.service.ParamService;
import com.davisy.service.SessionService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

@Controller
public class Run {
    @Autowired
    UserDao userdao;

    @Autowired
    FollowerDao followerDAO;

    @Autowired
    PostDao pdao;
    @Autowired
    CommentDao commentDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;

    @Autowired
    SessionService sessionService;
    @Autowired
    PostDao postDao;
    User acc = new User();

    private String maxacnhan = "";

    public void generateRandomNumbers() {
        String codeMail = "";
        for (int i = 0; i < 6; i++) {
            codeMail = codeMail + (int) (Math.floor(Math.random() * 9));

        }
        maxacnhan = codeMail;

    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

//	@GetMapping("/main")
//	public String index2(Model model) {
//		return "jsp/main";
//	}

    @GetMapping("/adminpage")
    public String adminpage(Model model) {
        return "jsp/adminpage";
    }

    @GetMapping("/forgot")
    public String forgot(Model model) {
        String emailForgot = request.getParameter("emailForgot");
        User emailSignup = userdao.findByEmail(emailForgot);

        if (emailForgot == null) {
            model.addAttribute("messageForgot", "Email không tồn tại!");
        } else {
            String username = "tk020803@gmail.com";
            String password = "cpfhyvvrctxzmsik";

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
            Session session = Session.getInstance(prop, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailForgot));
                message.setSubject("MÃ XÁC NHẬN ĐĂNG KÍ");
                generateRandomNumbers();
                message.setText("Mã xác nhận của bạn là : " + maxacnhan);
                Transport.send(message);
                System.out.println("Done");

            } catch (MessagingException e) {
                System.out.println("Fail");
                e.printStackTrace();
            }
        }
        return "forgotpassword";
    }

//	@GetMapping("/")
//	public String getLatesPosts (Model model){
//		List<Post> posts = pdao.findLatestPosts(2);
//		model.addAttribute("latestPosts",posts);
//		return "/layout/_menu";
//	}

    @GetMapping("/history/{userId}")
    public String history(Model model, @PathVariable String userId, HttpSession session) {
        // Lấy User từ session
        User userSession = (User) session.getAttribute("user");
        if (userSession == null) {
            return "redirect:/login";
        }

        int idUser = Integer.parseInt(userId);

        List<Comment> comments = commentDao.findByUserId(idUser);
        model.addAttribute("comments", comments);

        return "jsp/history";
    }
    @RequestMapping(value = "/delete/{commentId}", method = RequestMethod.POST)
    public String deleteComment(@PathVariable("commentId") int commentId, RedirectAttributes redirectAttributes) {
        Comment comment = commentDao.findByIdComment(commentId);
        if (comment != null) {
            commentDao.deleteCommentById(commentId);
            redirectAttributes.addFlashAttribute("message", "Xóa bình luận thành công!");
        } else {
            redirectAttributes.addFlashAttribute("message", "Không tìm thấy bình luận!");
        }
        return "redirect:/history/" + comment.getUser().getID();
    }

    @GetMapping("/message")
    public String message(Model model) {
        return "jsp/message";
    }


    @GetMapping("/error404")
    public String error404(Model model) {
        return "jsp/error404";
    }

}
