using System.Data.SqlClient;

/// <summary>
/// This class is used by AdvanceSearch to show all cars for sale from the database.
/// Extends CarrCollection.
/// </summary>
public class AllCarCollection : CarCollection
{
    public AllCarCollection():base()
    {
        SqlCommand command = new SqlCommand("GetAllCars", Connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        Connection.Open();
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
           ReadCar(reader);
        }
        Connection.Close();
    }
}