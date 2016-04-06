using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void Page_PreRender(object sender, System.EventArgs e)
    {
        if (Session["user"] != null)
        {
            //user is login
            login.Visible = false;
            register.Visible = false;
        }
        else
        {
            //user is not login 
            logout.Visible = false;
            profile.Visible = false;
            addCar.Visible = false;
        }
    }
}
