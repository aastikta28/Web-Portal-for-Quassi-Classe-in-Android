/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.journaldev.excel.read;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
/**
 *
 * @author Durga
 */
public class ReadEmployeeAttendanceDesktop {

    @SuppressWarnings("unchecked")
    public static void main(String[] args) throws Exception {

        Map employeeMap = new LinkedHashMap();

        String fileName = "C:/Users/Durga/Documents/NetBeansProjects/question_paper1.xlsx";

        // Create an ArrayList to store the data read from excel sheet.
        List sheetData = new ArrayList();

        FileInputStream fis = null;
        try {

            fis = new FileInputStream(fileName);

            // Create an excel workbook from the file system.
            HSSFWorkbook workbook = new HSSFWorkbook(fis);

            HSSFSheet sheet = workbook.getSheetAt(0);// gets the first sheet on workbook

            Iterator rows = sheet.rowIterator();
            while (rows.hasNext()) {
                HSSFRow row = (HSSFRow) rows.next();
                Iterator cells = row.cellIterator();
                //count=count+1;
                List data = new ArrayList();
                while (cells.hasNext()) {
                    HSSFCell cell = (HSSFCell) cells.next();
                    data.add(cell);
                }

                sheetData.add(data);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                fis.close();
            }
        }
        employeeMap =  showExcelData(sheetData);
        String previousEemployeeID = "",employeeID[];
        Iterator<Map.Entry> entries = employeeMap.entrySet().iterator();
        int i=0;
        while (entries.hasNext()) {
            Map.Entry entry = entries.next();
            employeeID = entry.getKey().toString().split("_");
            System.out.println("employeeid : "+employeeID[0]);

            if(previousEemployeeID.equals(employeeID[0])){
                System.out.println(" If Key = " + entry.getKey() + ", Value = " + entry.getValue()+"  : possible key is : "+employeeID[0]+"_"+String.valueOf(i));
                i++;
            }else{
                if(i==0) System.out.println("previousEmployee id : "+entry.getKey()); 
                System.out.println("Else Key = " + entry.getKey() + ", Value = " + entry.getValue()+"  : possible key is : "+employeeID[0]+"_"+String.valueOf(i));
                i=0;
            }
            previousEemployeeID = employeeID[0];

        }
    }
    private static Map showExcelData(List sheetData) {
        String tempEmpid="",strdepartment="";
        int j=1;

        Map employeeMap = new LinkedHashMap();
        Map tempEmployeeMap = new LinkedHashMap();

        for (int i = 0; i < sheetData.size(); i++) {
            List list = (List) sheetData.get(i);
                HSSFCell employeeid = (HSSFCell) list.get(0);
                HSSFCell department = (HSSFCell) list.get(3);
                HSSFCell date = (HSSFCell) list.get(5);

                strdepartment = department.getRichStringCellValue().getString();
                      if(!(employeeid.getRichStringCellValue().getString().equals("EmpID") || date.getRichStringCellValue().getString().equals("Date") || department.getRichStringCellValue().getString().equals("Department"))){

                           if(!(strdepartment.equals("Temporary Card") || strdepartment.equals("Contractor"))){
                                   employeeMap.put(employeeid.getRichStringCellValue().getString()+"_"+j,date.getRichStringCellValue().getString());
                                   j++;   
                            }
                       }// System.out.println("");
        }
        return employeeMap;
    }
    
}
