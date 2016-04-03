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

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        String email = TextBoxEmail.Text;
        String password = TextBoxPassword.Text;

        User user = new User(email, password);

        if (user.Login())
        {
            //redirect
            Response.Redirect("login_success.aspx");
        }
        else {
            LabelFailed.Text = "Wrong email or password !";
        }
    }
}