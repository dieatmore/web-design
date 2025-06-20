<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
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
        .jump-more {
            text-decoration: none;
            color: #444444;
            font-size: 0.9rem;
            margin-right: 20px;
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
        .carousel-control-prev {
            width: 10%;
        }
        .carousel-caption {
            position: absolute;
            right: 0%;
            bottom: 1.25rem;
            left: 0%;
            bottom: 0%;
            padding-top: 1.25rem;
            padding-left: 5vw;
            text-align: left;
            color: #fff;
            background: rgba(0, 0, 0, 0.3);
            padding-bottom: 1.5vh;
        }
        .content-home {
            display: flex;
            height: 45.92vh;
        }
        .news-container {
            width: 100%;
            height: 100%;
            padding-left: 1vw;
        }
        .new-items {
            height: 90%;
            overflow-y: auto;
            &::-webkit-scrollbar {
                display: none;
            }
            scrollbar-width: none;
        }
        .sticky-header {
            position: sticky;
            top: 0;
            background: #f9fafb;
            z-index: 100;
            padding: 1.2vh 1.5vh;
            font-size: 1rem;
            font-weight: 600;
            border-bottom: 1px solid #000;
        }
        .border-news {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            background-color: #f9fafb;
        }
        .news-item {
            display: flex;
            margin-bottom: 2vh;
            padding-bottom: 1.5vh;
            border-radius: 0.6vh;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .news-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .news-img {
            width: 8vw;
            height: 10vh;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 4px;
            border: 1px solid #eee;
        }
        .news-content {
            flex: 1;
            padding: 0.4vh;
        }
        .news-title {
            font-size: 1.1rem;
            margin-bottom: 0.5vh;
            color: #343a40;
            font-weight: 500;
            line-height: 1.3;
        }
        .timestamp {
            color: #6c757d;
            font-size: 0.75rem;
            margin-bottom: 1vh;
            display: flex;
            align-items: center;
        }
        .timestamp::before {
            content: "🕒";
            margin-right: 0.5vw;
        }
        .news-content p {
            font-size: 0.85rem;
            color: #495057;
            line-height: 1.5;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .py-4 {
            padding-top: 1rem !important;
            width: 33.34vw;
        }
        .title-small {
            margin-top: 17px;
            position: sticky;
            top: 0;
            background: #f9fafb;
            z-index: 100;
            padding: 1.2vh 1.5vh;
            font-size: 1rem;
            padding-bottom: 0;
            margin-bottom: 0;
            font-weight: 600;
        }
        .chart-home {
            width: 33.33vw;
        }
        .announcement-container {
            font-family: 'Segoe UI', sans-serif;
            width: 33.33vw;
            margin: 10px auto;
        }
        .announcement-item {
            display: flex;
            padding: 10px;
            border-bottom: 1px solid #eee;
            align-items: center;
            margin-top: 5px;
        }
        .announcement-title {
            color: #2A5CAA;
            text-decoration: none;
            font-weight: 600;
            font-size: 18px;
            display: block;
            margin-bottom: 5px;
        }
        .announcement-title:hover {
            text-decoration: underline;
        }
        .announcement-desc {
            color: #666;
            font-size: 14px;
            margin: 0;
        }
        .date-container {
            display: flex;
            flex-direction: column;
            margin-right: 30px;
            border: 0.5px solid #000;
            border-radius: 2px;
        }
        .day-show {
            background-color: #2A5CAA;
            color: white;
            text-align: center;
            font-size: 1.3rem;
        }
        .date-show {
            background-color: white;
            padding: 0 1px;
            font-size: 0.9rem;
            width: 55px;
        }
    </style>
</head>
<body>
<div class="container-all">
  <%@include file="nav.jsp"%>
    <div class="content-img">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="resources/view2.jpg" class="imag-show" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>主楼晚霞</h5>
                        <p>主楼的晚霞如同一幅流动的油画，金红色的光芒泼洒在玻璃幕墙上，将整栋建筑染成炽烈的琥珀色，云层翻卷间仿佛有火焰在天空静静燃烧，暮色为钢筋水泥镀上一层温柔的辉煌。</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="resources/view3.jpg" class="imag-show" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>红房子</h5>
                        <p>红房子矗立在层层枫树间，深红的砖墙与漫天飞舞的火红枫叶浑然一体。秋风卷过，落叶在屋檐下盘旋，擦过窗棂，仿佛为这座坚实的建筑笼上了一层跃动的红影。</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="resources/view1.jpg" class="imag-show" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>成栋楼秋景</h5>
                        <p>金黄的银杏叶如蝴蝶般纷飞，为成栋楼披上流动的秋衣，砖红色的外墙在夕阳下与落叶交织成暖色调的油画，每一扇玻璃窗都倒映着云霞的斑斓，楼前台阶上零星的枫叶像散落的火种，将肃穆的建筑轮廓染出几分诗意。</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </a>
        </div>
    </div>
    <div class="content-home">
        <div class="d-flex py-4">
            <div class="news-container">
                <div class="border-news">
                    <h6 class="sticky-header mb-4 pb-2"><i class="bi bi-newspaper" style="margin-right: 5px"></i>最新新闻</h6>
                    <a href="newNotice" class="jump-more">查看更多<i class="bi bi-arrow-right"></i></a>
                </div>

                <div class="new-items">
                    <c:forEach items="${news}" var="newItem">
                    <div class="news-item" onclick="window.location.href='newdetail?id=${newItem.id}';">
                        <%
                            InputStream imageStream = ((com.example.entity.New)pageContext.getAttribute("newItem")).getImageStream();
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
                        <img src="data:image/jpeg;base64,<%= base64Image %>" class="news-img">
                        <div class="news-content">
                            <h5 class="news-title">${newItem.name}</h5>
                            <p class="timestamp">${fn:replace(newItem.insertTime, 'T', ' ')}</p>
                            <p style="font-size: 0.9rem;overflow: hidden">${newItem.content}</p>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="chart-home">
            <h6 class="title-small"><i class="bi bi-clipboard-heart" style="margin-right: 5px"></i>专业满意度</h6>
            <div id="chart" style="width: 600px; height: 380px;"></div>
        </div>
        <div class="alert-home">
            <div class="border-news">
                <h6 class="title-small"><i class="bi bi-file-earmark-text" style="margin-right: 5px"></i>通知公告</h6>
                <a href="newNotice" class="jump-more">查看更多<i class="bi bi-arrow-right"></i></a>
            </div>
            <div class="announcement-container">
                <c:forEach items="${notices}" var="notice">
                    <c:set var="dateParts" value="${fn:split(notice.insertTime, 'T')}" />
                    <c:set var="date" value="${dateParts[0]}" />
                    <c:set var="dateComponents" value="${fn:split(date, '-')}" />
                <div class="announcement-item">
                    <div class="date-container">
                        <div class="day-show">${dateComponents[2]}</div>
                        <div class="date-show">${fn:substring(notice.insertTime, 0, 7)}</div>
                    </div>
                    <div>
                        <a href="noticedetail?id=${notice.id}" class="announcement-title">${notice.name}</a>
                        <p class="announcement-desc" style="height:20px;font-size: 0.9rem;overflow: hidden">${notice.content}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    const myChart = echarts.init(document.getElementById('chart'));
    const option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: { type: 'shadow' },
            formatter: '{b}<br/>满意度: {c}%'
        },
        grid: {
            left: '8%',
            right: '5%',
            bottom: '0%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: ['大一', '大二', '大三', '大四', '研一', '研二', '研三'],
            axisLabel: {
                fontSize: 12,
                color: '#666'
            },
            axisLine: {
                lineStyle: { color: '#ddd' }
            }
        },
        yAxis: {
            type: 'value',
            min: 50,
            max: 100,
            axisLabel: {
                formatter: '{value}%',
                color: '#666'
            },
            splitLine: {
                lineStyle: { type: 'dashed' }
            }
        },
        series: [{
            name: '专业满意度',
            type: 'bar',
            showBackground: true,
            barWidth: '50%',
            data: [82, 78, 75, 72, 85, 88, 90],
            itemStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    { offset: 0, color: '#50b0ff' },
                    { offset: 1, color: 'rgba(80,182,255,0.49)' }
                ])
            },
            label: {
                show: true,
                position: 'top',
                formatter: '{c}%'
            }
        }]
    };
    myChart.setOption(option);
</script>
</body>
</html>