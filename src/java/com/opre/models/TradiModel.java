/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.opre.models;

import java.sql.Connection;
/**
 *
 * @author vpipa
 */
public interface TradiModel {
    
     public  String getInstitucion() ;
     public  String getPrioridad() ;
     public  String getTipoDoc() ;
     public  String getClasificacion() ;
     public String getDocumentoReferencia(String periodo, String tipo, String usuario); 
         
}
