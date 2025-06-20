<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新闻公告</title>
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
        .header-all {
            display: flex;
            height: 6.67vh;
            background-color: #f9fafb;
            width: 100%;
        }
        .header-all > img {
            margin-top: 1vh;
            margin-left: 15vw;
        }
        .header-inf {
            margin-top: 1vh;
            display: inline-block;
            margin-right: 10vw;
            margin-left: auto;
            align-content: center;
        }
        .header-inf > a {
            color: rgba(0, 0, 0, 0.49);
            margin: 0 0.5vw;
            text-decoration: none;
        }
        .header-inf >a:hover {
            color: black;
            transition: 0.5s;
        }
        .nav-bar {
            background: #1F343A;
            height: 4.81vh;
        }
        .navs {
            margin-left: 15vw;
        }
        .navs ul {
            list-style-type: none;
            margin-bottom: 0;
        }
        .navs li {
            display: inline-block;
        }
        .navs a {
            display: block;
            text-decoration: none;
            padding: 1.4vh 1.6vw;
            color: white;
            font-size: 1rem;
            font-weight: bold;
        }
        .navs a:hover {
            color: rgba(255, 255, 255, 0.71);
        }
        .imag-show {
            object-fit: cover;
            width: 100%;
            height: 42.6vh;
        }
        .carousel-item img{
            width: 150vh;
            height: 42.6vh;
        }
        .all-content {
            display: flex;
            flex-wrap: wrap;
            position: relative;
        }
        .a-container {
            margin-top: 40px;
            margin-left: 200px;
            width: 50vw;
        }
        .a-item {
            position: relative;
            margin-top: 10px;
        }
        .a-item a {
            text-decoration: none;
            color: black;
        }
        .span-item {
            position: absolute;
            right: 5px;
            color: #9C9C9C;
        }
        .calendar-days div {
            padding: 5px;
            text-align: center;
            border-radius: 4px;
        }
        .container-link a {
            text-decoration: none;
        }
        .a-container a {
            text-decoration: none;
            color: black;
        }
        .a-container a:hover {
            color: #3498db;
        }
        .footer-me {
            width: 100%;
            background-color: #1F343A;
            text-align: center;
            height: 100px;
            margin-top: 150px;
            padding-top: 20px;
        }
        /*.new-notice {*/
        /*    display: flex;*/
        /*    flex-direction: row;*/
        /*    background-color: #f9fafb;*/
        /*    padding: 50px 100px;*/
        /*    margin-bottom: 10px;*/
        /*}*/
        /*.news-container {*/
        /*    width: 750px;*/
        /*    border: 1px solid #9C9C9C;*/
        /*    margin: 0 30px;*/
        /*}*/
        /*.notices-container {*/
        /*    width: 750px;*/
        /*    margin: 0 0px;*/
        /*    border: 1px solid #9C9C9C;*/
        /*}*/
        .new-notice {
            display: flex;
            gap: 30px;
            padding: 20px;
            background: #f9fafb;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .news-container, .notices-container {
            flex: 1;
            background: white;
            width: 750px;
            padding: 15px;
            border-radius: 6px;
            border-left: 4px solid #0d6efd;
        }
        .news-container{
            margin-left: 50px;
        }
        h4 {
            color: #0d6efd;
            padding-bottom: 10px;
            border-bottom: 1px dashed #dee2e6;
            font-family: 'Helvetica Neue', sans-serif;
        }
        .a-item {
            padding: 8px 0;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            border-bottom: 1px solid #f1f1f1;
        }
        .a-item:hover {
            background-color: #f8f9fa;
            transform: translateX(5px);
        }
        .span-item {
            margin-left: auto;
            color: #6c757d;
            font-size: 0.85rem;
        }
        .bi-chevron-right {
            color: #0d6efd;
        }
        a {
            text-decoration: none;
            color: #212529;
        }
        a:hover .a-item {
            color: #0d6efd;
        }
    </style>
</head>
<body>
<div class="container-all">
    <div class="header-all">
        <img src="resources/schoolbadge.png">
        <div class="header-inf">
            <a href="https://cas.webvpn.nefu.edu.cn/cas/login?service=https%3A%2F%2Fwebvpn.nefu.edu.cn%2Fusers%2Fauth%2Fcas%2Fcallback%3Furl%3Dhttps%253A%252F%252Fwww.nefu.edu.cn%252F">数字东林</a>|
            <a href="https://mail.nefu.edu.cn/">电子邮件</a>|
            <a href="https://cas.webvpn.nefu.edu.cn/cas/login?service=https%3A%2F%2Fwebvpn.nefu.edu.cn%2Fusers%2Fauth%2Fcas%2Fcallback%3Furl%3Dhttps%253A%252F%252Fwww.nefu.edu.cn%252F">领导信箱</a>|
            <a href="https://tel.nefu.edu.cn/">校园电话</a>|
            <a href="https://map.nefu.edu.cn/">校园地图</a>
        </div>
    </div>
    <div class="nav-bar">
        <div class="navs">
            <ul>
                <li><a href="homepage">首页</a></li>
                <li><a href="introduce">专业介绍</a></li>
                <li><a href="lab">实验室</a></li>
                <li><a href="teacher">教师队伍</a></li>
                <li><a href="job">就业指南</a></li>
                <li><a href="newNotice">新闻公告</a></li>
                <li><a href="contact">联系我们</a></li>
                <li><a href="manage">后台管理</a></li>
                <li><a href="filter/login">退出登录</a></li>
            </ul>
        </div>
    </div>

    <div class="all-content">
        <img src="resources/zhiyuan.jpg" class="imag-show" alt="...">
        <div class="new-notice">
            <div class="news-container">
                <h4>新闻动态</h4>
                <c:forEach items="${news}" var="newItem" >
                    <a href="newdetail?id=${newItem.id}">
                        <div class="a-item"><i class="bi bi-chevron-right" style="margin-right: 5px"></i>${newItem.name}<span class="span-item fst-italic">${fn:replace(newItem.insertTime, 'T', ' ')}</span></div>
                    </a>
                </c:forEach>
            </div>
            <div class="notices-container">
                <h4>通知公告</h4>
                <c:forEach items="${notices}" var="n" >
                    <a href="noticedetail?id=${n.id}">
                        <div class="a-item"><i class="bi bi-chevron-right" style="margin-right: 5px"></i>${n.name}<span class="span-item fst-italic">${fn:replace(n.insertTime, 'T', ' ')}</span></div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</div>
</body>
</html>