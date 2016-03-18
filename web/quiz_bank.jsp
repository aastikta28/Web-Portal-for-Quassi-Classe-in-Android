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
<script language="javascript">
    function fnMoveItems(lstbxFrom,lstbxTo) 
{ 
var varFromBox = document.all(lstbxFrom); 
var varToBox = document.all(lstbxTo); 
if ((varFromBox != null) && (varToBox != null)) 
{ 
if(varFromBox.length < 1) 
{ 
alert('There are no items in the source ListBox'); 
return false; 
} 
if(varFromBox.options.selectedIndex == -1) // when no Item is selected the index will be -1 
{ 
alert('Please select an Item to move'); 
return false; 
} 
 
var newOption = new Option(); // Create a new instance of ListItem 
newOption.text = varFromBox.options[varFromBox.options.selectedIndex].text; 
newOption.value = varFromBox.options[varFromBox.options.selectedIndex].value; 
varToBox.options[varToBox.length] = newOption; //Append the item in Target Listbox 
varFromBox.remove(varFromBox.options.selectedIndex); //Remove the item from Source Listbox 
 
} 
return false; 
}
/*function selectAll(listID) {
var oList = document.getElementById(listID);
for(var i=0;i<oList.options.length;i++) {
oList.options.selected = true;
}
*/
	function listbox_selectall(listID, isSelect) {
		var listbox = document.getElementById(listID);
		for(var count=0; count < listbox.options.length; count++) {
			listbox.options[count].selected = isSelect;
	}
}
</script>
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
      
      <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
            String str2 = request.getParameter("msg2");
            if (str2 != null) {
                            
                           
                                out.println(str2);
                            
                           
            }
                            %>
           
              <h2>Create Quiz</h2> 
             <h3>Available Questions</h3>    
         <form action="quiz_addq.jsp" method="post">
              <%
          try
        {
    

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    String inst_id= (String)session.getAttribute("userid");
    //System.out.println(inst_id);
    int quesn_num=0,count=0;
    ResultSet rs=s.executeQuery("select * from questionbank where inst_id='"+inst_id+"'");
    while(rs.next())
        count++;
    ResultSet rs1=s.executeQuery("select * from questionbank where inst_id='"+inst_id+"'");
    %>
<select name="ListBox1" cols="50" rows="15" style="border:6px groove #F7730E;" size="<%=count%>" multiple="true">
    <% while(rs1.next())
        {
        quesn_num=rs1.getInt(2);
        
        %>
        
       <option name="<%=quesn_num%>" value="<%= rs1.getString(3)%>"><%= rs1.getString(3)%></option>
       <%
       }
    %>
</select>



 
 &nbsp;<input id="btnMoveDown" value="Add" type="button" class="button" onclick = "fnMoveItems('ListBox1','ListBox2')">
 
 
       <h3>Quiz Questions</h3>
         
<select name="ListBox2" id="ListBox2" cols="50" rows="15" style="border:6px groove #F7730E;" size="<%=count%>" multiple="true">
 
</select>
 <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
            String str3 = request.getParameter("msg3");
            if (str3 != null) {
                            
                           
                                out.println(str3);
                            
                           
            }
                            %>
&nbsp;<input id="btnMoveUp" value="Remove" type="button" onclick = "fnMoveItems('ListBox2','ListBox1')" class="button">

 <h3>Quiz Name</h3>
 
<input type="text" name="qname" style="border:6px groove #F7730E;">
     <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
            String str = request.getParameter("msg");
            if (str != null) {
                            
                           
                                out.println(str);
                            
                           
            }
                            %>
   
    
     <h3>Duration (in mins)</h3>
 
<input type="text" name="duration" style="border:6px groove #F7730E;">
     <%
            /*if username or password is invalid then the user is redirected back from the page login.jsp to this page with the message "Invalid UserId/Password" stored in the variable 'msg'*/
            /*The error message is printed here and user has to enter the data again*/
            String str1 = request.getParameter("msg1");
            if (str1 != null) {
                            
                           
                                out.println(str1);
                            
                           
            }
                            %>
  <br>      
   <input name="button" value="Create Quiz" type="submit" class="button" onclick="listbox_selectall('ListBox2', true);">
    
    
         
            <%
          //  quesn_num++;
       // }
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