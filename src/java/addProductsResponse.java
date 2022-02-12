

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.DBLoader;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class addProductsResponse extends HttpServlet {

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
        HttpSession session = request.getSession();
          Collection<Part> parts = request.getParts();
        String absolutepath = request.getServletContext().getRealPath("/myuploads");
        String ans = "";
        PrintWriter out = response.getWriter();

        //get values
        String productname = request.getParameter("productname");
        String description = request.getParameter("description");
        int mrp = Integer.parseInt( request.getParameter("mrp"));
        int offerprice = Integer.parseInt(request.getParameter("offerprice"));
        String category = request.getParameter("category");
        String brand = request.getParameter("brand");
       

        String fname = "";
        
        //session.getAttribute("id").toString()
        

        
       

       
        try
        {
            //database query 
            ResultSet rs = DBLoader.executeQuery("select * from products");
            String answer = "";
            rs.next();
           
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
                rs.updateString("productname", productname);
                rs.updateString("productdes", description);
                rs.updateInt("mrp", mrp);
                rs.updateInt("offerprice", offerprice);
                rs.updateInt("shopkeeperid", Integer.parseInt(session.getAttribute("id").toString()));
                rs.updateString("category", category);
                rs.updateString("brand", brand);
                
                rs.updateString("primaryphoto", photo);
                rs.insertRow();

                

            


            out.println(answer);
        }
        catch (Exception e)
        {
            e.printStackTrace();
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
