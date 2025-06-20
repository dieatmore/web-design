package com.example.controller;

import com.example.entity.New;
import com.example.entity.Notice;
import com.example.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/newNotice")
public class NewNoticeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<New> news = AdminService.listNews();
        List<Notice> notices = AdminService.listNotices();
        req.setAttribute("news",news);
        req.setAttribute("notices",notices);
        req.getRequestDispatcher("/WEB-INF/newNotice.jsp").forward(req,resp);
    }
}
