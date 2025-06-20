package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/teacherdetail")
public class TeacherDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String teacherId = req.getParameter("teacherId");
        req.setAttribute("teacherId",teacherId);
        req.getRequestDispatcher("/WEB-INF/teacherdetail.html").forward(req,resp);
    }
}
