<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/views/css/message.css">
<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
<style>
	.countMessages {
		display: inline-block;
		background-color: #ff4d4f; /* Màu nền đỏ */
		color: white;             /* Màu chữ trắng */
		font-size: 12px;          /* Kích thước chữ */
		font-weight: bold;        /* Chữ đậm */
		border-radius: 50%;       /* Bo tròn */
		width: 20px;              /* Chiều rộng */
		height: 20px;             /* Chiều cao */
		line-height: 20px;        /* Căn giữa theo chiều dọc */
		text-align: center;       /* Căn giữa theo chiều ngang */
		margin-left: 5px;         /* Khoảng cách với chữ */
		position: relative;       /* Định vị */
		top: -5px;                /* Điều chỉnh vị trí dọc */
		right: -5px;              /* Điều chỉnh vị trí ngang */
	}

</style>
<body>
	<div class="main-blogs">
		<div class="row chat-main">
			<input type="text" id="userName"
				value="${sessionScope.user.username}"
				style="margin-bottom: 10px; display: none" /> <input type="text"
				id="userAvatar" value="${sessionScope.user.avatar}"
				style="margin-bottom: 10px; display: none" />
			<section class="discussions" id="usersList">
				<!-- <div class="discussion search">
								<div class="searchbar">
									<i class="fa fa-search" aria-hidden="true"></i>
									<input type="text" placeholder="Search..."></input>
								</div>
							</div> -->
			</section>
			<section class="chat-disscus">
				<div class="header-chat">
					<div id="selectedUserImageId"></div>
					<div id="selectedUserId"></div>
				</div>
				<div class="messages-chat"></div>
				<div class="footer-chat">
					<input type="file" id="image-input" accept="image/*" style="font-size: 25pt; display: none;" onchange="previewImage(event)">
					<label for="image-input" style="font-size: 25pt; cursor: pointer;">
						<i class="fa fa-image" aria-hidden="true"></i>
					</label>
					<input type="text" class="write-message" placeholder="Nhập tin nhắn tại đây" name="message-to-send" id="message-to-send">
						<!-- <i id="sendBtn"
						class="icon send fa fa-paper-plane-o clickable" aria-hidden="true"></i> -->
				</div>
			</section>
		</div>
	</div>
	<script src="views/js/dialog.js"></script>
	<script src="views/js/chat.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const userName = document.getElementById("userName").value;
			registration(userName);
		});
	</script>
	<script id="message-template" type="text/x-handlebars-template">
					<div class="message text-only">
						<div class="response">
							<p class="text">{{messageOutput}}</p>
						</div>
					</div>
					<p class="response-time time">{{time}}, Today</p>
</script>
	<script id="message-response-template"
		type="text/x-handlebars-template">
					<div class="message">
						<div class="photo"
							style="background-image: url({{Img}});">
							<div class="online"></div>
						</div>
						<p class="text"> {{response}}</p>
					</div>
					<p class="time">{{time}}, Today</p></script>
</body>
</html>