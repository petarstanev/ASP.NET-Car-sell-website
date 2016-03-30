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
        ExecuteInsert(TextBoxEmail.Text, TextBoxPassword.Text, TextBoxAddress.Text, TextBoxMobile.Text);
    }

    private void ExecuteInsert(string email, string password, string address, string mobile)
    {


        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        var query = "INSERT INTO users (email, password, address, mobile) VALUES "
                    + " (@email,@password,@address,@mobile)";
        using (SqlConnection cnn = new SqlConnection(cnnString))
        {
            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@mobile", mobile);
                cnn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
    }
}