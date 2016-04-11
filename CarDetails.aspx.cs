using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null)
        {
            int car_id = Int32.Parse(Request.QueryString["Id"]);
            Car car = new Car(car_id);
            Labelmake.Text = car.make;
            LabelModel.Text = car.model;
            LabelType.Text = car.type;
            LabelColour.Text = car.colour;
            LabelYear.Text = car.year.ToString();
            LabelLocation.Text = car.location;
            LabelPrice.Text = car.price.ToString();
            foreach(Image image in car.images){
                System.Web.UI.WebControls.Image pageImaage = new System.Web.UI.WebControls.Image();
                pageImaage.CssClass = "image-responsive col-xs-12";
                pageImaage.ImageUrl = image.url;
                images.Controls.Add(pageImaage);
            }

        }
    }
}