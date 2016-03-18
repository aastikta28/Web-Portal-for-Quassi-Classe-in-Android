<%-- 
    This jsp page is used to store data into the the database table when the new user is registering for the quiz module.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>


    
    <%

try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    //Getting the various parameters which have been given by the user.
    String inst_id= (String)session.getAttribute("userid");
   int count= (Integer)session.getAttribute("count");
   //System.out.println(count);
   int year=Integer.parseInt(request.getParameter("year"));
int month =Integer.parseInt(request.getParameter("month"));
int dt =Integer.parseInt(request.getParameter("date"));
String course=request.getParameter("ListBox1");
//System.out.println(course);
//String[] std=new String[100];
int j=0,i=0;
//String[] match=new String[100];
/*ResultSet rs=s.executeQuery("select stud_id from enrollment_list where inst_id='"+inst_id+"' and (course='"+course+"' or course1='"+course+"' or course2='"+course+"')");
while(rs.next())
    {
    std[j]=rs.getString(1);
    //System.out.println(std[j]);
    j++;
}*/
String[] textbox=request.getParameterValues("s");


/*for(i=0;i < j;i++)
       {
     //System.out.println(textbox[i]);
     for(int k=0;k<count;k++)
         {
    if(std[i].equals(textbox[k]))
        {
        match[i]="True";
        
    }
    else
        match[i]="False";
    }
     System.out.println(match[i]);
     }*/
//String[] attendance=new String[100];
int absent,present;

   for(i=0;i < count;i++)
       {
      
    if(textbox[i].equals(""))
        {
        
    }
    else
        {
        absent=0;
        present=1;
   s.executeUpdate("insert into attendance values('" +inst_id+"','"+ textbox[i]+ "','"+dt+"','"+month+"','"+year+"','"+present+"','"+absent+"','"+course+"')");
   }
    }
 
 

    con.close();

} catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="adminfunctions.jsp"/>
