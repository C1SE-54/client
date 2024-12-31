package com.davisy.dao;

import java.util.List;

import com.davisy.dto.CommentDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Comment;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	@Query(value = "SELECT *FROM COMMENT WHERE parent_comment_id =:id", nativeQuery = true)
	public List<Comment> findAllByIdComment(int id);

	@Query("SELECT c FROM Comment c JOIN FETCH c.user WHERE c.ID = :commentId")
	Comment findByIdComment(@Param("commentId") int commentId);


	@Query(value = "select *from COMMENT where postID =:id",nativeQuery = true)
	public List<Comment> findAllByPostId(int id);

		@Query(value = "select *from COMMENT where userID =:id",nativeQuery = true)
	public List<Comment> findByUserId(@Param("id") int id);
//	@Query("SELECT c.content, c.user.fullname, c.post.post, c.dateComment, c.user.avatar, c.ID " +
//			"FROM Comment c WHERE c.user.ID = :userId")
//	List<Object[]> findByUserId(@Param("userId") int userId);





	@Modifying
	@Transactional
	@Query(value = "DELETE FROM comment WHERE ID = :commentId", nativeQuery = true)
	void deleteCommentById(@Param("commentId") int commentId);
}
