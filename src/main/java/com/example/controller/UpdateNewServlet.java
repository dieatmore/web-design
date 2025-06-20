package com.example.controller;

import com.example.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/updatenew")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5,    // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class UpdateNewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part filePart = req.getPart("img"); // 获取文件部分
        InputStream fileContent = filePart.getInputStream();
        int id = Integer.parseInt(req.getParameter("id"));
        AdminService.updateNew(id,req.getParameter("name"),req.getParameter("content"),fileContent);
        resp.sendRedirect(req.getContextPath() + "/manage");
    }
}
