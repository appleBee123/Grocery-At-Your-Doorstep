

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

/**
 *
 * @author lenovo
 */
public class shopkeeperLoginResponse extends HttpServlet {

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
            String emailid = request.getParameter("emailid");
            String password = request.getParameter("password");
            String status = "";
            ResultSet rs;
            if ((emailid.contains("@") && (emailid.contains(".")))) {
                rs = DBLoader.executeQuery("select * from shopkeeper where email='" + emailid + "' and password='" + password + "'");
            } else {
                rs = DBLoader.executeQuery("select * from shopkeeper where shopkeeperid='" + emailid + "' and password='" + password + "'");
            }

            try {
                if (rs.next()) {
                    status = rs.getString("status");

                    if (status.equals("active")) {
                        out.println("success");                             //success
                        HttpSession session = request.getSession();
                        try {
                            int id = rs.getInt("shopkeeperid");
                            String name = rs.getString("shopkeepername");
                            String shopname = rs.getString("shopname");
                            String phoneno = rs.getString("phoneno");
                            String email = rs.getString("email");
                            String address = rs.getString("address");
                            String website = rs.getString("website");
                            String city = rs.getString("city");
                            String securityquestion = rs.getString("securityquestion");
                            
                            String securityanswer = rs.getString("securityanswer");
                            session.setAttribute("id", id);
                            session.setAttribute("name", name);
                            session.setAttribute("shopname", shopname);
                            session.setAttribute("phoneno", phoneno);
                            session.setAttribute("email", email);
                            session.setAttribute("address", address);
                            session.setAttribute("website", website);
                            session.setAttribute("city", city);
                            session.setAttribute("securityquestion", securityquestion);
                            session.setAttribute("securityanswer", securityanswer);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    } else {
                        out.println("pending");                               //pending
                    }
                } else {
                    out.println("fail");                             //fail
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
