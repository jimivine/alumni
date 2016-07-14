/**
 * @author jimivine
 *
 *
 */
package Connection;

import Objects.University;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UniController", urlPatterns = {"/services/university.json"})
public class UniController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out2 = response.getWriter()) {
            DBAccess database = new DBAccess();

            ArrayList<University> unis = DBAccess.getAllUnis(); //Select all Unis

            if (unis.isEmpty() == false) {
                out2.println("{\n"
                        + " \"universities\":[ \n");
                boolean isfirst = true;
                for (University u : unis) {
                    if (isfirst) {
                        isfirst = false;
                    } else {
                        out2.println(",");
                    }
                    out2.println("      {\n"
                            + "    \"university\": \"" + u.getUniName() + "\"\n"
                            + "}");
                }
                out2.println("  ]\n}");
            } else {
                out2.println("{\n"
                        + "    \"response\": \"fail\"\n"
                        + "}");
            }
        } catch (Exception ex) {
            System.err.println(ex);
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
