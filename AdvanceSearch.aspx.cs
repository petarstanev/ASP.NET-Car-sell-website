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
    DataTable dt;
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

            if (TextBoxType.Text != "")
            {
                if (!car.type.Contains(TextBoxType.Text))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxMake.Text != "")
            {
                if (!car.make.Contains(TextBoxMake.Text))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxModel.Text != "")
            {
                if (!car.model.Contains(TextBoxModel.Text))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxColour.Text != "")
            {
                if (!car.colour.Contains(TextBoxColour.Text))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxPriceStarting.Text != "" || TextBoxPriceMaximum.Text != "")
            {
                int startingPrice = 0, maximumPrice = Int32.MaxValue;
                if (TextBoxPriceStarting.Text != "")
                {
                    startingPrice = Int32.Parse(TextBoxPriceStarting.Text);
                }
                if (TextBoxPriceMaximum.Text != "")
                {
                    maximumPrice = Int32.Parse(TextBoxPriceMaximum.Text);
                }


                if (!(maximumPrice > car.price && car.price > startingPrice))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxYearStarting.Text != "" || TextBoxYearEnding.Text != "")
            {
                int startingYear = 0, endingYear = Int32.MaxValue;
                if (TextBoxYearStarting.Text != "")
                {
                    startingYear = Int32.Parse(TextBoxYearStarting.Text);
                }
                if (TextBoxYearEnding.Text != "")
                {
                    endingYear = Int32.Parse(TextBoxYearEnding.Text);
                }


                if (!(endingYear > car.year && car.year > startingYear))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }

            if (TextBoxLocation.Text != "")
            {
                if (!car.location.Contains(TextBoxType.Text))
                {
                    cars.RemoveAt(i);
                    i--;
                    continue;
                }
            }
        }



        dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("Type", System.Type.GetType("System.String"));
        dt.Columns.Add("Image", System.Type.GetType("System.String"));
        dt.Columns.Add("Make", System.Type.GetType("System.String"));
        dt.Columns.Add("Model", System.Type.GetType("System.String"));
        dt.Columns.Add("Colour", System.Type.GetType("System.String"));
        dt.Columns.Add("Price", System.Type.GetType("System.Int32"));
        dt.Columns.Add("Year", System.Type.GetType("System.Int32"));
        dt.Columns.Add("Location", System.Type.GetType("System.String"));

        foreach (Car carOutput in cars)
        {

            dr = dt.NewRow();
            dr["Type"] = carOutput.type;
            dr["Image"] = carOutput.getMainImageUrl();
            dr["Make"] = carOutput.make;
            dr["Model"] = carOutput.model;
            dr["Colour"] = carOutput.colour;
            dr["Price"] = carOutput.price;
            dr["Year"] = carOutput.year;
            dr["Location"] = carOutput.location;

            dt.Rows.Add(dr);
        }
        GridViewCars.DataSource = dt;
        GridViewCars.DataBind();
    }

}