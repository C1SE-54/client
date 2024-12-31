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
    <link rel="stylesheet" href="views/css/history.css">
    <!-- <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script
        src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     -->
    <script src="https://kit.fontawesome.com/152112956f.js"
            crossorigin="anonymous"></script>
</head>
<style>
    /* Thông báo thành công */
    .alert {
        padding: 15px;
        background-color: #4CAF50; /* Green */
        color: white;
        margin-bottom: 20px;
        border-radius: 5px;
        text-align: center;
    }

    .alert-success {
        background-color: #28a745;
    }

    .alert-success:hover {
        background-color: #218838;
    }

    /* Modal Styling */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 60px;
    }

    .modal-content {
        background-color: #fff;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        text-align: center;
        border-radius: 8px;
    }

    .close {
        color: #aaa;
        font-size: 28px;
        font-weight: bold;
        position: absolute;
        top: 10px;
        right: 25px;
        font-family: Arial, sans-serif;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }

    .delete-btn {
        background-color: #ff6347; /* Red */
        color: white;
        border: none;
    }

    .delete-btn:hover {
        background-color: #ff4500;
    }

    .confirm-btn {
        background-color: #28a745; /* Green */
        color: white;
        border: none;
    }

    .confirm-btn:hover {
        background-color: #218838;
    }

    .cancel-btn {
        background-color: #f0f0f0;
        color: #333;
        border: none;
    }

    .cancel-btn:hover {
        background-color: #ccc;
    }

    /* Bảng */
    table {
        width: 1000px;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: Arial, sans-serif;
    }

    /* Các ô trong bảng */
    th, td {
        font-size: 25px;
        text-align: center;
        padding: 10px;
        border: 1px solid #ddd;
    }

    /* Tiêu đề cột */
    th {
        background-color: #f2f2f2;
        color: #333;
    }

    /* Các dòng trong bảng khi hover */
    tr:hover {
        background-color: #f5f5f5;
    }

    /* Ảnh bài đăng */
    .thumb {
        border-radius: 5px;
        object-fit: cover;
    }

    /* Nút "Xóa bình luận" */
    button {
        background-color: #ff4d4d;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #ff1a1a;
    }

    /* Căn chỉnh ảnh và nội dung */
    td img {
        display: block;
        margin: 0 auto;
    }

    td {
        vertical-align: middle;
    }

    /* Thêm khoảng cách giữa các dòng */
    tbody tr {
        line-height: 1.6;
    }

</style>
<body>
<!-- main section -->
<section class="main">
    <div class="container_history">
        <div class="shadow rounded-lg d-block d-sm-flex">
            <div class="profile-tab-nav border-right">
                <div class="p-4">
                    <h4 class="text-center" id="fullname">Nhật ký hoạt động</h4>
                </div>
                <div class="nav flex-column nav-pills" id="v-pills-tab"
                     role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="interact-tab" data-toggle="pill"
                       href="#interact" role="tab" aria-controls="interact"
                       aria-selected="true"> <i class="fa-solid fa-comment"></i>
                        Lịch sử bình luận
                    </a>
                </div>
            </div>
            <div class="tab-content p-2 p-md-4" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="interact"
                     role="tabpanel" aria-labelledby="interact-tab">
                    <h4 class="mb-4">Lượt tương tác</h4>
                    <div class="deleteAll">
                    </div>
                    <div id="tab-history">
                        <table>
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Ảnh bài đăng</th>
                                <th>Người đăng</th>
                                <th>Nội dung bình luận</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="comment" items="${comments}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td><img src="${comment.post.link_Image}" class="thumb" height="100px"
                                         width="100px"/></td>
                                <td>${comment.user.fullname}</td>
                                <td>${comment.content}</td>
                                <td>
                                    <form action="/delete/${comment.ID}" method="post" id="deleteForm${comment.ID}">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                        <button type="button" class="delete-btn" onclick="showConfirmDelete(${comment.ID})">Xóa bình luận</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                            </tbody>
                        </table>
                        <c:forEach var="comment" items="${comments}">
                            <div id="confirmDeleteModal${comment.ID}" class="modal">
                                <div class="modal-content">
                                    <span class="close" onclick="closeConfirmDelete(${comment.ID})">&times;</span>
                                    <h3>Bạn có chắc chắn muốn xóa bình luận này?</h3>
                                    <button class="confirm-btn" onclick="confirmDelete(${comment.ID})">Xóa</button>
                                    <button class="cancel-btn" onclick="closeConfirmDelete(${comment.ID})">Hủy</button>
                                </div>
                            </div>
                        </c:forEach>

<%--                        <c:if test="${not empty message}">--%>
<%--                            <div class="alert alert-success">--%>
<%--                                    ${message}--%>
<%--                            </div>--%>
<%--                        </c:if><c:if test="${not empty message}">--%>
<%--                        <div class="alert alert-success">--%>
<%--                                ${message}--%>
<%--                        </div>--%>
<%--                    </c:if>--%>
                        <div id="successModal" class="modal">
                            <div class="modal-content">
                                <span class="close" onclick="closeSuccessModal()">&times;</span>
                                <h3>${message}</h3>
                                <button class="confirm-btn" onclick="window.location.reload()">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    // Show Confirm Modal
    function showConfirmDelete(commentId) {
        console.log('Show confirm delete modal for comment ID:', commentId);  // Kiểm tra console
        document.getElementById('confirmDeleteModal' + commentId).style.display = "block";
    }

    // Close Confirm Modal
    function closeConfirmDelete(commentId) {
        console.log('Close confirm delete modal for comment ID:', commentId);  // Kiểm tra console
        document.getElementById('confirmDeleteModal' + commentId).style.display = "none";
    }

    // Confirm Deletion
    function confirmDelete(commentId) {
        console.log('Confirming delete for comment ID:', commentId);  // Kiểm tra console
        document.getElementById('deleteForm' + commentId).submit();  // Submit the form to delete
    }

    <c:if test="${not empty message}">
    document.getElementById('successModal').style.display = "block";
    </c:if>

    // Đóng modal
    function closeSuccessModal() {
        document.getElementById('successModal').style.display = "none";
    }
</script>
</body>
</html>