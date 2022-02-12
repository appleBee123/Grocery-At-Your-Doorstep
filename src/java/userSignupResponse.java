

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class userSignupResponse extends HttpServlet {

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
            
       Collection<Part> parts = request.getParts();
        String absolutepath = request.getServletContext().getRealPath("/myuploads");
        String ans = "";
        

        //get values
        String username= request.getParameter("Username");
        String password= request.getParameter("Password");
        String email= request.getParameter("Email");
        String phone = request.getParameter("Phone");
        
        
        String securityquestion = request.getParameter("securityQuestion");
        String securityanswer = request.getParameter("securityAnswer");
        
        
        

        String fname = "";
        try
        {
            //database query 
            ResultSet rs = DBLoader.executeQuery("select * from user" );
            String answer = "";
            if(rs.next())
            {
                for (Part part : parts)
                {
                    String filename = vmm2.FileUploader.savefileonserver(part, absolutepath);
                    if (filename.equals("not-a-file"))
                    {
                        ans += "<br>" + "---";
                    } else
                    {
                        ans += "<br>" + filename;
                        fname = filename;
                    }
                }

                answer = "success";

                File f = new File(fname);
                String photo = "myuploads/" + f.getName();
                rs.moveToInsertRow();
                rs.updateString("username", username);
                rs.updateString("password", password);
                rs.updateString("phoneno", phone);
                rs.updateString("email", email);
                
                rs.updateString("securityquestion", securityquestion);
                rs.updateString("securityanswer", securityanswer);
                
                
                
                rs.updateString("photo", photo);
                rs.insertRow();
            }
            else
            {
                answer = "fail";
            }
               

           
              


            out.println(answer);

        
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
