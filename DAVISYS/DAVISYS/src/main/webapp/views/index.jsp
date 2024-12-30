<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giới thiệu</title>
<link rel="stylesheet" href="views/css/style.css">

</head>
<style>
    .destination__card a{
        text-decoration: none;
    }
</style>
<body>
 <header>
        <div class="section__container header__container">
            <div class="header__image">
                <img src="views/images/index1.jpg" />
                <img src="views/images/index2.jpg" />
            </div>
            <div class="header__content">
                <div>
                    <div>
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
                        <h1> Diễn đàn về cây trồng </h1>
                    </div>
                    <p class="section__subtitle">
                        <br>
                        Đăng nhập ngay để trao đổi thông tin về cây trồng miễn phí !!!
                    </p>
                    <div class="action__btns">
                        <a class="btn" href="login">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section class="introduce">
        <div class="section__container introduce__container">
            <h2 class="section__title">Diễn đàn AGRIADVISOR</h2>
            <p class="section__subtitle">
                Nơi mọi người có thể chia sẻ và trao đổi kiến thức về nông nghiệp. <br>
                Mỗi câu hỏi hay bài viết đều mang theo những câu chuyện và kinh nghiệm quý báu, giúp kết nối cộng đồng nông dân và chuyên gia với nhau.
                <br> Hãy tham gia vào diễn đàn của chúng tôi để cùng nhau lan tỏa tri thức, xây dựng tình đoàn kết và hướng tới một nền nông nghiệp bền vững.
            </p>
            <div class="destination__grid">
                <div class="destination__card">
                    <img src="views/images/product/caytrong.jpg" alt="destination" />
                    <div class="destination__details" >
                        <a href="http://localhost:8080/index/caytrong" style="color: white">
                            <p class="destination__subtitle">Cây trồng</p>
                        </a>
                    </div>
                </div>
                <div class="destination__card">
                    <img src="views/images/product/thietbinongnghiep.jpg" alt="destination" />
                    <div class="destination__details">
                        <a href="http://localhost:8080/index/thietbinongnghiep" style="color: white">
                            <p class="destination__subtitle">Thiết bị nông nghiệp</p>
                        </a>
                    </div>
                </div>
                <div class="destination__card">
                    <img src="views/images/product/saubenh.jpg" alt="destination" />
                    <div class="destination__details">
                        <a href="http://localhost:8080/index/saubenh" style="color: white">
                            <p class="destination__subtitle">Sâu bệnh</p>
                        </a>
                    </div>
                </div>
                <div class="destination__card">
                    <img src="views/images/product/meovakynang.jpg" alt="destination" />
                    <div class="destination__details">
                        <a href="http://localhost:8080/index/kinhnghiemvameo" style="color: white">
                            <p class="destination__subtitle">Kinh nghiệm và mẹo</p>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <section class="reason">
        <div class="section__container reason__container">
            <div class="image__reason">
                <div class="reason__col">
                    <img src="views/images/index1.jpg" alt="reason" />
                </div>
                <div class="reason__col">
                    <img src="views/images/th.jpg" alt="reason" />
                    <img src="views/images/index2.jpg" alt="reason" />
                </div>
            </div>
            <div class="reason__content">
                <div>
                    <h2 class="section__title">
                        Tại sao lại nên phòng bệnh cho cây trồng ?
                    </h2>
                    <p class="section__subtitle" style="margin-bottom: 10px;">
                        Sử dụng web chúng tôi sẽ giúp bạn:
                            <li>Trao đổi thông tin về cây trồng</li>
                            <li>Tìm kiếm sâu bệnh nhanh bằng hình ảnh </li>
                            <li>Nhắn tin với các người dùng khác và chuyên gia </li>
                            <li>Nhận thông báo dịch bệnh từ chuyên gia </li>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="section__container footer__container">
            <div class="footer__col">
                <h3>AGRIADVISOR<span>.</span></h3>
                <p>
                    Diễn đàn Trao đổi thông tin về cây trồng
                </p>
            </div>
            <div class="footer__col">
                <h4>Chức năng</h4>
                <p>Tài khoản</p>
                <p>Đăng bài</p>
                <p>Lịch sử</p>
                <p>Hỗ trợ</p>
            </div>
            <div class="footer__col">
                <h4>Địa chỉ</h4>
                <p>
                    <span>Địa chỉ:</span> Đại học Duy Tân
                </p>
                <p><span>Email:</span> C1SE.54@gmail.com</p>
                <p><span>Điện thoại:</span> +0123456789</p>
            </div>
        </div>
        <div class="footer__bar">
            SFA TEAM
        </div>
    </footer>
</body>
</html>