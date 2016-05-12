using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarEdit : System.Web.UI.Page
{
    Car car;
    protected void Page_Load(object sender, EventArgs e)
    {
        int car_id;
        if (Int32.TryParse(Request.QueryString["Id"], out car_id))
        {
           
            car = new Car(car_id);
            if (!Page.IsPostBack)
            {
                TextBoxMake.Text = car.make;
                TextBoxModel.Text = car.model;
                DropDownListTypes.SelectedValue = car.type;
                TextBoxColour.Text = car.colour;
                TextBoxYear.Text = car.year.ToString();
                TextBoxLocation.Text = car.location;
                TextBoxPrice.Text = car.price.ToString();
            }
        }
        else
        {
            Response.Redirect("AdvanceSearch.aspx");
        }
    }

    protected void ButtonAddImage_Click(object sender, EventArgs e)
    {

        if (FileUploadImage.HasFile)
        {
            var file = FileUploadImage.PostedFile;

            string filename = Path.GetFileName(file.FileName);
            string url = "/images/" + filename;
            file.SaveAs(Server.MapPath(url));

            Image image = new Image(url);
            car.AddImage(image);
            image.Upload(car.id);
        }
        Response.Redirect("~/CarEdit.aspx?Id=" + car.id);
    }

    protected void ButtonUpdate_Click(object sender, EventArgs e)
    {
        car.make = TextBoxMake.Text;
        car.model = TextBoxModel.Text;
        car.type = DropDownListTypes.SelectedValue;
        car.colour = TextBoxColour.Text;
        car.year = Int32.Parse(TextBoxYear.Text);
        car.location = TextBoxLocation.Text;
        car.price = Int32.Parse(TextBoxPrice.Text);
        car.Update();
    }

}