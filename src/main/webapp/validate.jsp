<%-- 
    Document   : validate
    Created on : 28 Feb, 2015, 8:50:26 AM
    Author     : Lahaul Seth
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
			

        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
		//mysql://adminRDWfgs9:1Y7a316urqLq@127.6.91.2:3306/
		String url="jdbc:mysql://192.185.2.235:3306/opsoclou_openshift_billing";
        Connection conn = DriverManager.getConnection(url, "opsoclou_os_user" , "Password@123");   
		



        PreparedStatement pst = conn.prepareStatement("Select user,pass from login where user=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){ 
	  
       out.println(e);       
   }      
%>