<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新闻详情</title>
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
        .header {
            height: 72px;
            background-color: #1F343A;
            color: white;
            font-size: larger;
            font-weight: bolder;
            align-content: center;
        }
        .header h2 {
            text-align: center;
        }

        .container-detail {
            max-width: 1420px;
            margin: 2rem auto;
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            gap: 3rem;
        }

        .image-detail img {
            width: 800px;
            height: 700px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .image-detail img:hover {
            transform: scale(1.02);
        }

        .detail-lab {
            flex: 1;
            padding: 1.5rem;
        }

        .detail-lab p {
            margin: 2rem 0;
            padding: 1rem 1rem;
            background: white;
            border-left: 4px solid #4285f4;
            border-radius: 0 8px 8px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            font-size: 1.1rem;
        }

        .detail-s {
            color: #4285f4;
            font-weight: bold;
        }
        .footer-me {
            background-color: #1F343A;
            text-align: center;
            height: 100px;
            margin-top: 102px;
            padding-top: 20px;
        }
        .back-n {
            margin-top: 40px;
            margin-left:40px;
            border: 2px solid black;
            color: black;
            border-radius: 4px;
            width: 80px;
            font-weight: bolder;
            font-size: 20px;
        }
        .back-n:hover {
            background-color: white;
            color: #4285f4;
            border: 2px solid #4285f4;
        }
    </style>
</head>
<body>
<div class="container-all">
    <div class="header-all">
        <img src="resources/schoolbadge.png">
        <div class="header-inf">
            <a href="">数字东林</a>|
            <a href="">电子邮件</a>|
            <a href="">领导信箱</a>|
            <a href="">校园电话</a>|
            <a href="">校园地图</a>
        </div>
    </div>
    <c:forEach items="${new1}" var="n">
        <div class="header">
            <h4 id="headerDetail" style="text-align: center;">${n.name}</h4>
        </div>
    </c:forEach>
    <div class="container-detail">
        <div class="image-detail">
            <c:forEach items="${new1}" var="n">
                <%
                    InputStream imageStream = ((com.example.entity.New)pageContext.getAttribute("n")).getImageStream();
                    java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
                    int nRead;
                    byte[] data = new byte[16384];
                    while ((nRead = imageStream.read(data, 0, data.length)) != -1) {
                        buffer.write(data, 0, nRead);
                    }
                    buffer.flush();
                    byte[] byteArray = buffer.toByteArray();
                    String base64Image = Base64.getEncoder().encodeToString(byteArray);
                    imageStream.close();
                %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" style="float: left;width: 400px;height: 400px;margin: 50px">
            </c:forEach>
        </div>
        <div id="labInfo">
            <c:forEach items="${new1}" var="n">
                <p style="font-size: 24px;">${n.content}</p>
            </c:forEach>
        </div>
    </div>
    <div class="footer-me">
        <p style="color: #eeeeee;margin-top: 25px" >地址‌：黑龙江省哈尔滨市香坊区和兴路26号<span style="margin-left: 45px">邮编‌：150040</span><span style="margin-left: 45px"> 信息公开工作办公室：0451-82191631（咨询时间：工作日8:30-11:30、14:00-17:00，节假日除外）</span></p>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>