using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["WishList"] = null;
        Response.Redirect("Default.aspx");
    }
}