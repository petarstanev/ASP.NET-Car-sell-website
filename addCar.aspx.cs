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

    }
    protected void ButtonAddCar_Click(object sender, EventArgs e)
    {
        User user = (User)Session["user"];
        Car car = new Car(DropDownListTypes.SelectedValue, TextBoxMake.Text, TextBoxModel.Text, TextBoxColour.Text, Int32.Parse(TextBoxPrice.Text), Int32.Parse(TextBoxYear.Text), TextBoxLocation.Text, user.id);

        if (FileUploadImage.HasFile == true)
        {
            foreach (var file in FileUploadImage.PostedFiles)
            {
                string filename = Path.GetFileName(file.FileName);
                string url = "/images/" + filename;
                file.SaveAs(Server.MapPath(url));

                Image image = new Image(url,false);
                car.addImage(image);
            }
        }
        car.Upload();
    }
}