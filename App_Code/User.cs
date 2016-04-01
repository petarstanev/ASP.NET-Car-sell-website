using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    private string email { get; set; }
    private string password { get; set; }
    private string address { get; set; }
    private string mobile { get; set; }
    private List<Car> wishList { get; set; }
    private List<Car> offersMade { get; set; }
    private List<Car> offersReceived { get; set; }


    public User(String email, String password, String address, String mobile)
    {
        this.email = email;
        this.password = password;
        this.address = address;
        this.mobile = mobile;

        wishList = new List<Car>();
        offersMade = new List<Car>();
        offersReceived = new List<Car>();
    }

    public void Register()
    {
        string passwordHash = CalculateMD5Hash(password);

        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cnnString))
        {
            using (SqlCommand cmd = new SqlCommand("AddUser"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", passwordHash);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@mobile", mobile);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteScalar();
                }
            }
        }
    }

    private static string CalculateMD5Hash(string input)
    {
        // Use input string to calculate MD5 hash
        using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
        {
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            // Convert the byte array to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }
    }
}