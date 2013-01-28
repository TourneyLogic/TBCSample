<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: NFL Playoffs Bracket" %>

<%@ Register Assembly="TourneyLogic.Web.UI.BracketControl.v2" Namespace="TourneyLogic.Web.UI.WebControls"
    TagPrefix="tl" %>

<script runat="server">
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
        Bracket1.DisplayMode = CheckBox1.Checked ? Bracket.BracketDisplayMode.ViewMode : Bracket.BracketDisplayMode.EditPicksMode;
    }

    protected void Bracket1_BracketCreated(object sender, BracketEventArgs e)
    {
        e.Bracket.Rounds[0].Text = "Wild Card";
        e.Bracket.Rounds[1].Text = "Divisional Playoffs";
        e.Bracket.Rounds[2].Text = "Conference Championship";
        e.Bracket.Rounds[3].Text = "Super Bowl";
        e.Bracket.ChampionshipText = "World Champion";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>
        <strong>2005 NFL Playoff Bracket Example</strong></h4>
    This example shows how to use Tourney Bracket Control to build the bracket for the
    NFL playoffs.<br />
    <br />
    <tl:Bracket runat="server" ID="Bracket1" DisplayMode="ViewMode" RoundWidth="200"
        OnBracketCreated="Bracket1_BracketCreated" RoundTextStyle-Font-Bold="True"><Competitors>
<tl:BracketCompetitor ID="AFCWildCard1" CompetitorName="N.Y. Jets"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AFCWildCard2" CompetitorName="San Diego"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AFCWildCard3" CompetitorName="Denver"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AFCWildCard4" CompetitorName="Indianapolis"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCWildCard1" CompetitorName="Minnestoa"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCWildCard2" CompetitorName="Green Bay"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCWildCard3" CompetitorName="St. Louis"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCWildCard4" CompetitorName="Seattle"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AFCDiv1" CompetitorName="Pittsburgh"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AFCDiv2" CompetitorName="New England"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCDiv1" CompetitorName="Philadelphia"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NFCDiv2" CompetitorName="Atlanta"></tl:BracketCompetitor>
</Competitors>
<Results>
<tl:BracketMatchupResult MatchupID="MatchUp1" WinningCompetitorId="AFCWildCard1" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp2" WinningCompetitorId="AFCWildCard4" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp3" WinningCompetitorId="NFCWildCard2" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp4" WinningCompetitorId="NFCWildCard3" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp5" WinningCompetitorId="AFCDiv1" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp6" WinningCompetitorId="AFCDiv2" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp7" WinningCompetitorId="NFCDiv1" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp8" WinningCompetitorId="NFCDiv2" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp9" WinningCompetitorId="AFCDiv2" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp10" WinningCompetitorId="NFCDiv1" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
<tl:BracketMatchupResult MatchupID="MatchUp11" WinningCompetitorId="AFCDiv2" ReadOnly="False" CorrectPick="NotSet"></tl:BracketMatchupResult>
</Results>
    </tl:Bracket>
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"
        Text="Read-Only?" Checked="True" />&nbsp;<br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Bracket Results" /><br />
    <br />
    <asp:GridView ID="GridView1" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Winning Team">
                <ItemTemplate>
                    <%#((BracketMatchupResult)Container.DataItem).GetWinningCompetitor().CompetitorName %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Round">
                <ItemTemplate>
                    <%#((BracketMatchupResult)Container.DataItem).GetRound().ID %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
