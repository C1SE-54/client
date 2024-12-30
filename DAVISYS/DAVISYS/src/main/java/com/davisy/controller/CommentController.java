package com.davisy.controller;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davisy.dto.CommentDTO;
import com.davisy.request.CommentRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.davisy.dao.CommentDao;
import com.davisy.dao.PostDao;
import com.davisy.entity.Comment;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@RestController
@CrossOrigin
public class CommentController {
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	@Autowired
	SessionService sessionService;
	@Autowired
	CommentDao commentDao;
	@Autowired
	PostDao postDao;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpServletRequest request;

	@PostMapping("/PostComment/{idPost}")
	public ResponseEntity<?> comment(@PathVariable String idPost, @RequestBody CommentRequest commentRequest) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}
		try {
			int id = Integer.valueOf(idPost);
			int idReply = 0;
			Post post = postDao.findByIdPost(id);
			Comment cm = new Comment();
			cm.setContent(commentRequest.getCommentContent());
			cm.setPost(post);
			cm.setUser(userSession);
			cm.setDateComment(day());
			if (!commentRequest.getRepCommentIdUser().isEmpty()) {
				idReply = Integer.valueOf(commentRequest.getRepCommentIdUser());
				Comment parentComment = commentDao.findByIdComment(idReply);
				cm.setCommentParent(parentComment);
			}

			Comment savedComment = commentDao.save(cm);
//			// Return the newly created comment (it can be appended directly to the DOM)
			CommentDTO commentDTO = new CommentDTO(savedComment);
			return ResponseEntity.ok(commentDTO);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}
	}

	private int countUniqueCommenters(List<Comment> comments) {
		Set<Integer> uniqueUsers = new HashSet<>();
		for (Comment comment : comments) {
			uniqueUsers.add(comment.getUser().getID());
		}
		return uniqueUsers.size();
	}
	@GetMapping("/loadReplyComment")
	public void loadReplyComment(@RequestParam("idComment") String idComment) {

		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int id = Integer.valueOf(idComment);
			List<Comment> comList = commentDao.findAllByIdComment(id);
			PrintWriter out = response.getWriter();
			for (Comment cmt : comList) {
				out.println("<div class=\"comment__container\" dataset=\"first-comment\"\r\n"
						+ "																id=\"first-reply\">\r\n"
						+ "																<div class=\"comment__card\">\r\n"
						+ "																	<div class=\"box-top\">\r\n"
						+ "																		<div class=\"Profile\">\r\n"
						+ "																			<div class=\"profile-image\">\r\n"
						+ "																				<img src=\""
						+ cmt.getUser().getAvatar() + "\">\r\n"
						+ "																			</div>\r\n"
						+ "																			<div class=\"Name\">\r\n"
						+ "																				<strong>"
						+ cmt.getUser().getFullname() + "</strong> <span>@" + cmt.getUser().getUsername()
						+ "</span>\r\n"
						+ "																			</div>\r\n"
						+ "																		</div>\r\n"
						+ "																	</div>\r\n"
						+ "																	<p>" + cmt.getContent()
						+ "</p>\r\n" + "																</div>\r\n"
						+ "															</div>");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public java.sql.Date day() {
		return day;
	}
}
