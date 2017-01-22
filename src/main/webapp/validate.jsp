<%-- 
    Document   : validate
    Created on : 28 Feb, 2015, 8:50:26 AM
    Author     : Lahaul Seth
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
		/*String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
        
		out.println(host);		

        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
		//mysql://adminRDWfgs9:1Y7a316urqLq@127.6.91.2:3306/
		String url="jdbc:mysql://127.6.91.2:3306/test1";
        Connection conn = DriverManager.getConnection(url, " admin" , "Password");   
		
*/

 String username = request.getParameter("username");   
        String password = request.getParameter("password");

String USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
String PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
String DB_NAME = System.getenv("OPENSHIFT_APP_NAME");
String FORNAME_URL = "com.mysql.jdbc.Driver";
String URL = "jdbc:"+System.getenv("OPENSHIFT_MYSQL_DB_URL")+ DB_NAME;
Connection conn = DriverManager.getConnection(URL , USERNAME , PASSWORD);


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