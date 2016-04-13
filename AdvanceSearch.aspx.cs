using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdvanceSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        List<Car> cars = Car.getAllCars();
        List<Car> outputCars = new List<Car>();

        Car car;
        for (int i = 0; i < cars.Count; i++)
        {
             car = cars[i];

            if (TextBoxType.Text != "") {
                String type = car.type;
                if (type.Contains(TextBoxType.Text))
                {
                    outputCars.Add(cars[i]);
                }       
            }            
        }

        if (outputCars.Count == 0) {
            outputCars = cars;
        }

        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("Type", System.Type.GetType("System.String"));
        dt.Columns.Add("Image", System.Type.GetType("System.String"));
        dt.Columns.Add("Make", System.Type.GetType("System.String"));
        dt.Columns.Add("Colour", System.Type.GetType("System.String"));
        dt.Columns.Add("Price", System.Type.GetType("System.Int32"));
        dt.Columns.Add("Year", System.Type.GetType("System.Int32"));
         dt.Columns.Add("Location", System.Type.GetType("System.String"));
        foreach (Car carOutput in outputCars)
        {

            dr = dt.NewRow();
            dr["Type"] = carOutput.type;
            dr["Image"] = "";
            dr["Make"] = carOutput.make;
            dr["Colour"] = carOutput.model;
            dr["Price"] = carOutput.price;
            dr["Year"] = carOutput.year;
            dr["Location"] = carOutput.location;

            dt.Rows.Add(dr);
        }
        dt.AcceptChanges();
        GridViewCars.DataSource = dt;
        GridViewCars.DataBind();
    }

}