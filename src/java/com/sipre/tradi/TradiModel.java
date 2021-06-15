/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre.tradi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author vpipa
 */
public class TradiModel {
     public static String getInstitucion(Connection con) {
        String json="";
        
        try {
            String sql = "SELECT";
            sql += " CORGANISMO_CODIGO,";
            sql += " CINSTITUCION_CODIGO,";
            sql += " VINSTITUCION_DESCRIPCION";
            sql += " FROM SIPE_INSTITUCION";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                json+=json.length()>0?",":"";
                json+="{\"id\":\""+rs.getString("CORGANISMO_CODIGO")+"-"+rs.getString("CINSTITUCION_CODIGO")+"\",\"desc\":\""+rs.getString("VINSTITUCION_DESCRIPCION")+"\"}";
            }
            
        } catch (SQLException e) {
            System.out.println("Error en getInstitucion(): " + e.getMessage());
        } finally {
            
        }
        return "["+json+"]" ;
    }
     public static String getPrioridad(Connection con) {
        String json="";
        
        try {
            String sql = "SELECT CPRIORIDAD_CODIGO,VPRIORIDAD_DESCRIPCION FROM SIPE_PRIORIDAD            ";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                json+=json.length()>0?",":"";
                json+="{\"id\":\""+rs.getString("CPRIORIDAD_CODIGO")+"\",\"desc\":\""+rs.getString("VPRIORIDAD_DESCRIPCION")+"\"}";
            }
            
        } catch (SQLException e) {
            System.out.println("Error en getInstitucion(): " + e.getMessage());
        } finally {
            
        }
        return "["+json+"]" ;
    }
     public static String getTipoDoc(Connection con) {
        String json="";
        
        try {
            String sql = "SELECT NTIPO_DOCUMENTO_CODIGO, VTIPO_DOCUMENTO_DESCRIPCION   FROM SIPE_TIPO_DOCUMENTO ";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                json+=json.length()>0?",":"";
                json+="{\"id\":\""+rs.getString("NTIPO_DOCUMENTO_CODIGO")+"\",\"desc\":\""+rs.getString("VTIPO_DOCUMENTO_DESCRIPCION")+"\"}";
            }
            
        } catch (SQLException e) {
            System.out.println("Error en getInstitucion(): " + e.getMessage());
        } finally {
            
        }
        return "["+json+"]" ;
    }
     public static String getClasificacion(Connection con) {
        String json="";
        
        try {
            String sql = "SELECT CCLASIFICACION_DOCUMENTO_CODIG,VCLASIFICACION_DOCUMENTO_DESCR    FROM SIPE_CLASIFICACION_DOCUMENTO";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                json+=json.length()>0?",":"";
                json+="{\"id\":\""+rs.getString("CCLASIFICACION_DOCUMENTO_CODIG")+"\",\"desc\":\""+rs.getString("VCLASIFICACION_DOCUMENTO_DESCR")+"\"}";
            }
            
        } catch (SQLException e) {
            System.out.println("Error en getInstitucion(): " + e.getMessage());
        } finally {
            
        }
        return "["+json+"]" ;
    }
}
