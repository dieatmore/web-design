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

@WebServlet("/homepage")
public class HomepageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<New> news = AdminService.listLatestNews();
        List<Notice> notices = AdminService.listLatestNotices();
        req.setAttribute("news",news);
        req.setAttribute("notices",notices);
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req,resp);
    }
}
