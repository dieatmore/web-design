<%@ page pageEncoding="UTF-8" import="java.io.InputStream, java.util.Base64" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var = "base" value = "/" />
<base href="${base}">
<jsp:useBean id="news" scope="request" type="java.util.List<com.example.entity.New>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
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
        .sidebar {
            width: 240px;
            height: 100vh;
            background: #2d3748;
            position: fixed;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar-header {
            padding: 1.25rem;
            border-bottom: 1px solid #4a5568;
        }

        .sidebar-header h4 {
            color: #f7fafc;
            font-size: 1.15rem;
            font-weight: 500;
        }

        .nav {
            padding: 0.75rem;
        }

        .nav-link {
            color: #cbd5e0;
            padding: 0.75rem 1rem;
            border-radius: 4px;
            margin-bottom: 0.25rem;
            display: flex;
            align-items: center;
            transition: all 0.2s ease;
        }

        .nav-link:hover {
            background: #4a5568;
            color: #fff;
        }

        .nav-link.active {
            background: #4a5568;
            color: #fff;
            font-weight: 500;
        }

        .nav-link i {
            margin-right: 0.75rem;
            font-size: 1rem;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .search-box {
            width: 300px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .table-responsive {
            max-height: 500px;
            overflow-y: auto;
            border: 1px solid #dee2e6;
        }
        table {
            width: 100%;
            table-layout: fixed;
        }
        td:nth-child(3) {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        tbody, td, tfoot, th, thead, tr {
            text-align: center;
            align-content: center;
        }
        td:first-child, th:first-child {
            width: 60px;
            max-width: 60px;
        }
    </style>
</head>
<body>
<div class="container-all">
    <%@include file="sidebar.jsp"%>
    <!-- 主内容区 -->
    <div class="main-content w-95">
        <div class="d-flex justify-content-between mb-4">
            <div class="input-group search-box">
                <form action="searchnew" method="get">
                    <div style="display: flex">
                        <input type="text" class="form-control" name="id" placeholder="请输入新闻Id">
                        <button class="btn btn-outline-secondary" type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <form action="addnew" method="post" enctype="multipart/form-data">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" ><i class="bi bi-plus-circle me-1"></i>添加新闻</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">添加新闻</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="notice-name" class="col-form-label">新闻标题</label>
                                        <input type="text" class="form-control" id="notice-name" name="name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">新闻内容</label>
                                        <textarea class="form-control" id="message-text" name="content"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-img" class="col-form-label">新闻图片</label>
                                        <input type="file" class="form-control" id="message-img" name="img">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- 表格区域 -->
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>标题</th>
                    <th>内容</th>
                    <th>图片</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${news}" var="n">
                    <tr>
                        <td>${n.id}</td>
                        <td>${n.name}</td>
                        <td>${n.content}</td>
                        <td>
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
                                    <img src="data:image/jpeg;base64,<%= base64Image %>" style="width: 50px;height: 50px">
                        </td>
                        <td>${n.insertTime}</td>
                        <td>${n.updateTime}</td>
                        <td>
                            <button class="btn btn-sm btn-warning me-2" data-bs-toggle="modal" data-bs-target="#editModal_${n.id}" >
                                <i class="bi bi-pencil-square"></i> 编辑
                            </button>
                            <button class="btn btn-sm btn-danger" onclick="deleteNew(${n.id})">
                                <i class="bi bi-trash"></i> 删除
                            </button>
                        </td>
                    </tr>
                    <form action="updatenew" method="post" enctype="multipart/form-data">
                        <div class="modal fade" id="editModal_${n.id}" tabindex="-1" aria-labelledby="editModalLabel_${n.id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel_${n.id}">编辑新闻</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 隐藏字段用于传递新闻ID -->
                                        <input type="hidden" name="id" value="${n.id}">
                                        <div class="mb-3">
                                            <label for="edit-notice-name_${n.id}" class="col-form-label">新闻标题</label>
                                            <input type="text" class="form-control" id="edit-notice-name_${n.id}" name="name" value="${n.name}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="edit-message-text_${n.id}" class="col-form-label">新闻内容</label>
                                            <textarea class="form-control" id="edit-message-text_${n.id}" name="content">${n.content}</textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="edit-message-img_${n.id}" class="col-form-label">新闻图片</label>
                                            <input type="file" class="form-control" id="edit-message-img_${n.id}" name="img">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-warning">保存修改</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    function deleteNew(id) {
        if (confirm('确定要删除这条新闻吗？')) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'deletenew?id=' + id;
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>
</body>
</html>