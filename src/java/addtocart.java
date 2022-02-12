

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
public class addtocart extends HttpServlet {

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
         
        try {
            int qty = 1;
            HttpSession session = request.getSession();
            String productid = request.getParameter("productid");
            ArrayList<product> al = null;
            if (session.getAttribute("cartlist") == null) {
                al = new ArrayList<>();
                ResultSet rs =DBLoader.executeQuery("select * from products where productid=" + productid);
                if (rs.next()) {
                    int pid = rs.getInt("productid");
                    String productname = rs.getString("productname");
                    String description = rs.getString("productdes");
                    int mrp = rs.getInt("mrp");
                    int offerprice = rs.getInt("offerprice");
                    String image = rs.getString("primaryphoto");
                    String catname = rs.getString("category");
                    String brand = rs.getString("brand");
                    int sid = rs.getInt("shopkeeperid");
                    product obj = new product(pid, mrp, offerprice, sid, productname, image,description, brand,catname,qty);
                    al.add(obj);
                    session.setAttribute("cartlist", al);
                    out.println("success");
                }

            } else {

                al = (ArrayList<product>) session.getAttribute("cartlist");
                int flag = 0;
                for (int i = 0; i < al.size(); i++) {
                    if (al.get(i).productid == Integer.parseInt(productid)) {

                        product obj = al.get(i);
                        obj.qty = obj.qty + 1;
                        al.set(i, obj);
                        flag = 1;
                        out.println("success");
                        break;
                    }
                }
                if (flag == 0) {
                ResultSet rs = DBLoader.executeQuery("select * from products where productid=" + productid);
                    if (rs.next()) {
//                        int pid = rs.getInt("product_id");
                         int pid = rs.getInt("productid");
                    String productname = rs.getString("productname");
                    String description = rs.getString("productdes");
                    int mrp = rs.getInt("mrp");
                    int offerprice = rs.getInt("offerprice");
                    String image = rs.getString("primaryphoto");
                    String catname = rs.getString("category");
                    String brand = rs.getString("brand");
                    int sid = rs.getInt("shopkeeperid");
         product obj = new product(pid, mrp, offerprice, sid, productname, image,description, brand,catname,qty);
                        al.add(obj);
                        session.setAttribute("cartlist", al);
                        out.println("success");
                    }

                }
                
                for (int i = 0; i < al.size(); i++) {
                    System.out.println("Name-- "+al.get(i).productname);
                                        System.out.println("Quantity-- "+al.get(i).qty);

                }
    
                
            }
            
            
            
        } catch (Exception ex) {
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
