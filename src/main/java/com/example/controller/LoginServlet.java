package com.example.controller;

import com.example.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/filter/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("pwd");
        String url;
        if ("admin".equals(userName) && "admin".equals(password)) {
            User u = new User("管理员");
            req.getSession().setAttribute("user", u);
            url = "/homepage";
        } else {
            req.getSession().setAttribute("loginError", "用户名或密码错误");
            url = "/filter/login";
        }
        resp.sendRedirect(req.getContextPath() + url);
    }
}
