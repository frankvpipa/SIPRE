/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.opre.controllers;

import DataService.Conexion;
import com.opre.models.TradiModel;
import com.opre.models.impl.TadiImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vpipa
 */
public class TradiController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        try  {
            PrintWriter out = response.getWriter();
            String action=request.getParameter("act");
            String json="";
            con=Conexion.getConexionOracle();
            TadiImpl tmodel=new TadiImpl(con);
            if(action.equals("listOfRemision")){
                response.setContentType("application/json;charset=UTF-8");
                json ="[";
                json +="{";
                json +="\"id\": \"1\",";
                json +=" \"name\": \"Resolucion 1\",";
                json+=" \"type\": \"R00012\",";
                json+=" \"calories\": \"asd aasda asdadadadsasd tedf\",";
                json+=" \"totalfat\": \"01/02/2021\",";
                json+=" \"protein\": \"Alta\",";
                json+=" \"dirigido\": \"Teniente  Bryan\"";
                json+=" },";
                json +="{";
                json +="\"id\": \"2\",";
                json +=" \"name\": \"Resolucion 2\",";
                json+=" \"type\": \"R00013\",";
                json+=" \"calories\": \"asd aasda asdadadadsasd tedf\",";
                json+=" \"totalfat\": \"01/02/2021\",";
                json+=" \"protein\": \"Alta\",";
                json+=" \"dirigido\": \"Teniente  Bryan\"";
                json+=" },";
                json +="{";
                json +="\"id\": \"3\",";
                json +=" \"name\": \"Resolucion 3\",";
                json+=" \"type\": \"R00014\",";
                json+=" \"calories\": \"asd aasda asdadadadsasd tedf\",";
                json+=" \"totalfat\": \"01/02/2021\",";
                json+=" \"protein\": \"Alta\",";
                json+=" \"dirigido\": \"Teniente  Bryan\"";
                json+=" }";
                
                json+=" ]   ";            
            }else if(action.equals("ginsticion")){
                json= tmodel.getInstitucion();
            }else if(action.equals("gprioridad")){
                json= tmodel.getPrioridad();
            }else if(action.equals("gTipoDoc")){
                json= tmodel.getTipoDoc();
            }else if(action.equals("gClasificacion")){
                json= tmodel.getClasificacion();
            }
            out.println(json);
            out.flush();
            out.close();
            
        }catch(Exception err){err.printStackTrace();}
        finally{
            if(con!=null){
                try{
                con.close();
                }catch(Exception ex){}
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
