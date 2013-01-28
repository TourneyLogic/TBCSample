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

public partial class PopularTourneys_NFL : System.Web.UI.Page
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
    protected void Bracket1_BracketCreated(object sender, TourneyLogic.Web.UI.WebControls.BracketEventArgs e)
    {
        e.Bracket.Rounds[0].Text = "Wild Card";
        e.Bracket.Rounds[1].Text = "Divisional Playoffs";
        e.Bracket.Rounds[2].Text = "Conference Championship";
        e.Bracket.Rounds[3].Text = "Super Bowl";
        e.Bracket.ChampionshipText = "World Champion";
    }
}
