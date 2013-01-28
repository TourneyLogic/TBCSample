using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PopularTourneys_MLB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Bracket1.AreResultsValid)
        {
            GridView1.DataSource = Bracket1.Results;
            GridView1.DataBind();
        }
    }
    
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Bracket1.ReadOnly = CheckBox1.Checked;

    }
}
