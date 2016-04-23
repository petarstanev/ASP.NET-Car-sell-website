using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Trades : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        BoughtAndSold boughtAndSold = new BoughtAndSold();
        string type = Request.QueryString["type"];
        if (type != null && type.Equals("sold"))
        {
            ObjectDataSourceBoughtAndSold.SelectMethod = "GetSold";
            boughtAndSold.GetSold();
            soldLi.Attributes["class"] = "active";
            boughtLi.Attributes["class"] = "";
        }
        else
        {
            boughtAndSold.GetBought();
        }

        if (boughtAndSold.Count == 0)
        {
            contentTrades.Visible = false;
            LabelEmpty.Visible = true;
        }


        LabelMoneyMin.Text = boughtAndSold.MinMoney.ToString();
        LabelMoneyAverage.Text = boughtAndSold.AverageMoney.ToString();
        LabelMoneyMax.Text = boughtAndSold.MaxMoney.ToString();
        LabelMoneyTotal.Text = boughtAndSold.TotalMoney.ToString();

        LabelYearMin.Text = boughtAndSold.MinYear.ToString();
        LabelYearAverage.Text = boughtAndSold.AverageYear.ToString();
        LabelYearMax.Text = boughtAndSold.MaxYear.ToString();
    }
}