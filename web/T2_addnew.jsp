<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,javax.swing.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
       
<form method="post" action="T2_new.jsp" >
     <br>         
<table border="1" >
 <tr >
                 <th width="20%">S.No.</th>
                 <th width="20%">Instructor ID </th>&nbsp
                  <th width="20%">Student ID  </th>&nbsp
                  <th width="20%">Course A  </th>&nbsp
                  <th width="20%">Course B  </th>&nbsp
                  <th width="20%">Course C </th>&nbsp
                  
              </tr><%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
//System.out.println(no);
session.setAttribute("id",no);
//int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
String query = "select * from enrollment_list where SNo='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
    <td><input type="text" name="num" value="<%=rs.getString(6)%>"></td>
    <td><input type="text" name="inst_id" value="<%=rs.getString(1)%>"></td>
    <td><input type="text" name="stud_id" value="<%=rs.getString(2)%>"></td>
    <td><input type="text" name="cA" value="<%=rs.getString(3)%>"></td>
    <td><input type="text" name="cB" value="<%=rs.getString(4)%>"></td>
    <td><input type="text" name="cC" value="<%=rs.getString(5)%>"></td>
     </tr>
<tr>
<td><input id="Update" value="Update" type="submit" class="button"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>
