<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: Dynamic Layout Bracket Example" %>

<%@ Register Assembly="TourneyLogic.Web.UI.BracketControl.v2" Namespace="TourneyLogic.Web.UI.WebControls"
    TagPrefix="tl" %>

<script runat="server">

    protected void AddButton_Click(object sender, EventArgs e)
    {
        Bracket1.Competitors.Add(new BracketCompetitor());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Bracket1.Competitors.Count <= 2)
            RemoveButton.Enabled = false;
        else
            RemoveButton.Enabled = true;
    }

    protected void RemoveButton_Click(object sender, EventArgs e)
    {
        Bracket1.Competitors.Remove(Bracket1.Competitors[Bracket1.Competitors.Count - 1]);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <h4>
        <strong>Dynamic Layout</strong></h4>
    This example shows how easy it is to dynamically build brackets. Just add competitors
    and watch the layout change.<br />
    <br />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add Competitor" />
            <asp:Button ID="RemoveButton" runat="server" Text="Remove Competitor" OnClick="RemoveButton_Click" /><br />
            <br />
            <tl:Bracket ID="Bracket1" runat="server">
        <competitors>
<tl:BracketCompetitor ID="BracketCompetitor1"></tl:BracketCompetitor>
<tl:BracketCompetitor ID="BracketCompetitor2"></tl:BracketCompetitor>
</competitors>
            </tl:Bracket>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
