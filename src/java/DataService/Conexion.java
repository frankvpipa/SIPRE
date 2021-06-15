package DataService;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author vpipa
 */
public class Conexion {
    public static Connection obtenerConexion(String fuente) throws SQLException{
        DataSource ds=null;
        try{
            Context contexto=new InitialContext();
            ds=(DataSource)contexto.lookup("java:comp/env/"+fuente);            
            //System.out.println("____"+ds);
        }catch(Exception ex){
            throw new SQLException(ex);
        }
        return ds.getConnection();
    }

    public static Connection getConexionOracle() throws SQLException{
        return obtenerConexion("jdbc/oracle");
    }

    
    public static void freeConexion(Connection conn){
        try{
            if(conn != null) conn.close();
        }catch(SQLException ex){ ex.printStackTrace();}
    }   
    public static void closeSQLNegotiator(Object conn,Object rs) {
        closeSQLNegotiator(conn);
        closeSQLNegotiator(rs);
    }
    public static void closeSQLNegotiator(Object conn,Object rs,Object pre) {
        closeSQLNegotiator(conn);
        closeSQLNegotiator(rs);
        closeSQLNegotiator(pre);
    }
    public static void closeSQLNegotiator(Object conn,Object rs,Object pre,Object pre2) {
        closeSQLNegotiator(conn);
        closeSQLNegotiator(rs);
        closeSQLNegotiator(pre);
        closeSQLNegotiator(pre2);
    }
    public static void closeSQLNegotiator(Object obj) {
        try {
            String type="";
            if (obj != null) {
                if (obj instanceof Connection) {
                    type="Connection";
                    ((Connection) obj).close();
                } else if (obj instanceof ResultSet) {
                    type="ResultSet";
                    ((ResultSet) obj).close();
                } else if (obj instanceof Statement){
                    type="Statement";
                    ((Statement) obj).close();
                } else if (obj instanceof PreparedStatement) {
                    type="PreparedStatement";
                    ((PreparedStatement) obj).close();
                } else if (obj instanceof CallableStatement) {
                    type="CallableStatement";
                    ((CallableStatement) obj).close();
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en Sist-Matricula metodo closeSQLNegotiator: " + e.getMessage());
        }
    } 
}
