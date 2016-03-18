
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.getAttribute("userid");
    %>
    <% // JSP code that generates chart of database(Time-Speed  which was my application requirement) and //returns chart image whenever called  %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.Calendar,java.text.*"%>
<%// required packages  %>
<%@ page import="java.awt.Image" %>
<%@ page import="java.awt.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.awt.BasicStroke"%>
<%@ page import ="org.jfree.ui.ApplicationFrame"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.File"%>
<%@ page import="org.jfree.chart.*" %>
<%@ page import="org.jfree.chart.axis.*" %>
<%@ page import="org.jfree.chart.entity.*" %>
<%@ page import="org.jfree.chart.labels.*" %>
<%@ page import="org.jfree.chart.plot.*" %>
<%@ page import="org.jfree.chart.renderer.category.*" %>
<%@ page import="org.jfree.chart.urls.*" %>
<%@ page import="org.jfree.data.category.*" %>
<%@ page import="org.jfree.data.general.*" %>
<%@ page import="org.jfree.data.time.Minute"%>
<%@ page import="org.jfree.data.time.Hour"%>
<%@ page import="org.jfree.data.time.TimeSeries"%>
<%@ page import="org.jfree.data.time.TimeSeriesCollection"%>
<%@ page import="org.jfree.data.xy.XYDataset"%>
<%@ page import="org.jfree.chart.plot.XYPlot"%>
<%@ page import="org.jfree.chart.renderer.xy.StandardXYItemRenderer"%>
<%@ page import="org.jfree.chart.renderer.xy.XYItemRenderer"%>
 <%@ page import=  "java.sql.Connection" %>
<%@ page import  ="java.sql.DriverManager" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>
 <%@ page import=  "javax.servlet.*" %>
<%@ page import  ="javax.servlet.http.*" %>

<%@ page import="java.awt.image.BufferedImage"%>
<%
String inst_id= (String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quassi_classe","root","durga");
    Statement s=con.createStatement();
    ResultSet rs=s.executeQuery("select * from instructor_poll where inst_id='"+inst_id+"'");
     
    while(rs.next())
        {
       
    java.util.Date cur_tym=new java.util.Date();
        java.util.Date db_expire_tym= rs.getTimestamp(7);
        java.util.Date tym =rs.getTimestamp(8);
      //  java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar c = Calendar.getInstance(); 
    c.setTime(cur_tym); 
   
    int comparison = cur_tym.compareTo(db_expire_tym);
   
    System.out.println(comparison);
    System.out.println(db_expire_tym);
    boolean tym_cmp = cur_tym.after(tym);
    System.out.println(tym);
    System.out.println(tym_cmp);
   if(comparison > 0 && tym_cmp == false)
           {
        int ques_id=rs.getInt(2);
        String ques=rs.getString(3);
        int yes_num=rs.getInt(4);
        int no_num=rs.getInt(5);
        int total=yes_num+no_num;
final double[][] data = new double[][]{{yes_num},{no_num}};
//System.out.println("hi");
DefaultCategoryDataset dataset = new DefaultCategoryDataset();
dataset.setValue(yes_num,"Yes","Yes");
dataset.setValue(no_num,"No","No");
JFreeChart chart = null;
  BarRenderer renderer = null;
  CategoryPlot plot = null;
final CategoryAxis categoryAxis = new CategoryAxis("X-axis");
  final ValueAxis valueAxis = new NumberAxis("Y-axis");
  renderer = new BarRenderer();

  plot = new CategoryPlot(dataset, categoryAxis, valueAxis,renderer);
  plot.setOrientation(PlotOrientation.VERTICAL);
  chart = new JFreeChart(ques, JFreeChart.DEFAULT_TITLE_FONT,plot, true);
  chart.setBackgroundPaint(new Color(249, 231, 236));

  Paint p1 = new GradientPaint(0.0f, 0.0f, new Color(16, 89, 172), 0.0f, 0.0f, new Color(201, 201, 244));

  renderer.setSeriesPaint(1, p1);
  Paint p2 = new GradientPaint(0.0f, 0.0f, new Color(255, 35, 35), 0.0f, 0.0f, new Color(255, 180, 180));

  renderer.setSeriesPaint(2, p2);

  plot.setRenderer(renderer);
  
  try {
  final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
 final File file1 = new File("C:/Users/Durga/Documents/NetBeansProjects/click/web/poll_result/barchart_"+ques_id+".jpeg");
  ChartUtilities.saveChartAsJPEG(file1, chart, 600, 400, info);
  ChartFrame frame = new ChartFrame("Demo", chart);
frame.pack();
frame.setVisible(true);
  }
  catch (Exception e) {
 out.println(e);
  }
  }
    }
%>
<form action="notice_db.jsp" method="post" class="Form">
   
<h3>Notice based on Poll Result</h3>
 <span>
             <textarea id="input_6" class="form-textarea" name="news" style="border-style:solid; border-width:1px; border-color: black;" cols="40" rows="6"></textarea>
              <div class="form-textarea-limit-indicator">
                  <span type="Words" limit="400" id="input_6-limit">0/400</span>
              </div></span>
          
      
      <input id="input_2" type="submit" class="button" value ="Send Notice" onclick="notice_db.jsp">
              
            
          
     
      </form>
