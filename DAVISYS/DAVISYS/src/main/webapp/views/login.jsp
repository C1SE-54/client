<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="google-signin-client_id"
          content="829042615252-9cgbgmdc55famceanr15b20dq3kns76m.apps.googleusercontent.com">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="/views/css/login.css">
    <script src="https://kit.fontawesome.com/152112956f.js" crossorigin="anonymous"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body>
<section class="reason">
    <div class="section__container reason__container">
        <div class="left_content">
            <div>
                <div class="section__title">
                    <div class="animated-word">
                        <div class="letter">A</div>
                        <div class="letter">G</div>
                        <div class="letter">R</div>
                        <div class="letter">I</div>
                        <div class="letter">A</div>
                        <div class="letter">D</div>
                        <div class="letter">V</div>
                        <div class="letter">I</div>
                        <div class="letter">S</div>
                        <div class="letter">O</div>
                        <div class="letter">R</div>
                    </div>
                    Diễn đàn về cây trồng
                </div>
                <p class="section__subtitle">
                    Chào mừng bạn đến với AGRIADVISOR <br>
                    Nơi bạn có thể trao đổi thông tin về cây trồng miễn phí !!!
                </p>
                <div class="return">
                    Quay lại
                    <a href="index">trang chủ</a>
                </div>
            </div>

        </div>
        <div class="right_content">
            <div class="login-card-container">
                <div class="login-card">
                    <div class="login-card-logo">
                 <img src="/views/images/Screenshot 2024-12-31 100605.png" alt="logo">

                    </div>
                    <div class="login-card-header">
                        <h1>Đăng nhập</h1>
                        <div>Vui lòng đăng nhập để sử dụng diễn đàn</div>
                        <span class="error">${message}</span>
                    </div>
                    <form class="login-card-form" action="/login" method="post">
                        <div class="form-item">
                                <span class="form-item-icon material-symbols-rounded">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                            <input type="text" placeholder="Tên đăng nhập" value="${usernames}" name="usernamelg"
                                   id="usernameForm"
                                   required>
                        </div>
                        <div class="form-item">
                                <span class="form-item-icon material-symbols-rounded">
                                    <i class="fa-solid fa-lock"></i>
                                </span>
                            <input type="password" value="${passwords}" placeholder="Mật khẩu" name="passwordlg"
                                   id="passwordForm"
                                   required>
                            <span class="form-item-icon-eye hide-show-pass">
                                    <i onclick="showHidePass()" class="fa-regular fa-eye" id="eye"></i>
                                </span>
                        </div>
                        <div class="form-item-other">
                            <div class="checkbox">
                                <input type="checkbox" name="remember" value="true" id="rememberMeCheckbox">
                                <label for="rememberMeCheckbox">Duy trì đăng nhập</label>
                            </div>
                            <a href="forgot">Quên mật khẩu!</a>
                        </div>
                        <button type="submit">Đăng nhập</button>
                    </form>
                </div>
                <div class="striped">
                    <span class="striped-line"></span>
                    <span class="striped-text">Or</span>
                    <span class="striped-line"></span>
                </div>
                <div class="method">
                    <div class="method-control">
                        <div id="g_id_onload"
                             data-client_id="201406685721-tare83nq3f9vk784crjh80aecglmrbed.apps.googleusercontent.com"
                             data-ux_mode="redirect"
                             data-callback="handleCredentialResponse" data-login_uri="/home"></div>
                        <div class="g_id_signin" data-type="standard"></div>

                    </div>
                </div>
                <div class="login-card-footer">
                    Bạn chưa có tài khoản? <a href="signup">Đăng ký</a>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="views/js/show_hidePass.js"></script>
</body>
</html>