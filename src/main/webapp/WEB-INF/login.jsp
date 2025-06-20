<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        .container-all {
            width: 100%;
            height: 100%;
            /*background: green;*/
            background-color: #f9fafb;
        }
        .acarousel {
            position: relative;
            height: 100%;
            width: 100%;
        }
        .acarousel img {
            width: 100vw;
            height: 100vh;
            object-fit: cover;
        }
        .header-login {
            position: absolute;
            display: flex;
            z-index: 100;
            max-height: 10vh;
            background-color: rgba(31, 52, 58, 0.62);
            width: 100%;
            height: 72px;
            align-items: center;
        }
        .header-login img {
            height: 5vh;
            width: auto;
            margin-left: 100px;
        }
        .htitle {
            color: white;
            font-size: 20px;
            margin-top: 10px;
        }
        .footer-me {
            position: absolute;
            z-index: 100;
            width: 100%;
            bottom: 0;
            background-color: rgba(31, 52, 58, 0.62);
            text-align: center;
            height: 70px;
            margin-top: 150px;
            padding-top: 20px;
        }
        .form-container {
            position: absolute;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 100;
            width: 400px;
            height: 400px;
            top: 270px;
            padding: 20px 0px;
            right: 170px;
            background-color: #fff;
            color: black;
        }

        .form-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            background: white;
        }
        .btn-login {
            width: 100%;
            padding: 10px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-login:hover {
            background: #50f9ff;
            transform: translateY(-2px);
        }
        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .forgot-password {
            color: #3498db;
            text-decoration: none;
            font-size: 14px;
        }
        .forgot-password:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container-all">
    <div class="header-login">
        <img src="../resources/QQ图片20221004192716.png"> <p class="htitle">| 统一身份认证</p>
    </div>
    <div class="acarousel">
        <img src="https://news.nefu.edu.cn/__local/6/89/24/6614D996BBC76932E600E944BAE_D99CFAE3_10655.jpg" alt="...">
    </div>
    <div class="form-container">
        <div class="stitle"><h5 style="margin-bottom: 40px">账号登录</h5></div>
        <form action="login" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text" id="input-name"><i class="bi bi-person"></i></span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="input-name" placeholder="请输入账号" name="username">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="input-password"><i class="bi bi-lock"></i></span>
                <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="input-password" placeholder="请输入密码" name="pwd">
            </div>
            <div class="form-options mb-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe" name="remember">
                    <label class="form-check-label" for="rememberMe">记住密码</label>
                </div>
                <a href="#" class="forgot-password">忘记密码？</a>
            </div>
            <button type="submit" class="btn-login">登 录</button>
            <div class="alert-warm" style="margin-top: 10px; color: #9C9C9C;">
                <p>
                    温馨提示：<br/><span style="margin-left: 70px;margin-top: 10px">账号为 admin </span><br/>  <span style="margin-left: 70px;margin-top: 10px">密码为 admin</span>
                </p>
            </div>
        </form>
    </div>
    <div class="footer-me">
        <p style="color: #eeeeee;" >地址‌：黑龙江省哈尔滨市香坊区和兴路26号<span style="margin-left: 45px">邮编‌：150040</span><span style="margin-left: 45px"> 信息公开工作办公室：0451-82191631（咨询时间：工作日8:30-11:30、14:00-17:00，节假日除外）</span></p>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    <% if(session.getAttribute("loginError") != null) { %>
    alert('<%= session.getAttribute("loginError") %>');
    <% session.removeAttribute("loginError"); %>
    <% } %>
</script>
</body>
</html>