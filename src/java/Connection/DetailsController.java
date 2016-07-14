/**
 * @author jimivine
 *
 */
package Connection;

import Objects.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DetailsController", urlPatterns = {"/services/student.json"})
public class DetailsController extends HttpServlet {

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
        PrintWriter out2 = response.getWriter();

        try {
            String username = request.getParameter("username");
            Student userOutput = DBAccess.getUserInfo(username);

            String actionind = request.getParameter("actionind");

            if ("1".equals(actionind)) {
                username = request.getParameter("username");
                String fullname = request.getParameter("full_name");
                String uni = request.getParameter("uniname");
                String years = request.getParameter("years");
                String course = request.getParameter("course");
                String status = request.getParameter("status");

                try {

                    boolean uniExists = DBAccess.checkUniExists(uni);
                    if (uniExists == false) {
                        out2.println("{\n"
                                + "    \"response\": \"nouni\"\n"
                                + "}");
                        return;
                    }
                } catch (Exception e) {
                    System.err.println(e);
                }

                try {
                    boolean updWorked = DBAccess.updStudent(username, fullname, uni, years, course, status);
                    if (updWorked == false) {
                        out2.println("{\n"
                                + "    \"response\": \"fail\"\n"
                                + "}");
                    } else {
                        out2.println("{\n"
                                + "    \"username\": \"" + username + "\",\n"
                                + "    \"response\": \"success\"\n"
                                + "}");
                    }
                } catch (Exception e) {
                    System.err.println(e);
                }
            } else {
                if (userOutput == null) {

                    out2.println("{\n"
                            + "    \"response\": \"fail\"\n"
                            + "}");
                } else {
                    out2.println("{\n"
                            + "    \"full_name\": \"" + userOutput.getFullName() + "\",\n"
                            + "    \"university\": \"" + userOutput.getUni() + "\",\n"
                            + "    \"years\": \"" + userOutput.getYears() + "\",\n"
                            + "    \"course\": \"" + userOutput.getCourse() + "\",\n"
                            + "    \"status\": \"" + userOutput.getStatus() + "\",\n"
                            + "    \"response\": \"success\"\n"
                            + "}");
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            out2.close();
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
