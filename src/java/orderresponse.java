

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;
import vmm2.product;

/**
 *
 * @author lenovo
 */
public class orderresponse extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
           if(session.getAttribute("order").toString().equals("save")){
            int atotal = Integer.parseInt(request.getParameter("actualamt2"));
            int discount = Integer.parseInt(request.getParameter("discount3"));
            int gtotal = Integer.parseInt(request.getParameter("amttopay2"));
            String address =request.getParameter("address2");
            String city =request.getParameter("city2");
            
//            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            System.out.println(username);
            
           
            ResultSet rs = DBLoader.executeQuery("select * from ordertable");
            if(session.getAttribute("cartlist") != null)
            {
            rs.moveToInsertRow();
            rs.updateInt("actualamount", atotal);
            rs.updateInt("discount", discount);
            rs.updateInt("paidamount", gtotal);
            rs.updateString("username", username);
            rs.updateString("address", address);
            rs.updateString("city", city);
            rs.insertRow();
            }
        ResultSet rs1 = DBLoader.executeQuery("select MAX(order_id) As maxid from ordertable");
        if(rs1.next())
            
        {
            int maxid=rs1.getInt("maxid");
                      
            
            if (session.getAttribute("cartlist") != null) 
            {
                ArrayList<product> al = (ArrayList<product>) session.getAttribute("cartlist");
                for(int i=0 ; i<al.size() ;i++)
                {
                    ResultSet rs2=DBLoader.executeQuery("select * from order_detail");
                    rs2.moveToInsertRow();
                    rs2.updateInt("order_id", maxid);
                    rs2.updateInt("prod_id",al.get(i).productid);
                    rs2.updateInt("price",al.get(i).mrp);
                    rs2.updateInt("offerprice",al.get(i).offerprice);
                    rs2.updateInt("quantity",al.get(i).qty);
                    rs2.insertRow();
                   
                }
               al =null;
               session.setAttribute("cartlist",al);
               out.println("Success");
            }
           
        }
        session.setAttribute("order","saved");
           }
        } catch (Exception ex) {
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
