using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Used for displaying the cars that user is selling at the moment.
/// </summary>
public class UserCarCollection : CarCollection
{
	public UserCarCollection()
	{
        SqlCommand command = new SqlCommand("GetUserCars", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
	    User user = (User) HttpContext.Current.Session["user"];
        command.Parameters.AddWithValue("@user_id", user.id);
        Connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        
        while (reader.Read())
        {
            ReadCar(reader);
        }
        Connection.Close();
	}
}