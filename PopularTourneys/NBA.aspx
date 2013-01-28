<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: NBA Playoffs Bracket" %>
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <h4>
            <strong>2005 NBA Playoff Bracket Example</strong></h4>
            This example shows how to use Tourney Bracket Control to build the bracket for the NBA playoffs.<br />
            <br />
        
        
    <tl:Bracket runat="server" ID="Bracket1" DisplayMode="EditPicksMode"  RoundWidth="130" ><Competitors>

<tl:BracketCompetitor ID="East1" CompetitorName="Miami" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East8" CompetitorName="New Jersey" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East4" CompetitorName="Chicago" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East5" CompetitorName="Washington" SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East3" CompetitorName="Boston" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East6" CompetitorName="Indiana" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East2" CompetitorName="Detroit" SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="East7" CompetitorName="Philadephia" SeedNumber="7"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West1" CompetitorName="Phoenix" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West8" CompetitorName="Memphis" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West4" CompetitorName="Dallas" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West5" CompetitorName="Houston" SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West3" CompetitorName="Seattle" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West6" CompetitorName="Sacramento" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West2" CompetitorName="San Antonio" SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="West7" CompetitorName="Denver" SeedNumber="7"></tl:BracketCompetitor>

</Competitors>
    </tl:Bracket>
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"
            Text="Read-Only?" />&nbsp;<br />
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

