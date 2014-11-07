<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.ConnectionClass"%>
<%@page import="java.sql.Connection"%>
<%


 Connection  con=ConnectionClass.getConnection();
 try
 {
 int count_success=0;
 int count_error=0;
 int total_count=0;
 
  int in_bar_code_index=0;
 int out_bar_code_index=0;
  int bar_code_other_index=0;
 int br_code_other_issue_index=0;
 
   String hub_id=null;
     String query23="select hub_id from debit_note_header where debit_no='"+request.getParameter("doc_no")+"'";
     PreparedStatement pst23=con.prepareStatement(query23);
     ResultSet rst23=pst23.executeQuery();
     if(rst23.next())
     {
     hub_id=rst23.getString("hub_id");
     
     }
 
 String query1="select max(serial) from bar_code_history where issue_bar_code='"+request.getParameter("bar_code").trim().toUpperCase()+"' and item_code='"+request.getParameter("item_code_x")+"'";
 PreparedStatement pst1=con.prepareStatement(query1);
 ResultSet rst1=pst1.executeQuery();
 if(rst1.next())
 {
 out_bar_code_index=rst1.getInt(1);
 }
   query1="select max(serial) from bar_code_history where received_bar_code='"+request.getParameter("bar_code").trim().toUpperCase()+"' and item_code='"+request.getParameter("item_code_x")+"'";
  pst1=con.prepareStatement(query1);
  rst1=pst1.executeQuery();
 if(rst1.next())
 {
 in_bar_code_index=rst1.getInt(1);
 }
  query1="select max(serial) from bar_code_history where other_bar_code='"+request.getParameter("bar_code").trim().toUpperCase()+"' and item_code='"+request.getParameter("item_code_x").trim()+"'";
  pst1=con.prepareStatement(query1);
  rst1=pst1.executeQuery();
 if(rst1.next())
 {
 bar_code_other_index=rst1.getInt(1);
 }
   query1="select max(serial) from bar_code_history where other_bar_code_issue='"+request.getParameter("bar_code").trim().toUpperCase()+"' and item_code='"+request.getParameter("item_code_x").trim()+"'";
  pst1=con.prepareStatement(query1);
  rst1=pst1.executeQuery();
 if(rst1.next())
 {
 br_code_other_issue_index=rst1.getInt(1);
 } 
 
 if(in_bar_code_index>out_bar_code_index&&in_bar_code_index>bar_code_other_index&&in_bar_code_index>br_code_other_issue_index)
 {
     
      query1="select serial from bar_code_history where issue_bar_code='"+request.getParameter("bar_code").trim().toUpperCase()+"' and item_code='"+request.getParameter("item_code_x").trim()+"' and doc_no='"+request.getParameter("doc_no").trim()+"' and doc_type='Debit'";
     pst1=con.prepareStatement(query1);
     rst1=pst1.executeQuery();
     if(!rst1.next())
     {
  query1="insert into bar_code_history(created_date, created_by, doc_no, doc_type, issue_bar_code,bar_code_type,item_code,hub_id) values(now(),'"+session.getAttribute("user_id")+"','"+request.getParameter("doc_no")+"','Debit','"+request.getParameter("bar_code").toString().toUpperCase()+"','Rejected','"+request.getParameter("item_code_x")+"','"+hub_id+"')";
  pst1=con.prepareStatement(query1);
 pst1.executeUpdate();
 count_success++;
     }
     else
     {
     count_error++;
     }
 }
 else
 {
 count_error++;
 }
  query1="select serial from bar_code_history where item_code='"+request.getParameter("item_code_x")+"' and doc_no='"+request.getParameter("doc_no")+"' and doc_type='Debit'";
  pst1=con.prepareStatement(query1);
  rst1=pst1.executeQuery();
 while(rst1.next())
 {
 total_count++;
 }
 pst1.close();
 rst1.close();
 out.println(count_success +":"+count_error+":"+total_count+":"+request.getParameter("bar_code").trim().toUpperCase());
 }
 catch(Exception ex)
 {
 
 System.out.println(ex);
 }
 finally
 {
 con.close();
 }

%>
