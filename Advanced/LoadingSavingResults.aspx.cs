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
using System.Data.SqlClient;
using TourneyLogic.Web.UI.WebControls;

public partial class Advanced_LoadingSavingResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadResults();
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Bracket1.ReadOnly = CheckBox1.Checked;
        LoadResults();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {br
        if (Bracket1.AreResultsValid)
        {
            UpdateResults();
        }
    }

    private void LoadResults()
    {
        Bracket1.Results.Clear();

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuickStartDBConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("Select * From tbcqsResults", cn);

        cn.Open();

        SqlDataReader ResultsReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (ResultsReader.Read())
        {
            BracketMatchupResult mr = new BracketMatchupResult();
            
            mr.MatchupID = ResultsReader["MatchupId"].ToString();
            mr.WinningCompetitorId = ResultsReader["WinningCompetitorId"].ToString();

            Bracket1.Results.Add(mr);
        }

        ResultsReader.Close();

    }


    private void UpdateResults() 
    {
        DeleteResults();

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuickStartDBConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("Insert tbcqsResults (MatchupId,  WinningCompetitorId, RoundId ) Values (@MatchupId, @WinningCompetitorId, @RoundId)", cn);

        SqlParameter MatchupParam = new SqlParameter("@MatchupId", DBNull.Value);
        cmd.Parameters.Add(MatchupParam);

        SqlParameter WinningCompetitorParam = new SqlParameter("@WinningCompetitorId", DBNull.Value);
        cmd.Parameters.Add(WinningCompetitorParam);

        SqlParameter RoundParam = new SqlParameter("@RoundId", DBNull.Value);
        cmd.Parameters.Add(RoundParam);
        
        cn.Open();

        foreach (BracketMatchupResult mr in Bracket1.Results)
        {
            MatchupParam.Value = mr.MatchupID;
            WinningCompetitorParam.Value = mr.WinningCompetitorId;
            //TODO: Add Round Id to database using the getRound method.
            //RoundParam.Value = ???

           int RowsAffected = cmd.ExecuteNonQuery();
        }

        cn.Close();

    }

    private void DeleteResults()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuickStartDBConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("DELETE FROM tbcqsResults", cn);

        cn.Open();

        cmd.ExecuteNonQuery();

        cn.Close();
    }
}
