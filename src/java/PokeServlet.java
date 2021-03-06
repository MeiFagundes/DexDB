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
            
            // ---- DATA ----
            
            // MySQL Access
            final String url = "jdbc:mysql://localhost:3306/";
            //final String db = "dexdb";
            final String table = "dex";
            
            //String login = "root";
            //String password = "";
            String  sqlQuery;
            
            
            // Parameters
            String inputType = request.getParameter("inputType");
            String inputData = request.getParameter("inputData");
            final String login = request.getParameter("login");
            final String password = request.getParameter("password");
            final String db = request.getParameter("db");
            
            // Current Pokemon Data
            int id;
            String name, primType, secType, entry, sprite;
            
            // ---- CODE ----
            
            // Data type verification
            switch(inputType){
                
                case "id":
                    
                    sqlQuery = "SELECT * FROM "+ table +" WHERE Id=" + inputData;
                    break;
                    
                case "name":
                    
                    sqlQuery = "SELECT * FROM "+ table +" WHERE Name='" + inputData + "'";
                    break;
                    
                case "list":
                    
                    sqlQuery = "SELECT * FROM "+ table + " ORDER BY Id";
                    break;
                    
                default:
                    out.println("incorrect parameters");
                    return;
            }
            
            // MySQL Connection
            try{ 
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url + db, login, password);
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(sqlQuery);
                
                // Getting Pokemon info

                if (result.next()) {
                    do {
                        id = result.getInt("Id");
                        name = result.getString("Name");
                        primType = result.getString("PrimaryType");
                        secType = result.getString("SecondaryType");
                        entry = result.getString("Entry");
                        out.println(id + "&" + name + "&" + primType + "&" + secType + "&" + entry + "@");
                    } while (result.next());
                } else{
                    out.println("not found");
                }
                
            }catch(SQLException | ClassNotFoundException ex){
                out.println("Exception: " + ex);
            }
            
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
