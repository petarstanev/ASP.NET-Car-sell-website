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
    //ArrayList users;

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    users = new ArrayList();
    //    users.Add(new User("user", "password1"));
    //    users.Add(new User("petar", "password2"));

    //    LabelBotCheck.Text = GenerateCoupon(4);
    //}


    //private string GenerateCoupon(int length)
    //{
    //    Random random = new Random();
    //    string characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    //    StringBuilder result = new StringBuilder(length);
    //    for (int i = 0; i < length; i++)
    //    {
    //        result.Append(characters[random.Next(characters.Length)]);
    //    }
    //    return result.ToString();
    //}

    //protected void ButtonLogin_Click(object sender, EventArgs e)
    //{
    //    String username = TextBoxUsername.Text;
    //    String password = TextBoxPassword.Text;

    //    if (containUser(new User(username, password)))
    //    {
    //        Session["username"] = username;
    //        Session["loggedIn"] = true;
    //        Response.Redirect("login_success.aspx");
    //    }
    //    else
    //    {
    //        LabelFailed.Text = "Wrong username and password";
    //        LabelBotCheck.Text = GenerateCoupon(4);
    //    }
    //}

    //private Boolean containUser(User user)
    //{
    //    foreach (User testuser in users)
    //    {
    //        if (testuser.username.Equals(user.username) && testuser.password.Equals(user.password))
    //            return true;
    //    }
    //    return false;
    //}
}