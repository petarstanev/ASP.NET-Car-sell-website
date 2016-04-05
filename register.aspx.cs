using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login_form : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        LabelBotCheck.Text = GenerateCoupon(4);
    }


    private string GenerateCoupon(int length)
    {
        Random random = new Random();
        string characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder result = new StringBuilder(length);
        for (int i = 0; i < length; i++)
        {
            result.Append(characters[random.Next(characters.Length)]);
        }
        return result.ToString();
    }

    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        User user = new User(TextBoxEmail.Text, TextBoxPassword.Text, TextBoxAddress.Text, TextBoxMobile.Text);

        if (user.CheckUsernameUnique())
        {
            //exist
            LabelEmailExist.Text = "This email is already is registered !";
        }
        else
        {
            //do not exist           
            user.Register();
            Response.Redirect("register_success.aspx");
        }
    }
}