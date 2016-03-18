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
            
            <li><a href="adminfunctions.jsp">Attendance</a></li>
            <li><a href="quiz.jsp">Quiz</a></li>
            <li><a href="inst_result.jsp">Report</a></li>
            <li><a href="question_bank.jsp">Question Bank</a></li>
            <li><a href="quiz_bank.jsp">Quiz Bank</a></li>
            <li><a href="raise_querry_inst.jsp">Raise Hand</a></li>
            <li class="end"><a href="instructor_poll.jsp">Poll</a></li>
            <li class="end">&nbsp;</li>
            <li class="end">&nbsp;</li>
            <li class="end"><a href="logout.jsp">Log Out</a></li>
          </ul>
        </nav>
        
      </div>
      
      <div id="slogan"> 
      
      <a href="instructor_index.jsp">Quassi Classe` </a>
      
      </div>
      <div id="slogan"> 
      Life in harmony <span>with education </span>
      </div>
    </header>
    <!-- / header -->
  </div>
</div>
<div class="body2" name="body2">
  <div class="main" name="main">
    <!-- content -->
    <section id="content" name="section">
   
              <form action="inst_result_display.jsp" method="post">
             <h3>Select Quiz to Display Results</h3>    
         
              <%
          try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String inst_id= (String)session.getAttribute("userid");
    %>
    <select name="ListBox1" cols="50" rows="15" style="border:6px groove #F7730E;" >
    <%
    ResultSet rs=s.executeQuery("select * from testresult where inst_id='"+inst_id+"'");
    while(rs.next())
        {
  %>
        
       <option name="<%=rs.getString(4)%>" value="<%= rs.getString(4)%>"><%= rs.getString(4)%></option>
       <%
       }
    %>
</select>
<br>
    <br>
<input type=submit class="button" value="Show Result">
            <%
    con.close();

} catch(Exception e){e.printStackTrace();}

        %>
    
    
    </form>
        
    </section>
    <!-- content -->
    <!-- footer -->
    <footer>
      <div class="wrapper">
        <div class="pad1">
          <div class="pad_left1">
            <div class="wrapper">
              <article class="col_1">
                 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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