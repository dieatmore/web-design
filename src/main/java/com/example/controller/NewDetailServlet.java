package com.example.controller;

import com.example.entity.New;
import com.example.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/newdetail")
public class NewDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var id = Integer.parseInt(req.getParameter("id"));
        New n = AdminService.getNew(id);
        List<New> new1 = new ArrayList<>();
        new1.add(n);
        req.setAttribute("new1",new1);
        req.getRequestDispatcher("/WEB-INF/newdetail.jsp").forward(req,resp);
    }
}
