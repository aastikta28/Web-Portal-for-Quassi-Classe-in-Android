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
    f.action='edit.jsp?id='+id;
    f.submit();
    out.println("edit");
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
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
    String inst_id= (String)session.getAttribute("userid");
    //System.out.println(inst_id);
    int quesn_num=1,quesn_num_actual;
    ResultSet rs=s.executeQuery("select * from questionbank where inst_id='"+inst_id+"'");
    %>
          <form border="1" name="form">
          <table >
              <tr >
                  <th width="2%">S.No.</th>&nbsp
                  <th width="20%">Question  </th>&nbsp
                  <th width="18%">Question type  </th>&nbsp
                  <th width="2%">Marks  </th>&nbsp
                  <th width="10%">Option A  </th>&nbsp
                  <th width="10%">Option B  </th>&nbsp
                  <th width="10%">Option C  </th>&nbsp
                  <th width="10%">Option D  </th>&nbsp
                  <th width="10%">Option E  </th>&nbsp
                  <th width="10%">Answer  </th>&nbsp
                  <th width="10%">  </th>&nbsp
              </tr>
                 
       <%
       
    while(rs.next())
            {
       String quesn, quesn_type,  answer, optionA, optionB, optionC, optionD, optionE ;
       int credit;
        quesn_num_actual=rs.getInt(2);
        quesn=rs.getString(3);
        quesn_type=rs.getString(4);
        credit=rs.getInt(5);
        answer=rs.getString(6);
        optionA=rs.getString(7);
        if(optionA.equals("null"))
            {
            optionA="";
            }
        optionB=rs.getString(8);
        if(optionB.equals("null"))
            {
            optionB="";
           }
        optionC=rs.getString(9);
        if(optionC.equals("null"))
            optionC="";
        optionD=rs.getString(10);
        if(optionD.equals("null"))
            optionD="";
        optionE=rs.getString(11);
        if(optionE.equals("null"))
            optionE="";
        
      
                        %>
                        
                            <tr>
                               
                                <td colspan = "1" align = center"><%=quesn_num%></td>
                                <td colspan = "1" align = "center"><%=quesn%></td>
                                <td colspan = "1" align = "center"><%=quesn_type%></td>
                                <td colspan = "1" align = "center"><%=credit%></td>
                                <td colspan = "1" align = "center"><%=optionA%></td>
                                <td colspan = "1" align = "center"><%=optionB%></td>
                                <td colspan = "1" align = "center"><%=optionC%></td>
                                <td colspan = "1" align = "center"><%=optionD%></td>
                                <td colspan = "1" align = "center"><%=optionE%></td>
                                <td colspan = "1" align = "center"><%=answer%></td>
                                <td colspan = "1" align = "center"><input type="button" name="edit" value="Edit" style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="editRecord(<%=quesn_num_actual%>);" ></td>
                                <td colspan = "1" align = "center"><input type="button" name="delete" value="Delete" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=quesn_num_actual%>);" ></td>
</tr>
                             
            <%
            quesn_num++;
        }
    con.close();

} catch(Exception e){e.printStackTrace();}

        %>
        </table>
        </form>
        <br>
        <br>
            <br>
                <br>
        <h3><a href="add_quesn.jsp">Add New Questions</a></h3>
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