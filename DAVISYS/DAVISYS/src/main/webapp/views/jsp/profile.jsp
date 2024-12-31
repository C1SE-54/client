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

    <!-- <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script
        src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://kit.fontawesome.com/152112956f.js"
        crossorigin="anonymous"></script> -->

    <link rel="stylesheet" href="/views/css/profile.css">
    <script src="/views/js/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</head>
<style>
    /* CSS cho dropdown */
    .dropdown {
        margin-left: 20px;
        position: relative;
    }

    /* Nút dropdown */
    .dropdown-toggle {
        background-color: #007bff; /* Màu nền xanh dương */
        color: white; /* Màu chữ trắng */
        border: none; /* Loại bỏ viền */
        padding: 10px 20px; /* Khoảng cách bên trong nút */
        font-size: 16px; /* Kích thước chữ */
        border-radius: 5px; /* Bo góc cho nút */
        cursor: pointer; /* Thêm con trỏ khi hover */
        transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu nền */
    }

    .dropdown-toggle:hover {
        background-color: #0056b3; /* Màu nền khi hover */
    }

    /* CSS cho dropdown-menu */
    .dropdown-menu {
        position: absolute;
        top: 100%; /* Đảm bảo menu hiện ra dưới nút */
        left: 0;
        right: 0;
        background-color: #ffffff; /* Màu nền trắng cho menu */
        border-radius: 5px; /* Bo góc cho menu */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Đổ bóng cho menu */
        min-width: 200px; /* Chiều rộng tối thiểu của menu */
        padding: 10px 0; /* Khoảng cách trong menu */
        z-index: 999; /* Đảm bảo menu nằm trên các phần tử khác */
        display: none; /* Ẩn menu mặc định */
    }

    /* Hiển thị menu khi mở dropdown */
    .dropdown-menu.show {
        display: block;
    }

    /* CSS cho các mục trong dropdown */
    .dropdown-menu button {
        background: none;
        border: none;
        width: 100%;
        text-align: left; /* Căn lề trái cho chữ */
        padding: 10px 20px; /* Khoảng cách bên trong các mục */
        font-size: 14px; /* Kích thước chữ */
        color: #007bff; /* Màu chữ */
        cursor: pointer; /* Thêm con trỏ khi hover */
        transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu nền */
    }

    .dropdown-menu button:hover {
        background-color: #f1f1f1; /* Màu nền khi hover */
        color: #0056b3; /* Màu chữ khi hover */
    }

    /* CSS cho nút Xóa bài viết */
    .delete-btn {
        background: none;
        border: none;
        color: #dc3545; /* Màu đỏ cho nút xóa */
        padding: 10px 20px;
        font-size: 14px;
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .delete-btn:hover {
        background-color: #f8d7da; /* Màu nền đỏ nhạt khi hover */
    }

    /* Thêm hiệu ứng cho dropdown khi được mở */
    .dropdown-toggle::after {
        content: '\25BC'; /* Mũi tên xuống */
        margin-left: 10px; /* Khoảng cách giữa chữ và mũi tên */
    }

    /* Điều chỉnh mũi tên khi dropdown đang mở */
    .dropdown-toggle[aria-expanded="true"]::after {
        content: '\25B2'; /* Mũi tên lên khi mở dropdown */
    }

</style>
<body>
<div class="video-detail">
    <div class="video-content">
        <div class="video-p-wrapper anim prof" style="--delay: .1s">
            <img
                    src="https://angurvad-5559e.web.app/img/in-post/2020-10-07/header.jpg"
                    alt="" class="background-prof">
            <div class="bc-p"></div>
            <div class="prof-item">
                <div
                        class="author-img__wrapper video-author video-p video-author-prof">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-check">
                        <path d="M20 6L9 17l-5-5"/>
                    </svg>
                    <img class="author-img author-img_prof"
                         src="${ usersProfile.avatar }"/>
                </div>
            </div>
        </div>
        <div class="details-prof anim">
            <div class="nam profile-p-detail">
                <div class="profile-p-name">${ usersProfile.fullname }</div>
            </div>
            <div class="fl">
<%--                <p>4567 Người theo dõi</p>--%>
                <!-- <p>4567 Đang theo dõi</p> -->
            </div>
        </div>

        <c:forEach items="${listPost}" var="posts">
            <div class="post">
                <div class="video-detail">
                    <div class="video-content">
                        <div class="video-p-wrapper anim" style="--delay: .1s">
                            <div class="author-img__wrapper video-author video-p">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="3" stroke-linecap="round"
                                     stroke-linejoin="round" class="feather feather-check">
                                    <path d="M20 6L9 17l-5-5"/>
                                </svg>
                                <a href="/profile/${posts.post.user.ID}"><img
                                        class="author-img" src="${ posts.post.user.avatar }"/> <input
                                        type="text" value="${ posts.post.user.ID}" name="inputUserID"
                                        style="display: none;"> </a>

                            </div>
                            <div class="video-p-detail">
                                <div class="video-p-name">${ posts.post.user.fullname }</div>
                                <div class="video-p-sub">${ posts.post.date_Post }</div>
                            </div>

                        </div>
                        <div class="video-p-title anim" style="--delay: .2s">${ posts.post.post }
                        </div>
                        <div class="video-p-subtitle anim" style="--delay: .3s">Vị
                            trí: ${ posts.post.address_Product }</div>
                        <div class="video-p-subtitle anim" style="--delay: .4s">${ posts.post.hashTag }</div>
                        <div class="div" style="z-index: 2;">
                            <div class="list-img-post">
                                <c:forEach items="${ posts.images }" var="img">
                                    <img src="${img}" alt="">
                                    <hr>
                                </c:forEach>
                            </div>
                            <div id="favDialog_comment${posts.post.ID }">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- <div id="close_cmt" data-dismiss="modal">
                                    <i class="fa-solid fa-xmark"></i>
                                </div> -->
                                        <div class="cmt-container">
                                            <div class="post">
                                                <div class="post-detail">
                                                    <div class="full-boxer">
                                                        <div class="comment__container opened" id="first-comment">
                                                            <c:forEach items="${comments}" var="comment">
                                                                <c:if
                                                                        test="${posts.post.ID == comment.comment.post.ID}">
                                                                    <div class="comment__card">
                                                                        <c:if test="${comment.comment.commentParent ==null}">
                                                                            <div class="box-top">
                                                                                <div class="Profile">
                                                                                    <div class="profile-image">
                                                                                        <img src="${ comment.comment.user.avatar}"
                                                                                             id="imgUserComment">
                                                                                    </div>
                                                                                    <div class="Name">
                                                                                        <strong>${comment.comment.user.fullname}
                                                                                        </strong>
                                                                                        <span>${comment.comment.dateComment}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <p>${comment.comment.content}</p>
                                                                        </c:if>
                                                                        <c:if test="${comment.comment.commentParent ==null}">
                                                                            <div class="comment__card-footer">
                                                                                <div
                                                                                        onclick="repComment('${comment.comment.ID}','${comment.comment.user.fullname}','${posts.post.ID}')">
                                                                                    Trả
                                                                                    lời ${comment.countComment}</div>
                                                                                <c:if test="${comment.countComment >0}">
                                                                                    <div class="show-replies"
                                                                                         onclick="seenMore('${comment.comment.ID}')">
                                                                                        Xem
                                                                                        thêm
                                                                                    </div>
                                                                                </c:if>

                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                    <%-- <c:forEach items="${comments}" var="comment"> --%>
                                                                    <c:if test="${comment.comment.commentParent ==null}">
                                                                        <div id="replyContentComment${comment.comment.ID}"></div>
                                                                    </c:if>
                                                                    <%-- </c:forEach> --%>
                                                                </c:if>

                                                            </c:forEach>
                                                        </div>

                                                    </div>

                                                    <!-- <div class="detail-intracables" style="margin-top: 1rem;">
                                                <i class="fa-regular fa-paper-plane"></i> <i
                                                    class="fa-solid fa-share"></i>
                                            </div>
                                            <span class="interest">10 Lượt quan tâm</span> -->
                                                    <form>
                                                        <div class="comment-box">
                                                            <input type="text" id="comment-input${posts.post.ID}"
                                                                   name="postComment" placeholder="Bình luận" required>
                                                            <button class="add-comment-btn"
                                                                    onclick="comment('${posts.post.ID }')">
                                                                <i class="fa-regular fa-comment"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                        <%--														<c:set var="uniqueUsers" value="${empty uniqueUsers ? new java.util.HashSet() : uniqueUsers}" />--%>
                                                        <%--														<c:forEach items="${comments}" var="comment">--%>
                                                        <%--															<c:set var="userId" value="${comment.comment.user.ID}" />--%>
                                                        <%--															<c:if test="${!uniqueUsers.contains(userId)}">--%>
                                                        <%--																<c:set var="uniqueUsers" value="${uniqueUsers.add(userId) ? uniqueUsers : uniqueUsers}" />--%>
                                                        <%--															</c:if>--%>
                                                        <%--														</c:forEach>--%>
                                                        <%--														<span class="comment-count">${uniqueUsers.size()} người đã bình luận</span>--%>
                                                        <%--                                                    <span class="comment-count">50 bình luận</span>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-wrapper">
                    <button class="like red">
                        <svg viewBox="0 0 24 24" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z"/>
                        </svg>
                        Quan tâm
                    </button>
                    <button class="like">
                        <svg viewBox="0 0 24 24" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path
                                    d="M21.435 2.582a1.933 1.933 0 00-1.93-.503L3.408 6.759a1.92 1.92 0 00-1.384 1.522c-.142.75.355 1.704 1.003 2.102l5.033 3.094a1.304 1.304 0 001.61-.194l5.763-5.799a.734.734 0 011.06 0c.29.292.29.765 0 1.067l-5.773 5.8c-.428.43-.508 1.1-.193 1.62l3.075 5.083c.36.604.98.946 1.66.946.08 0 .17 0 .251-.01.78-.1 1.4-.634 1.63-1.39l4.773-16.075c.21-.685.02-1.43-.48-1.943z"/>
                        </svg>
                        Chia sẻ
                    </button>
                    <button class="like cmt" formaction="/updatepost/${posts.post.ID}"
                            data-target="#favDialog_updatePost"
                            data-toggle="modal">
                        <svg viewBox="0 0 24 24" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M15.85 2.5c.63 0 1.26.09 1.86.29 3.69 1.2 5.02 5.25 3.91 8.79a12.728 12.728 0 01-3.01 4.81 38.456 38.456 0 01-6.33 4.96l-.25.15-.26-.16a38.093 38.093 0 01-6.37-4.96 12.933 12.933 0 01-3.01-4.8c-1.13-3.54.2-7.59 3.93-8.81.29-.1.59-.17.89-.21h.12c.28-.04.56-.06.84-.06h.11c.63.02 1.24.13 1.83.33h.06c.04.02.07.04.09.06.22.07.43.15.63.26l.38.17c.092.05.195.125.284.19.056.04.107.077.146.1l.05.03c.085.05.175.102.25.16a6.263 6.263 0 013.85-1.3zm2.66 7.2c.41-.01.76-.34.79-.76v-.12a3.3 3.3 0 00-2.11-3.16.8.8 0 00-1.01.5c-.14.42.08.88.5 1.03.64.24 1.07.87 1.07 1.57v.03a.86.86 0 00.19.62c.14.17.35.27.57.29z"/>
                        </svg>
                        Bình luận
                    </button>
                    <!-- Dropdown để hiển thị các nút -->
                    <div class="dropdown" style="margin-left: 20px">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Xem thêm
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <!-- Nút 1: Chỉnh sửa bài viết -->
                            <button onclick="window.location.href='/updatepost/${posts.post.ID}'">Chỉnh sửa bài viết
                            </button>


                            <!-- Nút 2: Xoa bài viết -->
                            <form action="/deletePost/${posts.post.ID}" method="post" id="deleteForm${posts.post.ID}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <button type="button" class="delete-btn" onclick="showConfirmDelete(${posts.post.ID})">Xóa bài viết</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <div id="confirmDeleteModal${posts.post.ID}" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeConfirmDelete(${posts.post.ID})">&times;</span>
                    <h3>Bạn có chắc chắn muốn xóa bài viết này?</h3>
                    <button class="confirm-btn" onclick="confirmDelete(${posts.post.ID})">Xóa</button>
                    <button class="cancel-btn" onclick="closeConfirmDelete(${posts.post.ID})">Hủy</button>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<script>

    function showConfirmDelete(postId) {
        console.log("Show confirm delete modal for postId: " + postId);
        const modal = document.getElementById('confirmDeleteModal' + postId);
        if (modal) {
            modal.style.display = "block";
        }
    }

    function closeConfirmDelete(postId) {
        console.log("Close confirm delete modal for postId: " + postId);
        const modal = document.getElementById('confirmDeleteModal' + postId);
        if (modal) {
            modal.style.display = "none";
        }
    }

    function confirmDelete(postId) {
        console.log("Confirm delete for postId: " + postId);
        const form = document.getElementById('deleteForm' + postId);
        if (form) {
            form.submit();
        }
    }
</script>
<script src="/views/js/profile.js"></script>
</body>
</html>