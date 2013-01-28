<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: Data Binding Competitors" %>
<%@ Register Assembly="TourneyLogic.Web.UI.BracketControl.v2" Namespace="TourneyLogic.Web.UI.WebControls"
    TagPrefix="tl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h4>Data Binding Competitors</h4>
This example shows how to build a dynamic bracket by loading competitors from a database.<br /><br />
<tl:Bracket runat="server" ID="Bracket1" ChampionshipText="Champion" DataCompetitorIdField="CompetitorId" DataCompetitorNameField="Name" DataCompetitorNavigateUrlField="Url" DataCompetitorSeedNumberField="Seed" DataSourceID="SqlDataSource1" InitialMatchupHeight="25" DisplayMode="ViewMode" RoundWidth="130"></tl:Bracket><asp:SqlDataSource
    ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuickStartDBConnectionString %>"
    SelectCommand="SELECT [CompetitorId], [Name], [Url], [Seed] FROM [tbcqsCompetitors]">
</asp:SqlDataSource>
</asp:Content>

