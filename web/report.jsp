<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.Calendar"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
<html lang="en">
<head>
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
            <li><a href="student_index.jsp">Home</a></li>
            <li><a href="report.jsp">Attendance Report</a></li>
            <li><a href="stud_qiz.jsp">Quiz</a></li>
            <li><a href="stud_result.jsp">Report</a></li>
            <li><a href="raise_querry_stud.jsp">Raise Hand</a></li>
            <li><a href="stud_poll.jsp">poll</a></li>
            
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
<div class="body2">
  <div class="main">
    <!-- content -->
    <section id="content">
      <div class="wrapper">
        <div class="pad1 pad_top1">
        </div>
      </div>
      <div class="box1">
        <div >
          <article >
           
             
            
				<form action="report_atten.jsp" method="post">
                                     
						<%
                                               try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    //Getting the various parameters which have been given by the user.
  
 String stud_id = (String)session.getAttribute("userid");
String c="",c1="",c2="";
String list[]=new String[5];
int i=0;
ResultSet r=s.executeQuery("select course,course1,course2 from enrollment_list where stud_id ='"+stud_id+"'");
if(r.next())
    {
    c=r.getString(1);
    
    c1=r.getString(2);
    
    c2=r.getString(3);
    
    }
%>
<br>
    <br>
<select name="L1" id="L1" cols="50" rows="15" style="border:6px groove #F7730E;" size="3" multiple="true">
    <option name="O1" value="<%= c%>"><%= c%></option>
    <option name="O2" value="<%= c1%>"><%= c1%></option>
    <option name="O3" value="<%= c2%>"><%= c2%></option>
    </select>
    <br>
        <br>
    <input name="button" value="Select Course" type="submit" class="button">

<%

    con.close();
 } 
                                                 
    catch(Exception e)
            {
        e.printStackTrace();
    }
  
          %>
                 <h3>&nbsp;</h3>
                 </form>
                
             </article>
        </div>
      </div>
    </section>
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