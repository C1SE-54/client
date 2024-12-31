<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/views/css/profile.css">
        <script src="/views/js/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>--%>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">--%>
</head>
<style>
    .profile-section {
        margin-top: 500px;
        /*margin-top: 20px;  !* Tạo khoảng cách giữa phần video và profile *!*/
        padding: 20px;
        background-color: #f8f9fa; /* Màu nền sáng cho phần profile */
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .profile-section .form-control {
        margin-bottom: 15px;
    }

    .profile-section img {
        max-width: 100%;
        height: auto;
        display: block;
        margin-bottom: 10px;
    }

    .profile-section .btn {
        margin-top: 10px;
    }
    .video-p-wrapper {
        position: relative;
        width: 100%;
        height: 300px;  /* Đảm bảo chiều cao đủ lớn để hiển thị ảnh nền đầy đủ */
    }


</style>
<body>
<div class="video-detail">
    <div class="video-content">
        <div class="video-p-wrapper anim prof" style="--delay: .1s">
            <img src="https://angurvad-5559e.web.app/img/in-post/2020-10-07/header.jpg" alt="" class="background-prof">
            <div class="bc-p"></div>
            <div class="prof-item">
                <div class="author-img__wrapper video-author video-p video-author-prof">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="30" stroke-linecap="round"
                         stroke-linejoin="round" class="feather feather-check">
                        <path d="M20 6L9 17l-5-5"/>
                    </svg>
                    <img class="author-img author-img_prof" src="${usersProfile.avatar }" alt="User Avatar"/>
                </div>
            </div>
        </div>
        <div class="details-prof anim">
            <div class="nam profile-p-detail">
                <div class="profile-p-name">${usersProfile.fullname }</div>
            </div>
        </div>
    </div>
</div>
<form method="POST" action="/updatepost/${updatepost.ID}" enctype="multipart/form-data">
<div class="profile-section">  <!-- Change this line -->
    <h5 class="" style="color: #1a1623;text-align: center;font-size: 35px">Cập nhật bài đăng</h5>
    <div class="mb-3">
        <div class="mb-3">
            <label for="image" class="form-label">Hình ảnh</label>

            <!-- Sử dụng một div hoặc nút để người dùng nhấp vào -->
            <div id="uploadArea" class="upload-area">
                <img src="${updatepost.link_Image}" id="image" alt="Post Image" class="img-thumbnail" name="imageUrl">
<%--                <span class="upload-text">Chọn hình ảnh</span>--%>
            </div>
            <input name="imageUrl" type="file" id="fileInput" style="display: none;" accept="image/*" onchange="previewImage(event)">
        </div>

    </div>
    <div class="mb-3">
        <label for="postContent" class="form-label">Nội dung bài viết</label>
        <textarea class="form-control" id="postContent" name="postContent" rows="5">${updatepost.post}</textarea>
    </div>
    <div class="mb-3">
        <label for="productName" class="form-label">Tên cây trồng</label>
        <input class="form-control" id="productName" name="productName" value="${updatepost.product}" placeholder="Tên cây trồng" required
               type="text">
    </div>
    <div class="mb-3">
        <label for="hashtag" class="form-label">Hashtag</label>
        <input class="form-control" id="hashtag"name="hashtag" value="${updatepost.hashTag}" placeholder="Hashtag" required
               type="text">
    </div>
    <div class="mb-3">
        <label for="location" class="form-label">Vị trí</label>
<%--        <input class="form-control" id="location" placeholder="Vị trí" required type="text">--%>
        <select class="form-select mt-2" name="address" id="address">
            <option value="${updatepost.address_Product}">${updatepost.address_Product}</option>
            <c:forEach items="${listTP}" var="location">
                <option value="${location.code}">${location.name}</option>
            </c:forEach>
        </select>
    </div>
    <input type="hidden" name="postId" value = ${updatepost.ID}>
    <div class="mb-3">
        <button type="button" class="btn btn-secondary" onclick="window.location.href='/profile/${user.ID}'">Thoát
        </button>
        <button id="updatePost" type="submit" class="btn btn-primary">Cập nhật</button>
    </div>
</div>
</form>
<script>
    function previewImage(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function() {
            const imageElement = document.getElementById('image');
            imageElement.src = reader.result; // Hiển thị ảnh được chọn
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    // Khi nhấp vào div, kích hoạt chọn file
    document.getElementById('uploadArea').addEventListener('click', function() {
        document.getElementById('fileInput').click();
    });


</script>
<script src="/views/js/profile.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>