<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,javax.swing.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
    <script language="javascript">
      /*  function fnChkItems(qn,cr,an,oa,ob,oc)
        {
            System.out.println("Hi");
            var varqn = document.getElementById(qn); 
            var varcr = document.getElementById(cr); 
            var varan = document.getElementById(an); 
            var varoa = document.getElementById(oa); 
            var varob = document.getElementById(ob);
            var varoc = document.getElementById(oc);
            if ( varqn != null )
                {
                   if(varcr > 0 && varcr < 1000)
                        {
                             if(varan != null)
                                {
                                     if(varoa != null)
                                        {
                                             
                                            if(varob != null)
                                                {
                                                   if(varoc != null)
                                                        {
                                                            return true;
                                                        }
                                                   else
                                                       {
                                                         alert('Enter Option C');
                                                         return false;  
                                                       }
                                                }
                                            else
                                                {
                                                   
                                                 alert('Enter Option B');
                                                 return false; 
                                                }
                                        }
                                     else
                                         {
                                              alert('Enter Option A');
                                              return false;
                                         }
                                }
                             else
                                 {
                                     alert('Enter Answer');
                                     return false;
                                 }
                        }
                     else
                         {
                             alert('Enter Marks');
                            return false;
                         }
                }
            else
                {
                     alert('Enter Question');
                    return false;
                }
                            
        }*/
          
</script>
<%@page language="java"%>
<%@page import="java.sql.*"%>
       
<form method="post" action="T2_update.jsp" >
     <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
           /* String str = request.getParameter("msg");
            if (str != null) 
            {
                                out.println(str);
            }
                    String str1 = request.getParameter("msg1");
            if (str1 != null) 
            {
                            
                           
                                out.println(str1);
            }
            String str2 = request.getParameter("msg2");
            if (str2 != null) 
            {
                            
                           
                                out.println(str2);
            }
           String str3 = request.getParameter("msg3");
            if (str3 != null) 
            {
                            
                           
                                out.println(str3);
            }
            String str4 = request.getParameter("msg4");
            if (str4 != null) 
            {
                            
                           
                                out.println(str4);
            }
            String str5 = request.getParameter("msg5");
            if (str5 != null) 
            {
                            
                           
                                out.println(str5);
            }*/
            
                            %><br>
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
