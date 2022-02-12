<%-- 
    Document   : about
    Created on : Dec 12, 2019, 7:43:55 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .caret{
                display: none !important;
            }
        </style>
    </head>
    <body>
         <%
                if (session.getAttribute("username") == null || session.getAttribute("name")==null) {%>
                    <%@include  file="publicheader.jsp"%>
                            
            <%}

     else {%>
    <%@include  file="UserHeader.jsp"%>
    <%}
    %>
        <div class="privacy about">
			<h3>About Us</h3>
			<p class="animi">VMM Education’s journey started in January 2005 with a vision of bringing computer education of global standard in the holy city of Amritsar. To turn this dream into reality we needed to create a talent pool of bright young minds who would power the engines of growth of the global economy, Today seven years later VMM Education or VMM, as it is popularly known as, is the largest and the most trusted computer center of the region, with annual turn out of more than 1000 students each year. The reason for the success of VMM is simply the “Hard work” that our team has put in these seven years.</p>
			<div class="agile_about_grids">
				<div class="col-md-6 agile_about_grid_right">
					<img src="images/31.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="col-md-6 agile_about_grid_left">
					<ol>
						<li>In this past 7 years, VMM Education has provided world class training in global technologies such as Java , .Net , Oracle and Linux , while keeping our syllabus up to date with the current industry standard. </li>
						<li>We have managed to successfully train more than 7000 engineers who are currently working in Global Multinationals like TCS, Tech Mahindra, Infosys, and CSC etc.</li>
						<li>VMM is today the favorite choice of students of various engineering college for pursuing their six months or six weeks industrial training .</li>
						<li>A unique “industry-endorsed curriculum,” crafted by professionals of VMM enhances the job-readiness and employability of learners and equips them for the IT Industry.</li>
						<li>To provide IT education which can match with the global IT standards, VMM also undertake industrial projects under the banner of Veenus Software Solutions this also allows our students to work on the live projects and make projects for the various industries.</li>
						<li>Some of the our products include Point of sale software for Super Markets with barcode reader support, Finger print attendance Management System that can work for schools colleges and other institutes, Remote Lan Controller which can be used to  view  remote desktops on LAN or WAN.</li>
					</ol>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
    </body>
</html>
