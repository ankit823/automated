<%@ page import="java.sql.*"%>
<%
 
try
 {
        
          Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost/captch","root","root");
              Statement stmt=con.createStatement();
              ResultSet rs;
              String sql;
              int flag=0;
              String u=request.getParameter("username");
              String p=request.getParameter("password");
              //String key=request.getParameter("key");
              session.setAttribute("username", u);
              session.setAttribute("pass", p);
              sql="select * from register";
              rs=stmt.executeQuery(sql);
              out.println(sql);
              int flag1=0;
              while(rs.next())
              {
                          String u1=rs.getString(2);
                        String p1=rs.getString(3);
                          //  String ke=rs.getString(6);
                            if(u.equals(rs.getString(2))&& p.equals(rs.getString(3)))
                            response.sendRedirect("Upload.jsp");
                            else
                            {
                                 flag1=1;
                            }
                      }
                     if(flag1==1)
                                    {%>
                                    <script language="javascript">
                                        alert("Invalid Information");
                                    back();
                                    </script>
                      <%
                      session.setAttribute("id", 2);
                       response.sendRedirect("index.jsp");
                        }
              
                    
   }  catch(Exception e)
                     {}%>
