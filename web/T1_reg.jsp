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
    f.action='T1_edit.jsp?id='+id;
    f.submit();
    out.println("edit");
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='T1_delete.jsp?id='+id;
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
    //String inst_id= (String)session.getAttribute("userid");
    //System.out.println(inst_id);
    int num=1,actual_num=0;
    ResultSet rs=s.executeQuery("select * from registration");
    %>
          <form border="1" name="form">
          <table >
              <tr >
                  <th width="2%">S.No.</th>&nbsp
                  <th width="15">Role  </th>&nbsp
                  <th width="15%">First Name  </th>&nbsp
                  <th width="15%">Last Name </th>&nbsp
                  <th width="9%">DOB </th>&nbsp
                  <th width="9%">Gender  </th>&nbsp
                  <th width="9%">State  </th>&nbsp
                  <th width="9%">City </th>&nbsp
                  <th width="9%">Mobile  </th>&nbsp
                  <th width="9%">Email </th>&nbsp
                  <th width="9%">Login ID  </th>&nbsp
              </tr>
                 
       <%
       
    while(rs.next())
            {
       String role, fname,lname,dob,gender,state,city,mobile,email,login ;
       //int credit;
       actual_num=rs.getInt(12);
        fname=rs.getString(2);
        role=rs.getString(1);
        lname=rs.getString(3);
        dob=rs.getString(4);
        gender=rs.getString(5);
        state=rs.getString(6);
        city=rs.getString(7);
        mobile=rs.getString(8);
       email=rs.getString(9);
        login=rs.getString(11);
        
      
                        %>
                        
                            <tr>
                               
                                <td colspan = "1" align = center"><%=num%></td>
                                <td colspan = "1" align = "center"><%=role%></td>
                                <td colspan = "1" align = "center"><%=fname%></td>
                                <td colspan = "1" align = "center"><%=lname%></td>
                                <td colspan = "1" align = "center"><%=dob%></td>
                                <td colspan = "1" align = "center"><%=gender%></td>
                                <td colspan = "1" align = "center"><%=state%></td>
                                <td colspan = "1" align = "center"><%=city%></td>
                                <td colspan = "1" align = "center"><%=mobile%></td>
                                <td colspan = "1" align = "center"><%=email%></td>
                                <td colspan = "1" align = "center"><%=login%></td>
                                <td colspan = "1" align = "center"><input type="button" name="edit" value="Edit" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="editRecord(<%=actual_num%>);" ></td>
                                <td colspan = "1" align = "center"><input type="button" name="delete" value="Delete" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=actual_num%>);" ></td>
</tr>
<tr>
    <td colspan = "1" align = center">&nbsp;</td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>
                                <td colspan = "1" align = "center"></td>

</tr>                          
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