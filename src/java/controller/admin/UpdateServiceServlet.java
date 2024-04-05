/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.ServiceDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author Admin
 */
@WebServlet("/services/update")
public class UpdateServiceServlet extends HttpServlet {

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

        int id = Integer.parseInt(request.getParameter("id"));

        ServiceDAO service = new ServiceDAO();
        Service s = service.getDetailService(id);

        request.setAttribute("title", request.getParameter("title"));
        request.setAttribute("service", s);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/services/updateService.jsp");
        dispatcher.forward(request, response);
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

        try {

            String id = request.getParameter("id");
            String title = request.getParameter("title");
            String thumbnail = request.getParameter("thumbnail");
            String desc = request.getParameter("description");
            String markdown = request.getParameter("markdown");
            String priceParam = request.getParameter("price");
            System.out.println("params: " + id + title + desc + markdown + priceParam);
            if (id == null || title == null || thumbnail == null || desc == null || markdown == null || priceParam == null
                    || title.isEmpty() || thumbnail.isEmpty() || desc.isEmpty() || markdown.isEmpty() || priceParam.isEmpty()) {

                throw new Exception("Missing Parameters");

            }
            int price = (priceParam != null && !priceParam.isEmpty()) ? Integer.parseInt(priceParam) : 0;

            Service service = new Service(id, title, thumbnail, desc, markdown, price);

            ServiceDAO d = new ServiceDAO();
            System.out.println("service updating" + service);

            boolean rowAffected = d.updateServiceById(service);

            if (!rowAffected) {
                System.out.println("update failed");
            }

        } catch (Exception e) {

        } finally {
            response.sendRedirect(request.getContextPath() + "/services/manage");
        }

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
