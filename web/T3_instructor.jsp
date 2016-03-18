<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
<html lang="en">
<head>
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='T3_edit.jsp?id='+id;
    f.submit();
    out.println("edit");
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='T3_delete.jsp?id='+id;
    f.submit();
    out.println("delete");
}
</script>
<title>Quassi Classe`</title>
<meta charset="utf-8">
<link rel="stylesheet" href="reset.css" type="text/css" media="all">
<link rel="stylesheet" href="layout.css" type="text/css" media="all">
<link rel="stylesheet" href="style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Molengo_400.font.js"></script>
<script type="text/javascript" src="js/Expletus_Sans_400.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.bg, .box2{behavior:url("js/PIE.htc");}</style>
<![endif]-->
</head>

<div class="body1">
  <div class="main">
    <!-- header -->
    <header>
      <div class="wrapper">
        <nav>
          <ul id="menu">
            <li><a href="admin_index.jsp">Home</a></li>
            <li><a href="T1_reg.jsp">Registration</a></li>
            <li><a href="T2_enrollment.jsp">Courses</a></li>
            <li><a href="T3_instructor.jsp">Instructor</a></li>
            <li><a href="T4_student.jsp">Student</a></li>
            <li class="end"><a href="logout.jsp">Logout</a></li>
          </ul>
        </nav>
        
      </div>
      
      <div id="slogan"> 
      
      Quassi Classe`
      
      </div>
      <div id="slogan"> 
      Life in harmony <span>with education </span>
      </div>
    </header>
    <!-- / header -->
  </div>
</div>
<div >
  <div class="main">
    <!-- content -->
    
      
      <div>
          
         
           <%
          try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
   // String inst_id= (String)session.getAttribute("userid");
    //System.out.println(inst_id);
    int num=1,quesn_num_actual;
    ResultSet rs=s.executeQuery("select * from instructor_list");
    %>
          <form border="1" name="form">
          <table >
              <tr >
                  <th width="2%">S.No.</th>&nbsp
                  <th width="20%">Instructor ID  </th>&nbsp
                  <th width="20%">Name  </th>&nbsp
                  <th width="20%">Email ID  </th>&nbsp
                  
              </tr>
                 
       <%
       
    while(rs.next())
            {
       String inst_id, name,  email ;
       //int credit;
       quesn_num_actual=rs.getInt(4);
        inst_id=rs.getString(1);
        name=rs.getString(2);
        email=rs.getString(3);
       
                        %>
                        
                            <tr>
                               
                                <td colspan = "1" align = center"><%=num%></td>
                                <td colspan = "1" align = "center"><%=inst_id%></td>
                                <td colspan = "1" align = "center"><%=name%></td>
                                <td colspan = "1" align = "center"><%=email%></td>
                                <td colspan = "1" align = "center"><input type="button" name="edit" value="Edit" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="editRecord(<%=quesn_num_actual%>);" ></td>
                                <td colspan = "1" align = "center"><input type="button" name="delete" value="Delete" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=quesn_num_actual%>);" ></td>
</tr>
<tr><td>&nbsp;</td></tr>
                             
            <%
            num++;
        }
    con.close();

} catch(Exception e){e.printStackTrace();}

        %>
        </table>
        </form>
       </div>
      <br>
          <br>
&nbsp;<br>
&nbsp;<br>
&nbsp;<br>
    <br>
        <br>
            <br>
                <br>
                    <br>
                        <br>
    <!-- content -->
    <!-- footer -->
    <footer>
      <div class="wrapper">
        <div class="pad1">
          <div class="pad_left1">
            <div class="wrapper">
              <article class="col_1">
                <h3>Address:</h3>
                <p class="col_address"><strong>Country:<br>
                  City:<br>
                  Address:<br>
                  </strong></p>
                <p>INDIA<br>
                  Karaikal<br>
                  Nehru Nagar<br>
                  </p>
              </article>
                          </div>
            <div class="wrapper">
              <article class="call"> <span class="call1">Call Us Now: </span><span class="call2">+91(0)4368-231-665 </span> </article>
              <article class="col_4 pad_left2">Copyright &copy; <a href="www.nitpy.ac.in">nitpy.ac.in</a> All Rights Reserved<br>
              </article>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- / footer -->
  </div>
</div>
<script type="text/javascript">Cufon.now();</script>
</html>