using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// This class is used to represent user from Database.
/// </summary>
public class User : SQLItem
{
    public int id { get; set; }
    public string email { get; set; }
    public string passwordHash { get; set; }
    public string address { get; set; }
    public string mobile { get; set; }
    private List<Car> wishList { get; set; }
    private List<Car> offersMade { get; set; }
    private List<Car> offersReceived { get; set; }


    public User(String email, String password, String address, String mobile)
    {
        this.email = email;
        CalculateMD5Hash(password);
        this.address = address;
        this.mobile = mobile;

        wishList = new List<Car>();
        offersMade = new List<Car>();
        offersReceived = new List<Car>();
    }

    public User(int id, String email, String password, String address, String mobile)
    {
        this.id = id;
        this.email = email;
        CalculateMD5Hash(password);
        this.address = address;
        this.mobile = mobile;

        wishList = new List<Car>();
        offersMade = new List<Car>();
        offersReceived = new List<Car>();
    }

    public User(string email, string password)
    {
        this.email = email;
        CalculateMD5Hash(password);
    }

    public void Register()
    {

        SqlCommand command = new SqlCommand("AddUser", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;

        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@email", email);
        command.Parameters.AddWithValue("@password", passwordHash);
        command.Parameters.AddWithValue("@address", address);
        command.Parameters.AddWithValue("@mobile", mobile);
        command.Connection = Connection;
        Connection.Open();
        command.ExecuteScalar();
        Connection.Close();
    }

    public Boolean CheckUsernameUnique()
    {

        var constring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("CheckEmailExist", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.Add("@count", SqlDbType.Int).Direction = ParameterDirection.Output;

                con.Open();
                cmd.ExecuteNonQuery();
                int count = Convert.ToInt32(cmd.Parameters["@count"].Value);
                con.Close();
                if (count > 0)
                {
                    return true;
                }
            }
        }
        return false;
    }

    public void CalculateMD5Hash(string input)
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
            passwordHash = sb.ToString();
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
            id = reader.GetInt32(0);
            email = reader.GetString(1);
            passwordHash = reader.GetString(2);
            address = reader.GetString(3);
            mobile = reader.GetString(4);
            return true;
        }
        return false;
    }

    public void Update()
    {
        var cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cnnString))
        {
            using (SqlCommand cmd = new SqlCommand("UpdateUser"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", passwordHash);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@mobile", mobile);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteScalar();
                    con.Close();
                }
            }
        }
    }
}