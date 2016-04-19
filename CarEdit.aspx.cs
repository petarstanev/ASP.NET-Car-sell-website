using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Car car;
        if (Request.QueryString["Id"] != null)
        {
            int car_id = Int32.Parse(Request.QueryString["Id"]);
            car = new Car(car_id);
            TextBoxMake.Text = car.make;
            TextBoxModel.Text = car.model;
            TextBoxType.Text = car.type;
            TextBoxColour.Text = car.colour;
            TextBoxYear.Text = car.year.ToString();
            TextBoxLocation.Text = car.location;
            TextBoxPrice.Text = car.price.ToString();
        }
    }
}