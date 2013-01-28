<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: MLB Playoff Bracket" %>
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
            <strong>2005 MLB Playoff Bracket Example</strong></h4>
            This example shows how to use Tourney Bracket Control to build the bracket for the MLB playoffs.<br />
    <tl:Bracket runat="server" ID="Bracket1" DisplayMode="EditPicksMode" RoundWidth="130"><Competitors>

<tl:BracketCompetitor ID="AL1" CompetitorName="Yankees"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AL2" CompetitorName="Angels"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AL3" CompetitorName="Red Sox" ></tl:BracketCompetitor>
<tl:BracketCompetitor ID="AL4" CompetitorName="White Sox"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NL1" CompetitorName="Padres" ></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NL2" CompetitorName="Cardinals" ></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NL3" CompetitorName="Astros" ></tl:BracketCompetitor>
<tl:BracketCompetitor ID="NL4" CompetitorName="Braves" ></tl:BracketCompetitor>


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

