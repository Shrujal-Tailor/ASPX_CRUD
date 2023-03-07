<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPX.Clients.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <header>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4-4.6.0/jq-3.6.0/dt-1.13.1/b-2.3.3/fc-4.2.1/sc-2.0.7/sb-1.4.0/sp-2.1.0/sl-1.5.0/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </header>
    <br>
    <h2>List of Clients</h2>

    <a class='btn btn-primary btn-sm' style="margin-bottom: 10px" href='/Clients/Create'>New Client </a>
    <br />
    <br />
    <asp:TextBox ID="txtSearch" runat="server" />
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <br />
    <br />
    <table id="myTable" class="table">
        <tr>
            <td>
                <asp:GridView ID="dgViewClients" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="Page_Load" OnRowCommand="dgViewClients_RowCommand" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at" />
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>Action</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" CssClass="btn btn-primary btn-sm" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Eval("id") %>' />
                                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-sm" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('Are you sure you want to delete this user?');"/>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConn %>" SelectCommand="SELECT * FROM [client_master]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
