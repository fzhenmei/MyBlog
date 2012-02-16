using System;
using System.Web;
using BlogEngine.Core;
using BlogEngine.Core.Web.Controls;

public partial class error_occurred : BlogBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Error";
        OutputErrorDetails();
    }

    private void OutputErrorDetails()
    {
        string contextItemKey = "LastErrorDetails";

        if (Security.IsAuthorizedTo(Rights.ViewDetailedErrorMessages) &&
            HttpContext.Current.Items.Contains(contextItemKey))
        {
            var errorDetails = (string) HttpContext.Current.Items[contextItemKey];

            if (!string.IsNullOrEmpty(errorDetails))
            {
                divErrorDetails.Visible = true;
                pDetails.InnerHtml = Server.HtmlEncode(errorDetails);
                pDetails.InnerHtml = errorDetails.Replace(Environment.NewLine, "<br /><br />");
            }
        }
    }
}