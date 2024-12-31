package com.davisy.dto;

import com.davisy.entity.Comment;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CommentDTO {
    private String content;
    private String postName;
    private String postTitle;
    private String dateComment;
    private String avatar;
    private Integer ID;
    public CommentDTO(Comment comment) {
        this.content = comment.getContent();
        this.postName = comment.getUser().getFullname();
        this.postTitle = comment.getPost().getPost();
        this.dateComment = comment.getDateComment().toString();
        this.avatar=comment.getUser().getAvatar();
        this.ID= comment.getID();
    }
}
