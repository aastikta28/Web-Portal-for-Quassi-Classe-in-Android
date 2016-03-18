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
                                     <table>
                                         <tr>
                                             <th width="15%">Student ID</th>
                                                
                                             <th width="15%">Total No. of Days</th>
                                             
                                             <th width="15%">No. of days present</th>
                                             
                                             <th width="15%">No. of days absent</th>
                                             
                                             <th width="15%">Percentage</th>
                                             
                                             <th width="15%">Status</th>
                                             </tr>
						<%
                                               try
        {

//Establishing connection with back end database
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    //Getting the various parameters which have been given by the user.
  
 String inst_id = (String)session.getAttribute("userid");
int mnth = Calendar.getInstance().get(Calendar.MONTH); 
int yr= Calendar.getInstance().get(Calendar.YEAR);
System.out.println(yr);
float present=0,absent=0,total=0 ;
float percent=0;
String c="",c1="",c2="";
String select[] = request.getParameterValues("L1");
 for (int i = 0; i < select.length; i++) 
            {
           // System.out.println(select[i]);
            c=select[i];
            }
%>
<br>
    <br>
  <h3><%=c%></h3>
<%

String list[]=new String[5];
int i=0;
 int num_days[]=new int[12];
  int k=0;
  ResultSet rs2=s.executeQuery("select * from workingdays where inst_id ='"+inst_id+"' and year='"+yr+"'");
  if(rs2.next())
      {
      while(k<12)
          {
      num_days[k]=rs2.getInt(3+k);
    //  System.out.println(num_days[k]);
      k++;
     // System.out.println(k);
      }
  }
  int tot_mnth=0,l=0;
 for(int j=mnth;j>0;j--)
     {
    tot_mnth=tot_mnth+num_days[l];
    l++;
 }
 // System.out.println(tot_mnth);
  total=tot_mnth;
  
ResultSet r=s.executeQuery("select stud_id from enrollment_list where inst_id ='"+inst_id+"'");
while(r.next())
    {
   /* c=r.getString(1);
    c1=r.getString(2);
    c2=r.getString(3);*/
    list[i]=r.getString(1);
    i++;
    }
 
//System.out.println(mnth);
mnth=mnth+1;

 ResultSet rst0=s.executeQuery("select DISTINCT * from attendance where stud_id='"+list[0]+"' and course='"+c+"'");

   while(rst0.next())
        {
         int cmp_mnth=rst0.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rst0.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
  absent=total-present;
  percent=present*(1/total)*100;
  //System.out.println(percent);
%>   

                                                
						<tr>
						<th><%=list[0]%></th>
						<th><%=total%></th>
						<th><%=present%></th>
						<th><%=absent%></th>
						<th><%=percent %></th>
							<%
							if(percent<60.00)
							{
								%>
								<th>IN DANGER </th>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
								<th>POOR</th>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
					<th>GOOD</th>
						<%	}
                                                       else
							{	%>
								
								<th>No attendance found</th>
								<% }	%>
						</tr>
                                                 
  <% 
present=0;absent=0;percent=0;                                               
    ResultSet rst1=s.executeQuery("select DISTINCT * from attendance where stud_id='"+list[1]+"' and course='"+c+"'");

   while(rst1.next())
        {
         int cmp_mnth=rst1.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rst1.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
  absent=total-present;
  percent=present*(1/total)*100;
  //System.out.println(percent);
%>   

                                                
						<tr>
						<th><%=list[1]%></th>
						<th><%=total%></th>
						<th><%=present%></th>
						<th><%=absent%></th>
						<th><%=percent %></th>
							<%
							if(percent<60.00)
							{
								%>
								<th>IN DANGER </th>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
								<th>POOR</th>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
					<th>GOOD</th>
						<%	}
                                                       else
							{	%>
								
								<th>No attendance found</th>
								<% }	%>
						</tr>
                                                 
      <% 
present=0;absent=0;percent=0;                                               
    ResultSet rst2=s.executeQuery("select DISTINCT * from attendance where stud_id='"+list[2]+"' and course='"+c+"'");

   while(rst2.next())
        {
         int cmp_mnth=rst2.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rst2.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
  absent=total-present;
  percent=present*(1/total)*100;
  //System.out.println(percent);
%>   

                                                
						<tr>
						<th><%=list[2]%></th>
						<th><%=total%></th>
						<th><%=present%></th>
						<th><%=absent%></th>
						<th><%=percent %></th>
							<%
							if(percent<60.00)
							{
								%>
								<th>IN DANGER </th>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
								<th>POOR</th>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
					<th>GOOD</th>
						<%	}
                                                       else
							{	%>
								
								<th>No attendance found</th>
								<% }	%>
						</tr>                                           
                                               
                                               <% 
present=0;absent=0;percent=0;                                               
    ResultSet rst3=s.executeQuery("select DISTINCT * from attendance where stud_id='"+list[3]+"' and course='"+c+"'");

   while(rst3.next())
        {
         int cmp_mnth=rst3.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rst3.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
  absent=total-present;
  percent=present*(1/total)*100;
  //System.out.println(percent);
%>   

                                                
						<tr>
						<th><%=list[3]%></th>
						<th><%=total%></th>
						<th><%=present%></th>
						<th><%=absent%></th>
						<th><%=percent %></th>
							<%
							if(percent<60.00)
							{
								%>
								<th>IN DANGER </th>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
								<th>POOR</th>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
					<th>GOOD</th>
						<%	}
                                                       else
							{	%>
								
								<th>No attendance found</th>
								<% }	%>
						</tr>
                                               
                                               <% 
present=0;absent=0;percent=0;                                               
    ResultSet rst4=s.executeQuery("select DISTINCT * from attendance where stud_id='"+list[4]+"' and course='"+c+"'");

   while(rst4.next())
        {
         int cmp_mnth=rst4.getInt(4);
       //System.out.println(cmp_mnth);
        
        if(mnth > cmp_mnth)
            {
            present=present+rst4.getInt(6);
             //absent=absent+rs1.getInt(7);
            //System.out.println(absent);
        }
         
         
    }
 absent=total-present;
  percent=present*(1/total)*100;
  //System.out.println(percent);
%>   

                                                
						<tr>
						<th><%=list[4]%></th>
						<th><%=total%></th>
						<th><%=present%></th>
						<th><%=absent%></th>
						<th><%=percent %></th>
							<%
							if(percent<60.00)
							{
								%>
								<th>IN DANGER </th>
								<%
							}
							else if(percent>60.00 && percent<75.00)
							{
								%>
								<th>POOR</th>
								<%	
							}
							else if (percent > 75.00)
							{
								%>
					<th>GOOD</th>
						<%	}
                                                       else
							{	%>
								
								<th>No attendance found</th>
								<% }	%>
						</tr>
                                               
                                               
					</table><br>	
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

               <li> <a href="workingdays.jsp" ><b>Insert no. of working days</b> </a></li>
                        <br><br>
                        <li><a href = "atten.jsp"><b>Mark attendance for the students </b></a></li><br><br>  
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