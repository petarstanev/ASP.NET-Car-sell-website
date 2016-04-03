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
    public string email { get; set; }

    private string passwordHash { get; set; }
    private string address { get; set; }
    private string mobile { get; set; }
    private List<Car> wishList { get; set; }
    private List<Car> offersMade { get; set; }
    private List<Car> offersReceived { get; set; }


    public User(String email, String password, String address, String mobile)
    {
        this.email = email;

        this.passwordHash = CalculateMD5Hash(password);
        this.address = address;
        this.mobile = mobile;

        wishList = new List<Car>();
        offersMade = new List<Car>();
        offersReceived = new List<Car>();
    }

    public User(string email, string password)
    {
        this.email = email;
        this.passwordHash = CalculateMD5Hash(password);
    }

    public void Register()
    {
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

    public Boolean Login()
    {
        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(cnnString);

        SqlCommand command = new SqlCommand("GetUser", connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        connection.Open();
        command.Parameters.AddWithValue("@email", email);
        command.Parameters.AddWithValue("@password", passwordHash);
        //TODO: ADD HASH
        SqlDataReader reader = command.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            email = reader.GetString(0);
            passwordHash = reader.GetString(1);
            address = reader.GetString(2);
            mobile = reader.GetString(3);
            return true;
        }
        return false;
    }

   
}