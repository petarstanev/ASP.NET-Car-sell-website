using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SQLItem
/// </summary>
public class SQLItem
{

    private string ConnectionString { get; set; }
    protected SqlConnection Connection { get; private set; }

	public SQLItem()
	{
        ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        Connection = new SqlConnection(ConnectionString);
	}
}