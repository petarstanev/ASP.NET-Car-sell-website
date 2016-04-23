using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Abstract class to represent SQLItem used by Car, Image, Payment.
/// </summary>
public abstract class SQLItem
{

    private string ConnectionString { get; set; }
    protected SqlConnection Connection { get; private set; }

	public SQLItem()
	{
        ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        Connection = new SqlConnection(ConnectionString);
	}
}