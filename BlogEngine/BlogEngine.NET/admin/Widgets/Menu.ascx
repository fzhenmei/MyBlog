<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="admin.Settings.Menu" %>
<ul>
    <li <%=Current("Blogroll.aspx")%>><a href="Blogroll.aspx"><%=Resources.labels.blogroll %></a></li>
    <li <%=Current("Controls.aspx")%>><a href="Controls.aspx"><%=Resources.labels.commonControls %></a></li>
</ul>