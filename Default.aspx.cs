﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private void Page_PreRender(object sender, System.EventArgs e)
    {
        if (Session["user"] != null)
        {
           notLogin.Visible =false;
            User user = (User)Session["user"];
            LabelLoginMail.Text = user.email;
        }
        else
        {
           login.Visible = false;

        }
    }

}