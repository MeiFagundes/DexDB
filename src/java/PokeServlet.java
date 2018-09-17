/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aluno
 */
@WebServlet(urlPatterns = {"/PokeServlet"})
public class PokeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * id, nome, tipo, entry, sprite
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String login = "root";
            String password = "";
            
            String inputType = request.getParameter("inputType");
            String inputName = request.getParameter("data");
            
            int id = -1;
            String name = "null";
            String  type = "null";
            String  entry = "null";
            String  sprite = "null";
            String  sql;
            
            if (inputType.equals("id")) {
                id = Integer.parseInt(inputName);
                
                sql = "SELECT * FROM 'dextable' WHERE Id=" + id;
            } else{
                sql = "SELECT * FROM 'dextable' WHERE Name=" + inputName;
            }
            
            try{
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/dexdb", login, password);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                
                id = Integer.parseInt(rs.getString("Id"));
                name = rs.getString("Name");
                type = rs.getString("Type");
                entry = rs.getString("Entry");
                sprite = rs.getString("Sprite");
                
                
            }catch(SQLException ex){
                System.out.println("Exception: " + ex);
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>PokeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PokeServlet at " + request.getContextPath() + "</h1>");
            out.println("Id: " + id + "<br>Name: " + name + "<br>Type: " + type + "<br>Entry: " + entry + "<br>sprite: " + sprite);
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
