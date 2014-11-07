<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %> 
<%@taglib uri="/struts-jquery-tags" prefix="sj" %>  
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>  

<html>
<head>
<title>CRM</title>

	
	
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
        <link  href="<%=request.getContextPath()%>/css/bootstrap-cerulean.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/charisma-app.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
	<link href='<%=request.getContextPath()%>/css/fullcalendar.css' rel='stylesheet'>
	<link href='<%=request.getContextPath()%>/css/fullcalendar.print.css' rel='stylesheet'  media='print' />
	<link href='<%=request.getContextPath()%>/css/chosen.css' rel='stylesheet'>
	<link href='<%=request.getContextPath()%>/css/uniform.default.css' rel='stylesheet'/>
	<link href='<%=request.getContextPath()%>/css/colorbox.css' rel='stylesheet' />
	<link href='<%=request.getContextPath()%>/css/jquery.cleditor.css' rel='stylesheet' />
	<link href='<%=request.getContextPath()%>/css/jquery.noty.css' rel='stylesheet' />
	<link href='<%=request.getContextPath()%>/css/noty_theme_default.css' rel='stylesheet' />
	<link href='<%=request.getContextPath()%>/css/elfinder.min.css' rel='stylesheet'/>
	<link href='<%=request.getContextPath()%>/css/elfinder.theme.css' rel='stylesheet'/>
	<link href='<%=request.getContextPath()%>/css/jquery.iphone.toggle.css' rel='stylesheet'/>
	<link href='<%=request.getContextPath()%>/css/opa-icons.css' rel='stylesheet'/>
	<link href='<%=request.getContextPath()%>/css/uploadify.css' rel='stylesheet'/>
        	<link href='<%=request.getContextPath()%>/css_class/down.css' rel='stylesheet'/>
        <sj:head />
        <style type="text/css">
<!--
.style4 {
	font: bold Geneva;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
}
.style15 {
	font-size: 12px;
	font-weight: bold;
	color: #000000;
}
.style21 {font: bold Verdana; font-size: 12px; font-weight: bold; color: #000000; }
.style23 {color: #000000; font-family: Geneva, Arial, Helvetica, sans-serif; font-size: 11px; }
.style25 {color: #000000; font-family: Geneva, Arial, Helvetica, sans-serif; font-size: 11px; font-weight: bold; }
-->
        </style>
</head>

<body>
    <%try
    {%>
	<div class="navbar">
		    <jsp:include page="../include/header_of_temp.jsp" flush="true"/>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">
					
		
			<noscript>
				<div class="alert alert-block span10">
					
					

				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
                            <jsp:include page="../include/navigation.jsp" flush="true" />
			</div>
	<div id="content" class="span10">
			<!-- content starts -->
                        
                       <%Connection con=DBConnect.getDB();%>
			<div class="row-fluid sortable">	
				<div class="box span12"> 
                                    <% if(session.getAttribute("success_message")!=null)
                                        {%>
                        
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>Dear</strong> <% 
                                                        out.println(session.getAttribute("success_message"));
                                                        session.removeAttribute("success_message");
                                                        %>
						</div>
                        <%}%>
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> User History Report </h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
				  <div class="box-content">
				    <table width="91%" border="1" align="center" cellpadding="2" cellspacing="4">
                      <tr>
                        <td width="6%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style21">S.No.</span></td>
                        <td width="10%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style4">User Id </span></td>
                        <td width="10%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style21">User Type  </span></td>
                                                <td width="20%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style15">IP Address </span></td>
                        <td width="17%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style21">Login Time </span></td>
                        <td width="37%" bordercolor="#E8E8E8" bgcolor="#B9B9B9"><span class="style21">Logout Time </span></td>
                      </tr>
                      <% try
                      {int i=1;
                                                              
                                                              String query1="select * from login_logout_history where user_id='"+request.getParameter("user_history_id")+"'";
                                                             
                                                             PreparedStatement pst1=con.prepareStatement(query1);
                                                              ResultSet rst1=pst1.executeQuery();
                                                              while(rst1.next())
                                                              {%>
                                                             
                      <tr>
                        <td bordercolor="#E8E8E8"><span class="style25"><%=i++%></span></td>
                        <td bordercolor="#E8E8E8"><span class="style23"><%=rst1.getString(2)%></span></td>
                        <td bordercolor="#E8E8E8"><span class="style23"><%=rst1.getString("user_type")%></span></td>
                                 <td bordercolor="#E8E8E8"><span class="style23"><%=rst1.getString("ipAddress")%></span></td>
                        <td bordercolor="#E8E8E8"><span class="style23"><%=rst1.getString("login_time_date")%></span></td>
                        <td bordercolor="#E8E8E8"><span class="style23">
                        <%
                        if(rst1.getString("logout_time_date")!=null){
                            out.println(rst1.getString("logout_time_date"));
                        }else{
                            %>
                          </span>
                          <p style="color:#800000"    class="style23"> <strong> User are Not Logout Properly or Login Now</strong> </p>
                            <span class="style23">
                            <%
                        }
                         %>                       
                            </span></td>
                      </tr>
                                <%
                                                              }
                                                              rst1.close();
                                                              pst1.close();
                                                              con.close();
                      }
                      catch(Exception ex)
                      {
                          
                       out.println(ex);   
                      }
                                                              %>
                    </table>
				  </div>
				</div><!--/span-->
			
			</div><!--/row-->
			<!--/row--><!--/row-->
            <!--/row-->
            <!-- content ends -->
</div>
            </div>
			<!--/#content.span10-->
		  </div><!--/fluid-row-->
				
		<hr>
		
		
	</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://shivit.in" target="_blank">Shivit in </a></p>
			<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">CRM</a></p>
		</footer>
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="<%=request.getContextPath()%>/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="<%=request.getContextPath()%>/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='<%=request.getContextPath()%>/js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='<%=request.getContextPath()%>/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="<%=request.getContextPath()%>/js/excanvas.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.pie.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.stack.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="<%=request.getContextPath()%>/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="<%=request.getContextPath()%>/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="<%=request.getContextPath()%>/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="<%=request.getContextPath()%>/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="<%=request.getContextPath()%>/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="<%=request.getContextPath()%>/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="<%=request.getContextPath()%>/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="<%=request.getContextPath()%>/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="<%=request.getContextPath()%>/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="<%=request.getContextPath()%>/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="<%=request.getContextPath()%>/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="<%=request.getContextPath()%>/js/charisma.js"></script>
	
		<%}catch(Exception ex){out.println(ex);}%>
</body>
</html>