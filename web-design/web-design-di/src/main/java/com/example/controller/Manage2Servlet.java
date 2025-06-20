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

@WebServlet("/manage2")
public class Manage2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Notice> notices = AdminService.listNotices();
        req.setAttribute("notices",notices);
        req.getRequestDispatcher("/WEB-INF/manage2.jsp").forward(req, resp);
    }
}
