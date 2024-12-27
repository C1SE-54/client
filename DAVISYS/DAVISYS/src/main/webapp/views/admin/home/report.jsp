<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="views/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="views/css/admindpage.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <script src="https://kit.fontawesome.com/152112956f.js"
            crossorigin="anonymous"></script>
</head>

<body>
<section class="main">
    <div class="container_admin">
        <div class="bg-white shadow rounded-lg d-block d-sm-flex">
            <div class="profile-tab-nav border-right">
                <div class="p-2">
                    <h4 class="text-center" id="fullname">Quản lý</h4>
                </div>
                <div class="nav flex-column nav-pills" id="v-pills-tab"
                     role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="post-management-tab"
                       data-toggle="pill" href="#post-management" role="tab"
                       aria-controls="post-management" aria-selected="true"> <i
                            class="fa-solid fa-list"></i> Bài đăng của người dùng
                    </a> <a class="nav-link" id="account-management-tab"
                            data-toggle="pill" href="#account-management" role="tab"
                            aria-controls="account-management" aria-selected="false"> <i
                        class="fa-solid fa-user"></i> Tài khoản người dùng
                </a> <a class="nav-link" id="statistical-tab" data-toggle="pill"
                        href="#statistical" role="tab" aria-controls="statistical"
                        aria-selected="false"> <i class="fa-solid fa-chart-column"></i>
                    Thống kê
                </a>
                </div>
            </div>
            <div class="tab-content p-2 p-md-3" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="post-management"
                     role="tabpanel" aria-labelledby="post-management-tab">
                    <div class="header-title">
                        <h4 class="title-tab">Quản lý bài đăng</h4>
                        <div class="checkAll">
                            <%--								<input type="checkbox" class="checkDeleteAll"> <span>Bài--%>
                            <%--									viết vi phạm</span>--%>
                        </div>
                    </div>
                    <div id="manage-tab">
                        <table class="table table-striped">
                            <thead>
                            <tr style="background-color: #0aa0f7;">
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">STT</th>
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">Ảnh</th>
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">Nội dung bài viết</th>
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">Người đăng</th>
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">Ngày đăng</th>
                                <th scope="col" style="color: #1a1623; font-size: 20px; font-weight: bolder;">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${posts}" var="post" varStatus="loop">
                                <tr>
                                <c:if test="${user.user_Role == true}">
                                    <td>${loop.index +1}</td>
                                    <td>
                                        <c:forEach items="${post.images}" var="img" begin="0" end="0">
                                            <img src="${post.post.link_Image}" alt="${post.post.product}" class="thumb" style="max-width: 100px;">
                                        </c:forEach>
                                    </td>
                                    <td style="max-width: 500px; color: #1a1623;">${post.post.post}</td>
                                    <td style="color: #1a1623;">${post.post.user.fullname}</td>
                                    <td style="color: #1a1623;">${post.post.date_Post}</td>
                                    <td>
                                        <form action="/admin/report/deletePost/${post.post.ID}" method="POST" onsubmit="return confirmDelete()">
                                            <input type="hidden" name="_method" value="DELETE">
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                        </form>
                                    </td>
                                </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="tab-pane fade" id="account-management" role="tabpanel"
                     aria-labelledby="account-management-tab">
                    <div class="tabs">
                        <input type="radio" id="tab1" name="tab-control" checked>
                        <input type="radio" id="tab2" name="tab-control">
                        <ul>
                            <li title="Likes" class="${active1}"><label for="tab1" role="button">
                                <i class="fa-solid fa-thumbs-up"></i> <br> <span>Tài
											khoản</span>
                            </label></li>
                            <li title="Account" class="${active2}"><label for="tab2" role="button">
                                <i class="fa-solid fa-users"></i> <br> <span>Thông
											tin</span>
                            </label></li>
                        </ul>
                        <div class="slider">
                            <div class="indicator"></div>
                        </div>
                        <div class="content-tab3">
                            <section class="${active1}">
                                <h2>Tài khoản</h2>
                                <table class="rwd-table">
                                    <thead>
                                    <tr style="background-color: #0aa0f7">
                                        <th>STT</th>
                                        <th>Ảnh</th>
                                        <th>Họ và tên</th>
                                        <th >Action</th>
                                    </tr>
                                    </thead>
                                    <tbody style="color: #1a1623">
                                    <c:forEach items="${users}" var="user" varStatus="loop">
                                        <tr>
                                            <c:if test="${user.user_Role != true}">
                                            <td>${loop.index}</td>
                                            <td data-th="Tên"><img src="${user.avatar}"
                                                                   class="thumb" width="50px"/></td>
                                            <td data-th="Số bài đăng">${user.fullname}</td>
                                            <td><a href="/edit/${user.username}">Xem chi tiết</a></td>
<%--                                            <td>--%>
<%--                                                <form action="/admin/report/deleteUser/${user.ID}" method="POST" onsubmit="return confirmDelete()">--%>
<%--                                                    <input type="hidden" name="_method" value="DELETE">--%>
<%--                                                    <button type="submit" class="btn btn-danger">Xóa</button>--%>
<%--                                                </form>--%>
<%--                                            </td>--%>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </section>
                            <section class="${active2}">
                                <form>
                                    <p>${messageban}</p>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Tên đăng nhập</label> <input
                                                type="email" name="username" value="${Users .username}"
                                                class="form-control" id="inputEmail4" placeholder=""
                                                readonly>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Mật khẩu</label> <input
                                                type="password" value="${Users .password}"
                                                class="form-control" id="inputPassword4" placeholder=""
                                                readonly>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Họ và tên</label> <input
                                                type="email" value="${Users .fullname}"
                                                class="form-control" id="inputEmail4" placeholder=""
                                                readonly>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Email</label> <input type="text"
                                                                                             value="${Users .email}"
                                                                                             class="form-control"
                                                                                             id="inputPassword4"
                                                                                             placeholder="" readonly>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputCity">Ngày sinh</label> <input type="date"
                                                                                            value="${Users .birthday}"
                                                                                            class="form-control" id=""
                                                                                            readonly>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="inputCity">Giới tính</label> <input type="text"
                                                                                            value="${Users .gender}"
                                                                                            class="form-control" id=""
                                                                                            readonly>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="inputZip">Điểm</label> <input type="text"
                                                                                      value="${Users .mark}"
                                                                                      class="form-control" id=""
                                                                                      readonly>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="inputZip">Báo cáo</label> <input type="text"
                                                                                         value="${Users .ban}"
                                                                                         class="form-control" id=""
                                                                                         readonly>
                                        </div>
                                    </div>

                                    <button type="submit" formaction="/ban"
                                            class="btn btn-danger">Vô hiệu hóa tài khoản
                                    </button>
                                    <button type="submit" formaction="/onban"
                                            class="btn btn-success">Mở tài khoản
                                    </button>
                                </form>
                            </section>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="statistical" role="tabpanel" aria-labelledby="statistical-tab">
                    <div class="tabs">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="tab1-tab" data-bs-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">
                                    <i class="fa-solid fa-thumbs-up"></i> <br> <span>Bài đăng</span>
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="tab2-tab" data-bs-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">
                                    <i class="fa-solid fa-users"></i> <br> <span>Tài khoản</span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
                                <h2>Bài đăng</h2>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Ảnh</th>
                                        <th>Người đăng</th>
                                        <th>Lượt thích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${postsReport}" var="postR">
                                        <tr>
                                            <td><img src="${postR[1]}" alt="" class="img-fluid" width="100px"></td>
                                            <td>${postR[2]}</td>
                                            <td>${postR[3]}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                                <h2>Tài khoản</h2>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Điểm</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${usersReport}" var="usersR">
                                        <tr>
                                            <td>${usersR.fullname}</td>
                                            <td>${usersR.mark}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function confirmDelete() {
        // Hiển thị hộp thoại xác nhận trước khi gửi form
        return confirm("Bạn có chắc chắn muốn xóa?");
    }
</script>
</body>
</html>