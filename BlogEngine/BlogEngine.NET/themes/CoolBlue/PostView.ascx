<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="post">
    <div class="right" id="post<%=Index %>">
        <h2><a href="<%=Post.RelativeLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h2>
        <p class="post-info">Filed under <%=CategoryLinks(" , ") %></p>
        <asp:PlaceHolder ID="BodyContent" runat="server" />
        <%=Rating %>
        <p class="post-info"><%=AdminLinks %></p>
    </div>
    <div class="left">
        <p class="dateinfo">
            <%=Post.DateCreated.ToString("MMM") %><span><%=Post.DateCreated.ToString("dd") %></span></p>
        <div class="post-meta">
            <h4>Post Info</h4>
            <ul>
                <li class="user"><a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + BlogEngine.Core.Utils.RemoveIllegalCharacters(Post.Author) %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a></li>
                <li class="time"><a href="#"><%=Post.DateCreated.ToString("d. MMM yyyy HH:mm") %></a></li>
                <% if (BlogEngine.Core.BlogSettings.Instance.ModerationType == BlogEngine.Core.BlogSettings.Moderation.Disqus)
                { %>
                <li class="disqus"><a rel="nofollow" href="<%=Post.PermaLink %>#disqus_thread"><%=Resources.labels.comments %></a></li>
                <%}
                else
                { %>
                    <li class="comment"><a href="<%=Post.RelativeLink %>#comment"><%=Post.ApprovedComments.Count %> <%=Resources.labels.comments %></a></li>
                    <li class="permalink"><a href="<%=Post.PermaLink %>" title="<%=Server.HtmlEncode(Post.Title) %>">Permalink</a></li>  
                <%} %>
            </ul>
        </div>
        <div class="post-meta">
            <h4>Tags</h4>
            <ul class="tags">
                <li><%=TagLinks(", ") %>&nbsp;</li>
            </ul>
        </div>
    </div>
</div>