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
            final String db = "dexdb";
            final String table = "dex";
            
            String login = "root";
            String password = "";
            String  sqlQuery;
            
            
            // Parameters
            String inputType = request.getParameter("inputType");
            String inputData = request.getParameter("inputData");
            
            // Current Pokemon Data
            String id, name, primType, secType, entry, sprite;
            
            // ---- CODE ----
            
            out.println("<h1>DexDB Servlet</h1>");
            
            // Data type verification
            switch(inputType){
                case "id":
                    
                    // Normalizing id length to 3
                    switch(inputData.length()){
                        case 1:
                            inputData = "00" + inputData;
                            break;
                        case 2:
                            inputData = "0" + inputData;
                            break;
                        case 3:
                            break;
                        default:
                            out.println("<h2> --- Incorrect InputData id length --- </h2>");
                            return;
                    }
                    
                    sqlQuery = "SELECT * FROM "+ table +" WHERE Id='" + inputData + "'";
                    break;
                    
                case "name":
                    
                    sqlQuery = "SELECT * FROM "+ table +" WHERE Name='" + inputData + "'";
                    break;
                default:
                    out.println("<h2> --- Incorrect parameter inputType received from JSP --- </h2>");
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
                    id = result.getString("Id");
                    name = result.getString("Name");
                    primType = result.getString("PrimaryType");
                    secType = result.getString("SecondaryType");
                    entry = result.getString("Entry");
                    sprite = result.getString("Sprite");
                } else{
                    out.println("<h3> --- Pokemon not found in database --- </h3>");
                    return;
                }
                
                // Printing info
                out.println("<p id='outputId'>Id: #" + id + "</p>");
                out.println("<p id='outputName'>Name: " + name + "</p>");
                out.println("<p id='outputType'>Prymary Type: " + primType + "</p>");
                out.println("<p id='outputType'>Secondary Type: " + secType + "</p>");
                out.println("<p id='outputEntry'>Entry: " + entry + "</p>");
                out.println("<img id='outputSprite' src='" + sprite + "'/>");
                
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
