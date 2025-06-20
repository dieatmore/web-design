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

@WebServlet("/updatenotice")
public class UpdateNoticeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AdminService.updateNotice(id,req.getParameter("name"),req.getParameter("content"));
        resp.sendRedirect(req.getContextPath() + "/manage2");
    }
}
