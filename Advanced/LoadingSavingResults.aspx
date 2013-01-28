<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: Load and Saving Results" %>
<%@ Register Assembly="TourneyLogic.Web.UI.BracketControl.v2" Namespace="TourneyLogic.Web.UI.WebControls"
    TagPrefix="tl" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadResults();
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Bracket1.DisplayMode = CheckBox1.Checked ? Bracket.BracketDisplayMode.ViewMode : Bracket.BracketDisplayMode.EditPicksMode;
        LoadResults();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
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

        SqlDataReader resultsReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (resultsReader.Read())
        {
            BracketMatchupResult mr = new BracketMatchupResult();
            
            mr.MatchupID = resultsReader["MatchupId"].ToString();
            mr.WinningCompetitorId = resultsReader["WinningCompetitorId"].ToString();

            Bracket1.Results.Add(mr);
        }

        resultsReader.Close();

    }


    private void UpdateResults() 
    {
        DeleteResults();

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["QuickStartDBConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("Insert tbcqsResults (MatchupId,  WinningCompetitorId, RoundId ) Values (@MatchupId, @WinningCompetitorId, @RoundId)", cn);

        SqlParameter matchupParam = new SqlParameter("@MatchupId", DBNull.Value);
        cmd.Parameters.Add(matchupParam);

        SqlParameter winningCompetitorParam = new SqlParameter("@WinningCompetitorId", DBNull.Value);
        cmd.Parameters.Add(winningCompetitorParam);

        SqlParameter roundParam = new SqlParameter("@RoundId", DBNull.Value);
        cmd.Parameters.Add(roundParam);
        
        cn.Open();

        foreach (BracketMatchupResult mr in Bracket1.Results)
        {
            matchupParam.Value = mr.MatchupID;
            winningCompetitorParam.Value = mr.WinningCompetitorId;
            //TODO: Add Round Id to database using the getRound method.
            //RoundParam.Value = ???

           cmd.ExecuteNonQuery();
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h4>
    Loading and Saving Results</h4>
This example shows how to build a dynamic bracket by loading and saving results
    using a database.<br /><br />
<tl:Bracket runat="server" ID="Bracket1" ChampionshipText="Championship" DataCompetitorIdField="CompetitorId" DataCompetitorNameField="Name" DataCompetitorNavigateUrlField="Url" DataCompetitorSeedNumberField="Seed" DataSourceID="CompetitorsDataSource" InitialMatchupHeight="25" DisplayMode="EditPicksMode" RoundWidth="130"></tl:Bracket>
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"
        Text="Read-Only" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Results" />
    <asp:SqlDataSource
    ID="CompetitorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuickStartDBConnectionString %>"
    SelectCommand="SELECT [CompetitorId], [Name], [Url], [Seed] FROM [tbcqsCompetitors]">
</asp:SqlDataSource>
</asp:Content>

