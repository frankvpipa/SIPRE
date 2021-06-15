/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.opre.models.impl;

import com.opre.models.TradiModel;
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
public class TadiImpl implements TradiModel{
    Connection con=null;
    public TadiImpl(Connection con){
        this.con=con;
    }
    
    @Override
    public  String getInstitucion() {
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
    @Override
     public  String getPrioridad() {
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
     @Override
     public  String getTipoDoc() {
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
     
     @Override
     public  String getClasificacion() {
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
     @Override
     public String getDocumentoReferencia(String periodo, String tipo, String usuario) {
         String json="";
        String add = "";
        if (tipo.equals("I")) {
            add = " DD.CESTADO_DOCUMENTO IN ('RE') ";
        } else {
            add = " DD.CESTADO_DOCUMENTO  IN ('DE','RE','RS') ";
        }
        String sql = "SELECT D.CDOCUMENTO_NUMERO AS CODIGO,"
                + "PK_MESA_PARTES.FUN_NOMBRE_TIPO_DOCUMENTO(D.NTIPO_DOCUMENTO_CODIGO)||'-'||TRIM(D.CDOCUMENTO_NRO_DOCUMENTO)||' '||TRIM(VDOCUMENTO_ASUNTO) AS DESCRIPCION "
                + "FROM SIPE_DOCUMENTO D INNER JOIN SIPE_DECRETO_DOCUMENTO DD ON"
                + "(D.CPERIODO_CODIGO=DD.CPERIODO_CODIGO AND "
                + "D.CDOCUMENTO_NUMERO=DD.CDOCUMENTO_NUMERO) "
                + " WHERE "
                + "D.CPERIODO_CODIGO=? AND "
                + "DD.VUSUARIO_RECEPCION=? AND "
                + "D.CDOCUMENTO_TIPO='E' AND "
                + add
                + "ORDER BY DESCRIPCION";
        try {
            PreparedStatement objPreparedStatement = con.prepareStatement(sql);
            objPreparedStatement.setString(1, periodo);
            objPreparedStatement.setString(2, usuario);
            ResultSet rs = objPreparedStatement.executeQuery();
            while (rs.next()) {
                json+=json.length()>0?",":"";
                json+="{\"id\":\""+rs.getString("CODIGO")+"\",\"desc\":\""+rs.getString("DESCRIPCION")+"\"}";
                
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error al obtener getDocumentoReferencia() " + e.getMessage());
        } 
        return "["+json+"]" ;
    }
}
