
      <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
String name=request.getParameter("uname");
String userid=request.getParameter("usernamesignup");
session.setAttribute("un",userid);
String pass=request.getParameter("passwordsignup");
String mo=request.getParameter("contact");
System.out.println(mo);
int mo_no=Integer.parseInt(mo.substring(1));
String email=request.getParameter("email");
//String party_logo=request.getParameter("party_logo");
String key=request.getParameter("key");
//String u_file=request.getParameter("user_file");
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/captch","root","root");
    System.out.println("Driver Loaded Successfully");
	//File imgfile = new File(u_file);
	//FileInputStream fin = new FileInputStream(imgfile);
//connectionFactory.executeUpdate(sql);
	PreparedStatement pstmt=con.prepareStatement("insert into register values(?,?,?,?,?,?)");
	pstmt.setString(1,name);
	pstmt.setString(2,userid);
	pstmt.setString(3,pass);
	pstmt.setInt(4,mo_no);
	pstmt.setString(5,email);
	pstmt.setString(6,key);
	//pstmt.setString(7,party_logo);
	//pstmt.setBinaryStream(9,fin,(int)imgfile.length());
	int i=pstmt.executeUpdate();
	System.out.println("Record inserted succesfully");
	int i1=1;
        if(i1>0)
	{
      response.sendRedirect("img.jsp?key="+key);
      %>
		 
        
	<% }else
	{
		
	}
}catch(Exception e)
{
	
	System.out.println(e);
	e.printStackTrace();
}
%>
      
      
      </table>
      
      
      
      </div>
      <!-- ####################################################################################################### -->
      
      <!-- ####################################################################################################### -->
      
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row4">
  <div class="rnd">
    <div id="footer" class="clear">
      <!-- ####################################################################################################### -->
      <div class="fl_left clear">
        <div class="fl_left center"><img src="images/demo/worldmap.gif" alt="" /><br />
          </div>
        <address>
        Address Line 1<br />
        Address Line 2<br />
        Town/City<br />
        Postcode/Zip<br />
        <br />
        Tel: 9604009362<br />
        Email: <a href="#">sai.info2009@gmail.com</a>
        </address>
      </div>
      
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - Sai Infocorp Solutions Pvt Ltd</p>
			<p class="fl_right">Developed by- Sainfocorp Solution Pvt Ltd</p>
		</div>
</div>
</div>
</body>
</html>