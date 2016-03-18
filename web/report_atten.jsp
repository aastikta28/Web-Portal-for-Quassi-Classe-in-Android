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
           
             
            
				<form>
                                     
						<%
                                               try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    //Getting the various parameters which have been given by the user.
  String c="";
 String stud_id = (String)session.getAttribute("userid");
 String select[] = request.getParameterValues("L1");
 for (int i = 0; i < select.length; i++) 
            {
            System.out.println(select[i]);
            c=select[i];
            }
int mnth = Calendar.getInstance().get(Calendar.MONTH);
int yr = Calendar.getInstance().get(Calendar.YEAR);
mnth=mnth+1;
float present=0;
float total=0;
float absent=0 ;
float percent=0;
String inst_id="";
String[] course=new String[3];
int i=0;
ResultSet r=s.executeQuery("select DISTINCT inst_id from attendance where stud_id='"+stud_id+"' and course='"+c+"'");
if(r.next())
    {
    inst_id=r.getString(1);
}
ResultSet rs1=s.executeQuery("select DISTINCT * from attendance where stud_id='"+stud_id+"' and course='"+c+"'");

   while(rs1.next())
        {
         int cmp_mnth=rs1.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rs1.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
//System.out.println(present);
           

  int num_days[]=new int[12];
  int k=0;
  ResultSet rs2=s.executeQuery("select * from workingdays where inst_id ='"+inst_id+"' and year='"+yr+"'");
  if(rs2.next())
      {
      while(k<12)
          {
      num_days[k]=rs2.getInt(3+k);
      System.out.println(num_days[k]);
      k++;
     // System.out.println(k);
      }
  }
  int tot_mnth=0,l=0;
 for(int j=mnth-1;j>0;j--)
     {
    tot_mnth=tot_mnth+num_days[l];
    l++;
 }
  System.out.println(tot_mnth);
  total=tot_mnth;
  
  //System.out.println(percent);
  absent=total-present;
  percent=present*(1/total)*100;
  %>    
<br>
    <br>
    <h3 align = "center"><font color="blue"><%=c%></font></h3>
   

                                                <table>
						<tr>
						<th>Total No. of Days:</th>
						<th><%=total%></th>
						</tr>
                                                 <tr>
						<th>&nbsp; </th>
						
						</tr>
                                                 <tr>
                                                <th>No. of days present:</th>
						<th><%=present%></th>
						</tr>
                                                 <tr>
						<th>&nbsp; </th>
						
						</tr>
						<tr>
						<th>No. of Days Absent: </th>
						<th><%=absent%></th>
						</tr>
                                                 <tr>
						<th>&nbsp; </th>
						
						</tr>
						<tr>
						<th>Attendance Percentage: &nbsp &nbsp</th>
						<th><%=percent %></th>
							</tr>
                                                         <tr>
						<th>&nbsp; </th>
						
						</tr>
							</table><br>
							<%
							if(percent<60.00)
							{
								%>
						
                                                 <h1><font color="red">U ARE IN DANGER !!!</font></h1>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
                                                                 <h1><font color="yellow">POOR</font></h1>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
                                                                 <h1><font color="green">GOOD</font></h1>
						<%	
							}
                                                       else
							{
								%>
								
								<h1>Sorry ! No attendance found. Please select again</h1>
								<%
							} 
                                                                       
						%>
						
						
				</form>    
    <%
    con.close();
 } 
                                                 
    catch(Exception e)
            {
        e.printStackTrace();
    }
  
          %>
                 <h3>&nbsp;</h3>

                 
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