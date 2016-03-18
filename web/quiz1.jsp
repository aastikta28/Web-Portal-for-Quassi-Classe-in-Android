<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.Calendar, java.text.*"%>
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
            <li><a href="result_report.jsp">Report</a></li>
            <li><a href="question_bank.jsp">Question Bank</a></li>
            <li><a href="quiz_bank.jsp">Quiz Bank</a></li>
            <li><a href="instructor_raisehand.jsp">Raise Hand</a></li>
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
           
             
            
				<form action="quiz.jsp" method="post">
                                     <h3>Quiz has been launched.......</h3>
                                     
						<%
   try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
String inst_id = (String)session.getAttribute("userid");
String quiz="";
int t=0;
String id="";
String quesnID[]=new String[100];
String select[] = request.getParameterValues("L1");
 for (int j = 0; j < select.length; j++) 
            {
           quiz=select[j];
            }
ResultSet r=s.executeQuery("select * from quizbank where inst_id ='"+inst_id+"' and quiz_name='"+quiz+"'");
if(r.next())
    {
    t=r.getInt(5);
    id=r.getString(6);
}
quesnID=id.split(",");
%>
<h4>Quiz Name: <%=quiz %> &nbsp; &nbsp; &nbsp; Duration: <%=t%>mins &nbsp; &nbsp; &nbsp;
<%
java.util.Date cur_tym=new java.util.Date();
java.util.Date expire_tym=new java.util.Date();
Calendar c = Calendar.getInstance(); 
c.setTime(cur_tym); 
id.split(",");
c.add(Calendar.MINUTE, t);
expire_tym = c.getTime(); 
DateFormat dateformat = new SimpleDateFormat("HH:mm:ss");
String ct = dateformat.format(cur_tym);
String et = dateformat.format(expire_tym);
//System.out.println(ct);
//System.out.println(et);
%>
Start Time: <%=ct %> &nbsp; &nbsp; &nbsp; End Time: <%=et%></h4><br>
<%
//String list[]=new String[100];
String i="";
       int count=0,a=0;
String quesnid[]=new String[100],quesn[]=new String[100],quesnTyp[]=new String[100],cd[]=new String[100],ans[]=new String[100];
String A[]=new String[100],B[]=new String[100],C[]=new String[100],D[]=new String[100],E[]=new String[100];
ResultSet rst=s.executeQuery("select * from questionbank where inst_id ='"+inst_id+"'");
while(rst.next())
    {
i=rst.getString(2);
count=0;
while(count<quesnID.length)
    {
    if(i.equals(quesnID[count]))
        {
        System.out.println(count);
        quesnid[a]=i;
        quesn[a]=rst.getString(3);
        //System.out.println(quesn[a]);
        quesnTyp[a]=rst.getString(4);
        
       cd[a]=rst.getString(5);
       ans[a]=rst.getString(6);
       A[a]=rst.getString(7);
       B[a]=rst.getString(8);
       C[a]=rst.getString(9);
       if(C[a].equals("null"))
           C[a]="";
       D[a]=rst.getString(10);
       if(D[a].equals("null"))
           D[a]="";
       E[a]=rst.getString(11);
       if(E[a].equals("null"))
           E[a]="";
       
       
       %>
       <br>
           <br>
       <h4>
         Q.No.<%=a+1%>: &nbsp;
         <%=quesn[a]%>
         <%
         if (quesnTyp[a].equals("Single Choice Question"))
             {
             %>
             <h4><input type="radio" name="option1<%=a%>" value="<%=A[a]%>"><%=A[a]%></h4>
             <h4><input type="radio" name="option1<%=a%>" value="<%=B[a]%>"><%=B[a]%></h4>
             <h4><input type="radio" name="option1<%=a%>" value="<%=C[a]%>"><%=C[a]%></h4>
            
             <%
             if(D[a].equals(""))
                 {
                 
             }
             else
                 {
             %>
             <h4><input type="radio" name="option1<%=a%>" value="<%=D[a]%>"><%=D[a]%></h4>
             <%
             }
             if(E[a].equals(""))
                 {
                 
             }
             else
                 {
             %>
             <h4><input type="radio" name="option1<%=a%>" value="<%=E[a]%>"><%=E[a]%></h4>
             <%
             }
         }
       else if (quesnTyp[a].equals("Multiple Choice Question"))
             {
             %>
             <h4><input type="checkbox" name="option2<%=a%>" value="<%=A[a]%>"><%=A[a]%></h4>
             <h4><input type="checkbox" name="option2<%=a%>" value="<%=B[a]%>"><%=B[a]%></h4>
             <h4><input type="checkbox" name="option2<%=a%>" value="<%=C[a]%>"><%=C[a]%></h4>
             <%
             if(D[a].equals(""))
                 {
                 
             }
             else
                 {
             %>
             <h4><input type="checkbox" name="option2<%=a%>" value="<%=D[a]%>"><%=D[a]%></h4>
             <%
             }
             if(E[a].equals(""))
                 {
                 
             }
             else
                 {
             %>
             <h4><input type="checkbox" name="option2<%=a%>" value="<%=E[a]%>"><%=E[a]%></h4>
             <%
             }
         }
       else if (quesnTyp[a].equals("True or False"))
             {
             %>
             <h4><input type="radio" name="option3<%=a%>" value="<%=A[a]%>"><%=A[a]%></h4>
             <h4><input type="radio" name="option3<%=a%>" value="<%=B[a]%>"><%=B[a]%></h4>
              <%
         }
       else if (quesnTyp[a].equals("Numeric Question"))
             {
             %>
             <h4><input type="text" name="option4<%=a%>" ></h4>
             <%
         }
         %>
         
       </h4>
       <%
       a++;
        count++;
        System.out.println(count);
    }
    else
        count++;
}

}


%>

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