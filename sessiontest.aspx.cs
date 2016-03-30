using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sessiontest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            String sessionName = Session["name"].ToString();
            String cookieName = Request.Cookies["UserInformation"]["Name"];
            String cookieDate = Request.Cookies["UserInformation"]["Date"];

            LabelName.Text = "Hello " + sessionName + ", you passed this information in a session variable.";
            LabelDate.Text = "Hello " + cookieName + ", you passed this information in a cookie at " + cookieDate + ".";
        }
        else {
            Response.Redirect("exercise5.aspx");
        }
    }
}