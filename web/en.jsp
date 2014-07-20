<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.*" %>
 <html>
 <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>My First JSP with JAVA</title>
 </head>
 <body>
 <jsp:useBean id="link" class = "com.NewClass" />   
 <% 
 System.out.println(" nm1");
 String key=(String)session.getAttribute("captcha");
  System.out.println(" nm"+key);
  String name=(String)session.getAttribute("un");
  System.out.println(name+" nm");
  try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captch","root","root");
    System.out.println("Driver Loaded Successfully");
	//File imgfile = new File(u_file);
	//FileInputStream fin = new FileInputStream(imgfile);
//connectionFactory.executeUpdate(sql);
	PreparedStatement pstmt=con.prepareStatement("update register set ke=? where userid=?");
  pstmt.setString(1, key);
  pstmt.setString(2, name);
  int i=pstmt.executeUpdate();
  }catch(Exception e){}
  String path=application.getRealPath("images")+"/input.png";
  System.out.println(path+" nm");
  link.key(name,path);
  response.sendRedirect("down.jsp");
 %>
 </body>
 </html>