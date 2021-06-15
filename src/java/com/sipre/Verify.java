/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre;

import BusinessServices.Beans.BeanTareas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author vpipa
 */
public class Verify {
    
    public static String getInfo(Connection con) {
        String descripcion="";
        String sql = "SELECT VDOCUMENTO_ASUNTO FROM SIPE_DOCUMENTO WHERE CDOCUMENTO_NUMERO=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,"01731");
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                descripcion=rs.getString("VDOCUMENTO_ASUNTO");
            }
            
        } catch (SQLException e) {
            System.out.println("Error en getInfo(): " + e.getMessage());
        } finally {
            
        }
        return descripcion ;
    }
}
