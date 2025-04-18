/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;
import entities.Donneur;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.DonneurService;
import services.UserService;
import util.Util;


/**
 *
 * @author elabtahysanae
 */




@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    private UserService us;

    @Override
    public void init() throws ServletException {
        super.init(); 
        us = new UserService();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DonneurService ds = new DonneurService();
        Donneur d = ds.findClientByEmail(email);
        
        if (d != null) {
            if (d.getMotDePasse().equals(Util.md5(password))) {
                HttpSession session = request.getSession();
                session.setAttribute("donneur", d);
                ds.update(d);
                response.sendRedirect("welcome.jsp");
            } else {
                response.sendRedirect("LoginController.jsp?msg=mot de passe incorrect");
            }
        } else {
            response.sendRedirect("LoginController.jsp?msg=Email introvable");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}