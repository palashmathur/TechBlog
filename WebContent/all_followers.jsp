<!-- current user details through session -->
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.database.FollowDatabase"%>
<%@page import="com.techblog.helper.DBConnectionProvider"%>
<%@page import="com.techblog.database.UsersDatabase"%>
<%@page import="com.techblog.entities.Users"%>
<%
Users current_user = (Users) session.getAttribute("current_user");
if (current_user == null) {
	response.sendRedirect("user_login.jsp");
}
int current_user_id = current_user.getId();
%>

<!-- jiske followers lana h -->

<%
String operation = request.getParameter("operation");
int user_id = Integer.parseInt(request.getParameter("user_id"));
%>

<!-- jiske niklana h uska sara info -->
<%
UsersDatabase userDao = new UsersDatabase(DBConnectionProvider.getConnection());
%>

<%-- objects --%>
<%
ArrayList<Users> list = null;
FollowDatabase followDao = new FollowDatabase(DBConnectionProvider.getConnection());
%>

<!-- to fetch followers -->
<%
if (operation.equals("followers")) {

	list = followDao.getFollowers(user_id);
%>
<%-- <p><%=list%></p>
<p><%=user_id%></p>
<p><%=list%></p>
<p><%=list.size()%></p> --%>

<div class="col-md-6 offset-1">
	<table class="table table-borderless bg-light border">

		<tbody>
			<%
			int x = 1;
			for (Users user : list) {
			%>
			<tr>
				<td><img src="profile-pics/<%=user.getProfile()%>"
					style="width: 50px; height: 50px; border-radius: 25px;">&nbsp;&nbsp;&nbsp;
					<a href="profiles.jsp?user_id=<%=user.getId()%>" ><%=user.getUsername()%></a></td>

				<%
				if (current_user_id == user.getId()) {

				} else {
				%>

				<%
				String fol_btn_clr = "outline-primary";
				String follow_button_html = "follow";
				if (followDao.alredyFollowing(current_user_id, user.getId())) {
					follow_button_html = "unfollow";
				}
				if (follow_button_html.equals("follow")) {
					fol_btn_clr = "primary";
				}
				%>
				<td><a href="#"
					onclick="follow(<%=current_user_id%>,<%=user.getId()%>)"
					type="button" class="btn btn-<%=fol_btn_clr%>"><%=follow_button_html%></a></td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</div>

<%
}
%>

<!-- to fetch following -->
<%
if (operation.equals("following")) {

	list = followDao.getFollowing(user_id);
%>

<div class="col-md-6 offset-1">
	<table class="table table-borderless bg-light border">

		<tbody>
			<%
			
			for (Users user : list) {
			%>
			<tr>
				<td><img src="profile-pics/<%=user.getProfile()%>"
					style="width: 50px; height: 50px; border-radius: 25px;">&nbsp;&nbsp;&nbsp;
					<a href="profiles.jsp?user_id=<%=user.getId()%>"><%=user.getUsername()%></a></td>

				<%
				if (current_user_id == user.getId()) {

				} else {
				%>

				<%
				String fol_btn_clr = "primary";
				String follow_button_html = "follow";
				if (followDao.alredyFollowing(current_user_id, user.getId())) {
					follow_button_html = "unfollow";
					fol_btn_clr = "outline-primary";
				}
				/* if (follow_button_html.equals("follow")) {
					fol_btn_clr = "primary";
				} */
				%>
				<td><a href="#"
					onclick="follow(<%=current_user_id%>,<%=user.getId()%>)"
					type="button" class="btn btn-<%=fol_btn_clr%>"><%=follow_button_html%></a></td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</div>
<%
}
%>