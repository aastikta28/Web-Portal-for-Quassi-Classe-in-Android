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
       
<form method="post" action="update.jsp" >
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
<tr><th>Question</th><th>Credit</th><th>Answer</th><th>Option A</th><th>Option B</th><th>Option C</th><th>Option D</th><th>Option E</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
//System.out.println(no);
session.setAttribute("id",no);
//int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
String query = "select * from questionbank where question_num='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
    <td><input type="text" name="quesn" value="<%=rs.getString("question")%>"></td>
    <td><input type="text" name="credit" value="<%=rs.getInt("credit")%>"></td>
    <td><input type="text" name="ans" value="<%=rs.getString("answer")%>"></td>
    <td><input type="text" name="opA" value="<%=rs.getString("optionA")%>"></td>
    <td><input type="text" name="opB" value="<%=rs.getString("optionB")%>"></td>
    <td><input type="text" name="opC" value="<%=rs.getString("optionC")%>"></td>
    <td><input type="text" name="opD" value="<%=rs.getString("optionD")%>"></td><br>
    <td><input type="text" name="opE" value="<%=rs.getString("optionE")%>"></td><br>
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
