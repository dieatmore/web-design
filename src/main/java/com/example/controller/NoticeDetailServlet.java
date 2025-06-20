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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/noticedetail")
public class NoticeDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var id = Integer.parseInt(req.getParameter("id"));
        Notice n = AdminService.getNotice(id);
        List<Notice> notices = new ArrayList<>();
        notices.add(n);
        req.setAttribute("notice1",notices);
        req.getRequestDispatcher("/WEB-INF/noticedetail.jsp").forward(req,resp);
    }
}
