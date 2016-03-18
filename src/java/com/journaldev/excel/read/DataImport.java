package com.journaldev.excel.read;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;



import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;

public class DataImport {
    
    private HttpServletRequest request = null;
    
    // column names of the MySQL table
    // which should be in the same order as the excel columns
    private String[] columnNames = null;
    
    // table name to import to
    private String tableName = null;
    
    static Connection conn = null;
    
    static PreparedStatement pst = null;
    
    public void setColumnNames(String[] columnNames) {
        this.columnNames = columnNames;
    }
    
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    
    // import data from excel to mysql
    public boolean importdata() {
        boolean result = false;
        try {
            ServletInputStream is = request.getInputStream();
            byte[] junk = new byte[1024];
            int bytesRead = 0;
            
            // strip off the HTTP information from input stream
            // the first four lines are request junk
            bytesRead = is.readLine(junk, 0, junk.length);
            bytesRead = is.readLine(junk, 0, junk.length);
            bytesRead = is.readLine(junk, 0, junk.length);
            bytesRead = is.readLine(junk, 0, junk.length);
            
            // create the workbook object from the ServletInputStream
            Workbook workbook = Workbook.getWorkbook(is);
            Sheet sheet = workbook.getSheet(0); 
            Cell cell = null;
            
            // prepare the insert sql statement
            StringBuffer sql = new StringBuffer("INSERT INTO ").append(tableName).append("(");
            StringBuffer params = new StringBuffer("VALUES(");
            int cols = columnNames.length;
            for (int i = 0; i < cols; i++) {
                sql.append(columnNames[i]).append(",");
                params.append("?,");
            }          
            sql = sql.deleteCharAt(sql.length() - 1).append(")").append(params.deleteCharAt(params.length() - 1)).append(")");
            
            // get database connection
            conn = DBConn.getConnection();
            conn.setAutoCommit(false);
   pst = conn.prepareStatement(sql.toString()); 
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
   // read data from the excel spreadsheet
   // the code here assumes that the data begin in row 2 [A2]
   int rows = sheet.getRows();
   for (int i = 1; i < rows; i++) {
       for (int j = 0; j < cols - 1; j++) {
           cell = sheet.getCell(j, i);
           if (cell.getType() == CellType.DATE) {
                    DateCell datecell = (DateCell)cell;
                    pst.setString(j + 1, df.format(datecell.getDate()));
           } else {
                    pst.setString(j + 1, cell.getContents());
           }       
       }
       pst.executeUpdate();
   }
   conn.commit();
   conn.setAutoCommit(true);
   result = true;
   // close the workbook and free up memory 
            workbook.close();
        } catch (Exception e) {
             try {
                conn.rollback();
            } catch (SQLException ex) {
            }
            result = false;
        } finally {
            closeDB();
        }
        return result;
     }
    
    private static void closeDB() {
     try {
         if (pst != null) {
             pst.close();
             pst = null;
         }
         if (conn != null) {
          conn.close();
          conn = null;
         }
     } catch (Exception e) {}
 }
}