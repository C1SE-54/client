package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Post;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface PostDao extends JpaRepository<Post, Integer> {

    @Query(value = " SELECT * FROM POST  WHERE ID=(SELECT MAX(ID) FROM POST )", nativeQuery = true)
    public Post maxId();

    @Query(value = "SELECT * FROM POST  WHERE ID =:id", nativeQuery = true)
    public Post findByIdPost(int id);

    //	@Query(value = "SELECT * FROM POST  WHERE userId= :id1", nativeQuery = true)
//	public List<Post> findByListPostById(int id1);
    @Query(value = "SELECT * FROM POST WHERE userId = :id1 ORDER BY ID DESC", nativeQuery = true)
    public List<Post> findByListPostById(int id1);

    @Modifying
    @Transactional
    @Query("DELETE FROM Interested i WHERE i.post.ID = :id")
    public void deleteInterestedByPostId(@Param("id") int postId);



    @Modifying
    @Transactional
    @Query("DELETE FROM Post p WHERE p.ID = :id")
    public void deletePostById(@Param("id") int postId);



    @Modifying
    @Transactional
    @Query("UPDATE Post p SET p.post = :postContent, p.product = :productName, p.hashTag = :hashtag, p.address_Product = :address, p.link_Image = :imageUrl WHERE p.ID = :postId")
    public String updatePost(@Param("postContent") String postContent,
                             @Param("productName") String productName,
                             @Param("hashtag") String hashtag,
                             @Param("address") String address,
                             @Param("imageUrl") String imageUrl,
                             @Param("postId") int postId);

    @Modifying
    @Transactional
    @Query("DELETE FROM User u WHERE u.ID = :id")
    public void deleteUserById(@Param("id") int id);
    @Query("select p from Post p order by p.ID desc ")
    List<Post> fillAllPost();

    @Query(value = "SELECT * FROM Post WHERE post LIKE %?1%", nativeQuery = true)
    List<Post> findByPostContent(String keyword);

    @Query(value = "SELECT p.id, p.link_image, u.fullname, COUNT(i.postID) AS interestedCount "
            + "FROM POST p INNER JOIN INTERESTED i ON p.ID = i.postID "
            + "INNER JOIN USERS u ON p.userid = u.id GROUP BY p.id, p.link_image, u.fullname "
            + "ORDER BY COUNT(i.postid) DESC", nativeQuery = true)
    public List<Object[]> getReportPost();

    @Query(value = "SELECT COUNT(POST.ID) FROM POST WHERE MONTH(POST.DATE_POST)=:id", nativeQuery = true)
    public int totalPostMonth(int id);

    @Query(value = "SELECT ((SELECT COUNT(POST.ID) * 100 FROM POST WHERE POST.SEND_STATUSID = '1') / (SELECT COUNT(POST.ID) FROM POST))", nativeQuery = true)
    public int percentPostSend();

    @Query(value = "SELECT COUNT(POST.GET_REPORT) FROM POST WHERE DAY(POST.DATE_POST) =:id", nativeQuery = true)
    public int totalReportPostToday(int id);

    @Query(value = "SELECT MONTH(DATE_POST) AS MONTH, COUNT(*) FROM POST GROUP BY MONTH(DATE_POST) ORDER BY MONTH(DATE_POST) ASC", nativeQuery = true)
    public List<Object[]> totalPostAllMonth();

    @Query(value = "SELECT TOP 3 POST.PRODUCT, COUNT(*) AS AMOUNT FROM POST GROUP BY POST.PRODUCT ORDER BY AMOUNT DESC", nativeQuery = true)
    public List<Object[]> top3Product();
//    @Query(value = "SELECT * FROM post ORDER BY date_Post DESC LIMIT :limit", nativeQuery = true)
//    List<Post> findLatestPosts(@Param("limit") int limit);


}
