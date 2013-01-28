<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Title="TOURNEY LOGIC: TBC 2.1 QuickStart Tutorial: Dynamic Bracket Configuration" %>

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
        Label1.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Bracket1.AreResultsValid)
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Validate("InsertCompetitor");

        if (Page.IsValid)
        {
            DetailsView1.InsertItem(false);
            DeleteResults();
        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        DeleteResults();
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>
        Dynamic Bracket Configuration</h4>
    This example shows how to build a bracket dynamically. Check out how to add and
    manage competitors and results using a database.<br />
    <br />
    <table width="100%">
    <tr>
            <td>
                <strong>Preview Bracket and Manage Results</strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Results Saved Successfully" EnableViewState="false"
                    Visible="false" Font-Bold="true" Font-Italic="true" ForeColor="green"></asp:Label><br />
                <tl:Bracket runat="server" ID="Bracket1" ChampionshipText="Championship" DataCompetitorIdField="CompetitorId"
                    DataCompetitorNameField="Name" DataCompetitorNavigateUrlField="Url" DataCompetitorSeedNumberField="Seed"
                    DataSourceID="CompetitorsDataSource" InitialMatchupHeight="25" DisplayMode="EditPicksMode"
                    RoundWidth="130"></tl:Bracket>
                <br />
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"
                    Text="Read-Only" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Results" />
                <asp:SqlDataSource ID="CompetitorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QuickStartDBConnectionString %>"
                    SelectCommand="SELECT [CompetitorId], [Name], [Url], [Seed] FROM [tbcqsCompetitors]"
                    DeleteCommand="DELETE FROM [tbcqsCompetitors] WHERE [CompetitorId] = @CompetitorId"
                    InsertCommand="INSERT INTO [tbcqsCompetitors] ([CompetitorId], [Name], [Url], [Seed]) VALUES (@CompetitorId, @Name, @Url, @Seed)"
                    UpdateCommand="UPDATE [tbcqsCompetitors] SET [Name] = @Name, [Url] = @Url, [Seed] = @Seed WHERE [CompetitorId] = @CompetitorId">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="CompetitorId" PropertyName="SelectedValue"
                            Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Url" Type="String" />
                        <asp:Parameter Name="Seed" Type="String" />
                        <asp:Parameter Name="CompetitorId" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompetitorId" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Url" Type="String" />
                        <asp:Parameter Name="Seed" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br /><br />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Manage Competitors</strong></td>
        </tr>
        <tr>
            <td>
                <i>Deleting competitors will delete saved results.</i><br /><br />
                <asp:GridView ID="GridView1" runat="server" DataSourceID="CompetitorsDataSource"
                    AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="CompetitorId" OnRowDeleted="GridView1_RowDeleted">
                </asp:GridView>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Insert New Competitor</strong></td>
        </tr>
        <tr>
            <td>
                <i>Inserting competitors will delete saved results.</i><br /><br />
                <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="CompetitorsDataSource"
                    DefaultMode="Insert" Height="24px" Width="380px" AutoGenerateRows="False">
                    <Fields>
                        <asp:TemplateField HeaderText="Competitor ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompetitorID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompetitorID") %>'></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="CompetitorIdValidator" ControlToValidate="TextBox1" ValidationGroup="InsertCompetitor">* Required</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompetitorID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="* Required" ValidationGroup="InsertCompetitor"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="URL" SortExpression="url">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("url") %>' Width="361px"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("url") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seed" SortExpression="Seed">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Seed") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Seed") %>' Width="48px"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Seed") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <InsertRowStyle Wrap="False" />
                </asp:DetailsView>
                <asp:Button ID="Button2" runat="server" Text="Insert Competitor" OnClick="Button2_Click" /><br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
