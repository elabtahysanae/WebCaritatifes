/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author elabtahysanae
 */
import entities.Donneur;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.DonneurService;




@WebServlet(name = "DonneurController", urlPatterns = {"/DonneurController"})
public class DonneurController extends HttpServlet {

    private DonneurService ds;

    @Override
    public void init() throws ServletException {
        super.init();
        ds = new DonneurService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        if (op == null) {
            String id = request.getParameter("id");
            if (id == null) {
                String nom = request.getParameter("nom");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                ds.create(new Donneur( nom, email, password));
                response.sendRedirect("donneurs/page.jsp");
            } else {
                String nom = request.getParameter("nom");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                Donneur d = new Donneur(nom, email, password);
                d.setId(Integer.parseInt(id));
                ds.update(d);
                response.sendRedirect("donneurs/page.jsp");
            }
        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            ds.delete(ds.findById(Integer.parseInt(id)));

            response.sendRedirect("donneurs/page.jsp");
        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            Donneur d = ds.findById(Integer.parseInt(id));

            response.sendRedirect("donneurs/page.jsp?id=" + d.getId() + "&nom=" + d.getNom());
        }

    }
}