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

<link rel="stylesheet" href="views/css/updateprofile.css">

<script src="https://kit.fontawesome.com/152112956f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<section>

		<form action="/updatepro" method="POST" enctype="multipart/form-data">
			<div class="">
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<label> <img src="${user.avatar}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
									<input name="file" type="file" style="display: none;"> </label>
								<h5 class="my-3">${user.fullname}</h5>
<%--								<p class="text-muted mb-4">13 bài viết</p>--%>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Họ và tên</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" value="${user.fullname}" name="fullname" required>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Tên đăng nhập</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" value="${user.username}" name="username" required>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Mật khẩu</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" type="password" value="${user.password}" name="password" readonly>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Email</p>
									</div>
									<div class="col-sm-9">
										<input class="text-muted mb-0" value="${user.email}" name="email" required>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Ngày sinh</p>
									</div>
									<div class="col-sm-9">
										<input type="date" class="text-muted mb-0" value="${user.birthday}" name="birthday" required>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Giới tính</p>
									</div>
									<div class="col-sm-9">
										<select class="text-muted mb-0" name="gender" id="gender">
											<option value="${user.gender}" selected>${user.gender}</option>
											<option value="Nam">Nam</option>
											<option value="Nữ">Nữ</option>
											<option value="Khác">Khác</option>
										</select>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Địa chỉ</p>
									</div>
									<div class="col-sm-9">
										<select class="text-muted mb-0" name="address" id="address">
											<option value="${user.province.code}" selected>${user.province.name}</option>
											<c:forEach items="${listTP}" var="add">
												<option value="${add.code}">${add.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<hr>
								<p>${messageupdate}</p>
								<div class="row">
									<div class="col-sm-3 btn-updateprofile">
										<button type="submit" class="btn btn-primary">Cập nhật</button>
										<a href="http://localhost:8080/main" style="text-decoration: none; background-color: #dddddd;padding: 12px;border-radius: 5px">Hủy</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</section>
</body>
</html>