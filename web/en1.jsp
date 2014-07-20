<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
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
 <% 
 System.out.println(" nm1");
 String key=request.getParameter("key");//(String)session.getAttribute("captcha");
  System.out.println(" nm"+key);
  String name=(String)session.getAttribute("username");
  System.out.println(name+" nm");
  
  try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captch","root","root");
    System.out.println("Driver Loaded Successfully");
	//File imgfile = new File(u_file);
	//FileInputStream fin = new FileInputStream(imgfile);
//connectionFactory.executeUpdate(sql);
	PreparedStatement pstmt=con.prepareStatement("select ke from register where userid=?");
  pstmt.setString(1, name);
  
  ResultSet rs=pstmt.executeQuery();
   while(rs.next()){
  System.out.println(rs.getString(1)+"fg");     
       if(key.equalsIgnoreCase(rs.getString(1)))
       {  File f = new File(application.getRealPath("images")+"\\"+name);
           //File f=new File(application.getRealPath()+"/images/"+name);
          System.out.println(f.getAbsolutePath());
          f.delete();
         // f.deleteOnExit();
           response.sendRedirect("Home.html");
       }
             else{
           response.sendRedirect("error.jsp");
%>

<%            
           }
      
   }
  con.close();
  }catch(Exception e){}
 /* String path=application.getRealPath("images")+"/input.png";
  System.out.println(path+" nm");
  link.key(name,path);
  response.sendRedirect("down.jsp");*/
 %>
 </body>
 </html>