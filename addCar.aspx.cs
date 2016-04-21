using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            //redirect to login.aspx if user is not login.
            Response.Redirect("Login.aspx");
        }
    }
    protected void ButtonAddCar_Click(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
        Car car = new Car(DropDownListTypes.SelectedValue, TextBoxMake.Text, TextBoxModel.Text, TextBoxColour.Text, Int32.Parse(TextBoxPrice.Text), Int32.Parse(TextBoxYear.Text), TextBoxLocation.Text, user.id);

        if (FileUploadImage.HasFile)
        {
            foreach (var file in FileUploadImage.PostedFiles)
            {
                string filename = Path.GetFileName(file.FileName);
                string url = "/images/" + filename;
                file.SaveAs(Server.MapPath(url));

                Image image = new Image(url);
                car.AddImage(image);
            }
        }
        car.Upload();
        Response.Redirect("~/CarDetails.aspx?Id=" + car.id);
    }
}