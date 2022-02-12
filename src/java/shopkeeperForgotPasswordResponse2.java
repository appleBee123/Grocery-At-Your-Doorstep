/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import vmm.sendsms;

/**
 *
 * @author lenovo
 */
public class shopkeeperForgotPasswordResponse2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String emailid=request.getParameter("emailid");
            String securityAnswer=request.getParameter("securityAnswer");
            ResultSet rs;
            
        if ((emailid.contains("@") && (emailid.contains(".")))) {
                rs = DBLoader.executeQuery("select * from shopkeeper where email='" + emailid + "' and securityanswer='" + securityAnswer + "'" );
            } else {
                rs = DBLoader.executeQuery("select * from shopkeeper where shopkeeperid=" + emailid + " and securityanswer='" + securityAnswer + "'");
            }
           
           if(rs.next())
           {
              // sms logic  

               out.println("success");
               String phno=rs.getString("phoneno");
               String pass=rs.getString("password");
               sendsms.send(phno,"Your password is "+pass);
              
           }
           else
           {
               out.println("fail");
           }
        }
         catch (Exception ex) {
                ex.printStackTrace();
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
