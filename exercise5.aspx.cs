using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exercise5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {

        String name = TextBoxName.Text;
        Session["name"] = name;
        
        Response.Cookies["UserInformation"]["Name"] = name;
        Response.Cookies["UserInformation"]["Date"] = DateTime.Now.ToString();

        Session.Timeout = 5;
        Response.Cookies["UserInformation"].Expires = DateTime.Now.AddDays(7);
   

        Response.Redirect("sessiontest.aspx");
    }
}