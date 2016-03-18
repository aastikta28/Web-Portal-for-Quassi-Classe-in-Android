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
       
<form method="post" action="T1_update.jsp" >
     <br>
<table border="1" >
<tr >
                  
                  
                  <th width="12%">First Name  </th>&nbsp
                  <th width="12%">Last Name </th>&nbsp
                  <th width="9%">DOB </th>&nbsp
                  <th width="9%">Gender  </th>&nbsp
                  <th width="9%">State  </th>&nbsp
                  <th width="9%">City </th>&nbsp
                  <th width="9%">Mobile  </th>&nbsp
                  <th width=12%">Email </th>&nbsp
                  
              </tr><%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
//System.out.println(no);
session.setAttribute("id",no);
//int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
String query = "select * from registration where SNo='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
    <td><input type="text" name="fn" value="<%=rs.getString(2)%>"></td>
    <td><input type="text" name="ln" value="<%= rs.getString(3)%>"></td>
    <td><input type="text" name="dob" value="<%=rs.getString(4)%>"></td>
    <td><input type="text" name="gn" value="<%=rs.getString(5)%>"></td>
    <td><input type="text" name="st" value="<%=rs.getString(6)%>"></td>
    <td><input type="text" name="cty" value="<%=rs.getString(7)%>"></td>
    <td><input type="text" name="mob" value="<%=rs.getString(8)%>"></td><br>
    <td><input type="text" name="email" value="<%=rs.getString(9)%>"></td><br>
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
