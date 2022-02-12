

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

/**
 *
 * @author lenovo
 */
public class editProfileResponse extends HttpServlet {

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
            int id=Integer.parseInt(request.getParameter("id2"));
            String name=request.getParameter("name");
            String shopname=request.getParameter("shopname");
            String phoneno=request.getParameter("phoneno").trim();
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String website=request.getParameter("website");
            String city=request.getParameter("city");
            String securityquestion=request.getParameter("securityQuestion");
            String securityanswer=request.getParameter("securityAnswer");
            System.out.println(name+shopname+phoneno);
            
             ResultSet rs=DBLoader.executeQuery("select * from shopkeeper where shopkeeperid="+id);
            
          try
          {
               if(rs.next())
           {
             
               rs.updateString("shopkeepername",name);
               
               rs.updateString("shopname",shopname);
              
               rs.updateString("phoneno",phoneno);
               
               rs.updateString("email",email);
             
               rs.updateString("address",address);
            
               rs.updateString("website",website);
               rs.updateString("city",city);
               rs.updateString("securityquestion",securityquestion);
               rs.updateString("securityanswer",securityanswer);
              
               rs.updateRow();
             
               out.println("success");
           }
           else
           {
               out.println("fail");
           }
        }
          catch(Exception ex)
        {
            ex.printStackTrace();
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
