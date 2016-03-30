using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lottery : System.Web.UI.Page
{
    LotteryGenerator lottery  = new LotteryGenerator();

    protected void Page_Load(object sender, EventArgs e)
    {
       // lottery
    }
    protected void Generate_Click(object sender, EventArgs e)
    {
       
       lottery.GenerateNumbers();
       redraw();
      
    }

    protected void Sort_Click(object sender, EventArgs e)
    {
        lottery.Sort();
        redraw();
    }

    private void redraw(){
        for (int i = 0; i < lottery.randomNumbers.Count(); i++)
        {
            
            Label label1 = new Label();
            int number = lottery.randomNumbers[i];
            if (10 <= number && number < 20)
            {
                label1.BackColor = System.Drawing.Color.Blue;
            }
            else if (20 <= number && number < 30)
            {
                label1.BackColor = System.Drawing.Color.Pink;
            }
            else if (30 <= number && number < 40)
            {
                label1.BackColor = System.Drawing.Color.Green;
            }
            else if (40 <= number && number < 50)
            {
                label1.BackColor = System.Drawing.Color.Yellow;
            }

            label1.CssClass = "padding";

            label1.Text = lottery.randomNumbers[i].ToString() + " ";
            Panel1.Controls.Add(label1);
        }            
    }
}