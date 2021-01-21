/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Pooja
 */
public class crew extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        int c_id = Integer.parseInt(request.getParameter("user"));
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueLines","root","root");
            
            Statement st=con.createStatement();
            String sql="select * from crew where c_id="+c_id;
            
            ResultSet rs=st.executeQuery(sql);
            while(rs.next())
            {
                out.println("Crew-Id :"+rs.getInt("c_id"));
                out.println("Name :"+rs.getString("c_name"));
                out.println("Designation :"+rs.getString("c_des"));
                out.println("Residence Country:"+rs.getString("c_nation"));
                out.println("Address :"+rs.getString("c_addr"));
                out.println("Contact :"+rs.getInt("c_con"));
                out.println("Salary-Id :"+rs.getInt("c_salId"));
                out.println("Salary :"+rs.getInt("c_sal"));
                out.println("Duty Period :"+rs.getString("c_period"));
                out.println("Present Schedule :"+rs.getString("c_pduty"));
                out.println("Present Route-Id :"+rs.getString("route_id"));
                out.println("Present Vessel-Id :"+rs.getInt("vessel_id"));
                out.println("Next Schedule :"+rs.getString("c_nduty"));
                
                
            }
            
            
        }
        catch(Exception e)
        {
            out.println("");
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
