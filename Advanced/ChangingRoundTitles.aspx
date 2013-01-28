<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: Changing Round Titles" %>
<%@ Register Assembly="TourneyLogic.Web.UI.BracketControl.v2" Namespace="TourneyLogic.Web.UI.WebControls"
    TagPrefix="tl" %>
<script runat="server">
    protected void Bracket1_BracketCreated(object sender, BracketEventArgs e)
    {
        e.Bracket.Rounds[0].Text = "First Round";
        e.Bracket.Rounds[0].NavigateUrl = "http://www.tourneylogic.com";

        e.Bracket.Rounds[1].Text = "Second Round";
        e.Bracket.Rounds[2].Text = "Sweet Sixteen";
        e.Bracket.Rounds[3].Text = "Elite Eight";
        e.Bracket.Rounds[4].Text = "Final Four";
        e.Bracket.Rounds[5].Text = "Championship Game";
        e.Bracket.ChampionshipText = "National Champion";

        
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
    div#r2 div.header {
        font-size: 20px;
    }
</style>
<h4>
            <strong>Changing Default Round Titles</strong></h4>
            This example shows how to change the default titles.  Notice that you can
            use the round naming convention of your tournament.  This example shows
            how to display the common NCAA March Madness Tournament round names.<br />
        <br />
        
    <tl:Bracket runat="server" ID="Bracket1" DisplayMode="EditPicksMode" Font-Size="x-Small" RoundWidth="150" OnBracketCreated="Bracket1_BracketCreated" RoundTextStyle-Font-Bold="True" ><Competitors>

<tl:BracketCompetitor ID="Chicago1" CompetitorName="Illinois" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago16" CompetitorName="Fair. Dickinson" SeedNumber="16"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago8" CompetitorName="Texas" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago9" CompetitorName="Nevada" SeedNumber="9"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago5" CompetitorName="Alabama" SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago12" CompetitorName="Wis-Milwaukee" SeedNumber="12"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago4" CompetitorName="Boston College" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago13" CompetitorName="Penn" SeedNumber="13"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago6" CompetitorName="LSU" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago11" CompetitorName="UAB" SeedNumber="11"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago3" CompetitorName="Arizonia" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago14" CompetitorName="Utah St." SeedNumber="14"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago7" CompetitorName="Southern Ill." SeedNumber="7"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago10" CompetitorName="St. Mary's (Ca.)" SeedNumber="10"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago2" CompetitorName="Oklamhoma St." SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Chicago15" CompetitorName="SE Louisiana" SeedNumber="15"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque1" CompetitorName="Washington" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque16" CompetitorName="Montana" SeedNumber="16"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque8" CompetitorName="Pacific" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque9" CompetitorName="Pittsburgh" SeedNumber="9"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque5" CompetitorName="Georgia Tech" SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque12" CompetitorName="G. Washington" SeedNumber="12"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque4" CompetitorName="Louisville" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque13" CompetitorName="La.-Lafayette" SeedNumber="13"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque6" CompetitorName="Texas Tech" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque11" CompetitorName="UCLA" SeedNumber="11"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque3" CompetitorName="Gonzaga" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque14" CompetitorName="Winthrop" SeedNumber="14"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque7" CompetitorName="West Virginia" SeedNumber="7"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque10" CompetitorName="Creighton" SeedNumber="10"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque2" CompetitorName="Wake Forest" SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Albuquerque15" CompetitorName="Chattanooga" SeedNumber="15"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse1" CompetitorName="North Carolina" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse16" CompetitorName="Oakland" SeedNumber="16"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse8" CompetitorName="Minnesota" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse9" CompetitorName="Iowa St." SeedNumber="9"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse5" CompetitorName="Villanova" SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse12" CompetitorName="New Mexico" SeedNumber="12"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse4" CompetitorName="Flordia" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse13" CompetitorName="Ohio" SeedNumber="13"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse6" CompetitorName="Wisconsin" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse11" CompetitorName="Northern Iowa" SeedNumber="11"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse3" CompetitorName="Kansas" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse14" CompetitorName="Bucknell" SeedNumber="14"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse7" CompetitorName="Charlotte" SeedNumber="7"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse10" CompetitorName="N.C. State" SeedNumber="10"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse2" CompetitorName="Connecticut" SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Syarcuse15" CompetitorName="UCF" SeedNumber="15"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin1" CompetitorName="Duke" SeedNumber="1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin16" CompetitorName="Delaware St." SeedNumber="16"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin8" CompetitorName="Stanford" SeedNumber="8"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin9" CompetitorName="Mississippi St." SeedNumber="9"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin5" CompetitorName="Michigan St." SeedNumber="5"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin12" CompetitorName="Old Dominion" SeedNumber="12"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin4" CompetitorName="Syracuse" SeedNumber="4"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin13" CompetitorName="Vermont" SeedNumber="13"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin6" CompetitorName="Utah" SeedNumber="6"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin11" CompetitorName="UTEP" SeedNumber="11"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin3" CompetitorName="Oklahoma" SeedNumber="3"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin14" CompetitorName="Niagra" SeedNumber="14"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin7" CompetitorName="Cincinnati" SeedNumber="7"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin10" CompetitorName="Iowa" SeedNumber="10"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin2" CompetitorName="Kentucky" SeedNumber="2"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="Austin15" CompetitorName="Eastern Ky." SeedNumber="15"></tl:BracketCompetitor>
</Competitors></tl:Bracket>
</asp:Content>

