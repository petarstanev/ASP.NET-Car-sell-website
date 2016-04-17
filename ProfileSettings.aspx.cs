using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile : System.Web.UI.Page
{
    User user;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            user = (User)Session["user"];
            if (!IsPostBack)
            {
                TextBoxAddress.Text = user.address;
                TextBoxMobile.Text = user.mobile;
            }
        }
        else
        {
            //redirect to login.aspx if user is not login.
            Response.Redirect("login.aspx");
        }
    }
    protected void ButtonUpdate_Click(object sender, EventArgs e)
    {
        if (TextBoxPassword.Text != String.Empty)
        {
            user.CalculateMD5Hash(TextBoxPassword.Text);
        }
        user.address = TextBoxAddress.Text;
        user.mobile = TextBoxMobile.Text;
        user.Update();
    }
}