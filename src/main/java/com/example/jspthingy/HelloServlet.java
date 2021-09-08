package com.example.jspthingy;

import com.example.jspthingy.model.Person;
import org.jboss.weld.context.http.Http;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
        session.setAttribute("personne", new Person("luc", 15));
        request.getRequestDispatcher("/test.jsp").forward(request,response);
    }

    public void destroy() {
    }
}
