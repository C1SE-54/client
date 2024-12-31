<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- <link rel="stylesheet" href="views/css/home2.css">
    <link rel="stylesheet" href="views/css/home.css">
    <link rel="stylesheet" href="views/css/loadimages.css">  -->
	<link rel="stylesheet" href="/views/css/dialog.css">
</head>
<body>
<div class="main-header anim post-line" style="--delay: 0s">
	<img class="user-img" src="${user.avatar}" alt="">
	<button class="button-post" id="showDialog">
		Chào ${user.fullname.substring(user.fullname.lastIndexOf(" ")) }! Hôm
		nay bạn nghĩ gì nào?
		<!-- <div class="arrow">›</div> -->
	</button>
</div>
<%--<div class="dropdownNotification-content" id="box">--%>
<%--<h2>--%>
<%--	Thông báo <span>${latestPosts.size()}</span>--%>
<%--</h2>--%>

<%--<c:forEach items="${latestPosts}" var="post">--%>
<%--	<div class="notification">--%>
<%--		<!-- Hiển thị avatar của người dùng -->--%>
<%--		<img src="${post.user.avatar}" alt="Avatar" class="avatar">--%>

<%--		<!-- Thông tin bài viết -->--%>
<%--		<div class="text">--%>
<%--			<!-- Tên người dùng -->--%>
<%--			<h4>${post.user.fullname}</h4>--%>

<%--			<!-- Nội dung bài viết -->--%>
<%--			<p>${post.post}</p>--%>

<%--			<!-- Ngày đăng bài -->--%>
<%--			<span class="new-notifications">${post.date_Post}</span>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</c:forEach>--%>
<%--</div>--%>
<c:forEach items="${posts}" var="posts" >
	<div class="post">
		<div class="video-detail">
			<div class="video-content">
				<div class="video-p-wrapper anim" style="--delay: .1s">
					<div class="author-img__wrapper video-author video-p">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
							 stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
							 class="feather feather-check">
							<path d="M20 6L9 17l-5-5" />
						</svg>
						<a href="/profile/${ posts.post.user.ID}"><img
								class="author-img" src="${ posts.post.user.avatar }" /> <input
								type="text" value="${ posts.post.user.ID}" name="inputUserID"
								style="display: none;"> </a>

					</div>
					<div class="video-p-detail">
						<div class="video-p-name">@${ posts.post.user.fullname }</div>
						<div class="video-p-sub">${ posts.post.date_Post }</div>
					</div>

				</div>
				<div class="video-p-title anim" style="--delay: .2s;max-width: 800px;word-wrap: break-word;" >${ posts.post.post }
				</div>
				<div class="video-p-subtitle anim" style="--delay: .3s">Vị
					trí: ${ posts.post.address_Product }</div>
				<div class="video-p-subtitle anim" style="--delay: .4s">${ posts.post.hashTag }</div>
				<div class="div" style="z-index: 2;">
					<div class="list-img-post">
						<c:forEach items="${posts.images }" var="img">
							<img src="${img }" alt="">
							<hr>
						</c:forEach>
					</div>
					<div id="favDialog_comment${posts.post.ID}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="cmt-container">
									<div class="post">
										<div class="post-detail">
											<div class="full-boxer">
												<div class="comment__container opened" id="first-comment">
													<c:forEach items="${comments}" var="comment">
														<c:if test="${posts.post.ID == comment.comment.post.ID}">
															<div class="comment__card" id="comments-list${posts.post.ID}">
																<c:if test="${comment.comment.commentParent ==null}">
																	<div class="box-top">
																		<div class="Profile">
																			<div class="profile-image">
																				<img src="${comment.comment.user.avatar}"
																					 id="imgUserComment" >
																			</div>
																			<div class="Name">
																				<strong>${comment.comment.user.fullname} </strong>
																				<span>${comment.comment.dateComment}</span>
																			</div>
																		</div>
																	</div>
																	<p>${comment.comment.content}</p>
																</c:if>
																<c:if test="${comment.comment.commentParent ==null}">
																	<div class="comment__card-footer">
																		<div
																				style="cursor: pointer"
																				onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')">Trả
																			lời ${comment.countComment}</div>
																		<c:if test="${comment.countComment >0}">
																			<div class="show-replies"
																				 onclick="seenMore('${comment.comment.ID}')">Xem
																				thêm</div>
																		</c:if>

																	</div>
																</c:if>
																	<%-- <c:forEach items="${comments}" var="comment"> --%>
																<c:if test="${comment.comment.commentParent ==null}">
																	<div id="replyContentComment${comment.comment.ID}"></div>
																</c:if>
															</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
											<form>
												<div class="comment-box">
													<input type="text" id="comment-input${posts.post.ID}" name="postComment" placeholder="Bình luận">
													<button class="add-comment-btn" type="button" onclick="comment('${posts.post.ID}')">
														<i class="fa-regular fa-comment"></i>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%--		<div class="button-wrapper">--%>
<%--			<button class="like red">--%>
<%--				<svg viewBox="0 0 24 24" fill="currentColor"--%>
<%--					 xmlns="http://www.w3.org/2000/svg">--%>
<%--					<path fill-rule="evenodd" clip-rule="evenodd"--%>
<%--						  d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />--%>
<%--				</svg>--%>
<%--				Quan tâm--%>
<%--			</button>--%>
<%--			<button class="like">--%>
<%--				<svg viewBox="0 0 24 24" fill="currentColor"--%>
<%--					 xmlns="http://www.w3.org/2000/svg">--%>
<%--					<path--%>
<%--							d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z" />--%>
<%--				</svg>--%>
<%--				Chia sẻ--%>
<%--			</button>--%>
<%--			<button class="like cmt" data-toggle="modal"--%>
<%--					data-target="#favDialog_comment${ posts.post.ID }">--%>
<%--				<svg viewBox="0 0 24 24" fill="currentColor"--%>
<%--					 xmlns="http://www.w3.org/2000/svg">--%>
<%--					<path fill-rule="evenodd" clip-rule="evenodd"--%>
<%--						  d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z" />--%>
<%--				</svg>--%>
<%--				Bình luận--%>
<%--			</button>--%>
<%--		</div>--%>
	</div>

</c:forEach>

<!-- Dialog create post -->
<dialog id="favDialog">
	<div id="close_createPost">
		<i class="fa-solid fa-xmark"></i>
	</div>
	<div class="main_create_post">
		<div class="container">
			<div class="wrapper_createPost">
				<section class="post">
					<header> Đăng bài </header>
					<form action="/uploadImg" method="post"
						  enctype="multipart/form-data">
						<div class="content">
							<img src="${sessionScope.user.avatar}" alt="logo">
							<div class="details">
								<p>${sessionScope.user.fullname}</p>
								<div class="privacy" id="ststus_post"></div>
							</div>
						</div>
						<div class="content-post">
							<input type="text" placeholder="Tên cây trồng" name="product"
								   required>
							<textarea placeholder="Nội dung?" spellcheck="false"
									  name="content" required></textarea>
							<div id="images-to-upload"></div>
						</div>

						<div class="options">
							<p>Thêm vào bài viết của bạn</p>
							<ul class="list">
								<li><label> <img
										src="views/images/icons/gallery.svg" alt="gallery"> <input
										id="ip_images" type="file" accept="image/*" name="image_file"
								>
								</label></li>
							</ul>
						</div>
						<button>Post</button>
					</form>
				</section>
				<section class="audience">
					<header>
						<div class="arrow-back">
							<i class="fas fa-arrow-left"></i>
						</div>
						<p>Đối tượng của bài viết</p>
					</header>
					<div class="content">
						<p>Ai có thể xem bài đăng?</p>
					</div>
					<ul class="list">
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-globe-asia"></i>
								</div>
								<div class="details">
									<p>Công khai</p>
									<span>Tất cả mọi người đều có thể xem</span>
								</div>
							</div> <input type="radio" class="radio show_status" value="true"
										  name="radio" checked="checked">
						</li>
						<li>
							<div class="column">
								<div class="icon">
									<i class="fas fa-lock"></i>
								</div>
								<div class="details">
									<p>Riêng tư</p>
									<span>Chỉ bạn có thê thấy</span>
								</div>
							</div> <input type="radio" class="radio show_status" value="false"
										  name="radio">
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>
</dialog>
<script src="views/js/comment.js"></script>
</body>
</html>