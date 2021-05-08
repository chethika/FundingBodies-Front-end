package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class fundingbodies {

	//A common method to connect to the DB 
			private Connection connect() {
				Connection con = null;
				
				try {
					 Class.forName("com.mysql.jdbc.Driver");
					 //Provide the correct details: DBServer/DBName, username, password 
					 con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/fundigbodies?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

					//For testing          
					 System.out.print("Successfully connected");
					 
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return con; 
			}
			
			public String readPayment() {  
				String output = "";  
				
				try {  
					Connection con = connect();  
					if (con == null)  {   
						return "Error while connecting to the database for reading.";  
					} 

					// Prepare the html table to be displayed   
					output = "<table border='1'><tr><th>Description</th>"
							+ "<th>Amount</th><th>email</th>"
							+ "<th>Date</th></tr>";


					  String query = "select * from fundingbodies";   
					  Statement stmt = con.createStatement();   
					  ResultSet rs = stmt.executeQuery(query); 

					  // iterate through the rows in the result set   
					  while (rs.next())   {  

						  	String fid = Integer.toString(rs.getInt("fid"));
							String des = rs.getString("des");
							String amount = Integer.toString(rs.getInt("amount"));
							String date = rs.getString("date");
							
						  // Add into the html table    

						  output += "<tr><td><input id='hidfidUpdate' name='hidfidUpdate' type='hidden' value='" + fid + "'>" + des + "</td>"; 

						  output += "<td>" + amount + "</td>";
							output += "<td>" + date + "</td>";
							
						  
						// buttons     
						  output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						  		+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-fid='"+ fid +"'>"+"</td></tr>";

						} 
					  
					  con.close(); 

					  // Complete the html table   
					  output += "</table>"; 
					}
					catch (Exception e) {  
						output = "Error while reading the Appointment.";  
						System.err.println(e.getMessage()); 
					}

					return output;
				}
			
			//Insert appointment
			public String insertPayment(String des, String amount, String date) {
				String output = "";

				try {
					Connection con = connect();  

					if (con == null) {
						return "Error while connecting to the database";
					}

					// create a prepared statement   
					String query = " insert into fundingbodies (`fid`,`des`,`amount`,`date`)"+" values (?, ?, ?, ?)";

					PreparedStatement preparedStmt = con.prepareStatement(query);

					// binding values 
					preparedStmt.setInt(1, 0);
					preparedStmt.setString(2, des);
					preparedStmt.setString(3, amount);
					preparedStmt.setString(4, date);
					
					
					//execute the statement   
					preparedStmt.execute();   
					con.close(); 

					//Create JSON Object to show successful msg.
					String newPayment = readPayment();
					output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
				}
				catch (Exception e) {  
					//Create JSON Object to show Error msg.
					output = "{\"status\":\"error\", \"data\": \"Error while Inserting Appointment.\"}";   
					System.err.println(e.getMessage());  
				} 

				 return output; 
			}
			
			//Update appointment
			public String updatePayment(String fid, String des, String amount, String date )  {   
				String output = ""; 
			 
			  try   {   
				  Connection con = connect();
			 
				  if (con == null)    {
					  return "Error while connecting to the database for updating."; 
				  } 
			 
			   // create a prepared statement    
				   String query = "UPDATE fundingbodies SET fid=?,des=?,amount=?,date=?";
					 
			   PreparedStatement preparedStmt = con.prepareStatement(query); 
			 
			   // binding values    
			   preparedStmt.setString(1, fid);
				preparedStmt.setInt(2,Integer.parseInt (des));
				preparedStmt.setString(3, amount);
				preparedStmt.setString(4,date);
				
			   
			 
			   // execute the statement    
			   preparedStmt.execute();    
			   con.close(); 
			 
			   //create JSON object to show successful msg
			   String newPayment = readPayment();
			   output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
			   }   catch (Exception e)   {    
				   output = "{\"status\":\"error\", \"data\": \"Error while Updating Appointment Details.\"}";      
				   System.err.println(e.getMessage());   
			   } 
			 
			  return output;  
			  }
			
			public String deletePayment(String fid) {  
				String output = ""; 
			 
			 try  {   
				 Connection con = connect();
			 
			  if (con == null)   {    
				  return "Error while connecting to the database for deleting.";   
			  } 
			 
			  // create a prepared statement   
			  String query = "DELETE FROM appointment WHERE fid=?"; 
			 
			  PreparedStatement preparedStmt = con.prepareStatement(query); 
			 
			  // binding values   
			  preparedStmt.setInt(1, Integer.parseInt(fid));       
			  // execute the statement   
			  preparedStmt.execute();   
			  con.close(); 
			 
			  //create JSON Object
			  String newPayment = readPayment();
			  output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
			  }  catch (Exception e)  {  
				  //Create JSON object 
				  output = "{\"status\":\"error\", \"data\": \"Error while Deleting Appointment.\"}";
				  System.err.println(e.getMessage());  
				  
			 } 
			 
			 return output; 
			 }
	}

