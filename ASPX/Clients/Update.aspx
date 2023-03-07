<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="ASPX.Clients.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>Update Client</h2>
     <% if (errorMessage.Length > 0)
      { %>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><% errorMessage.ToString();  %></strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
  <%  } %>
    <form method="post">
        <asp:HiddenField  runat="server"/>
        <div class="row mb-3">
            <asp:Label ID="lbName_ed" CssClass="col-sm-3 col-form-label" runat="server" Text="Name"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtName_ed" runat="server" CssClass="form-control"/>
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbEmail_ed" CssClass="col-sm-3 col-form-label" runat="server" Text="Email"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtEmail_ed" TextMode="Email" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbPhone_ed" CssClass="col-sm-3 col-form-label" runat="server" Text="Phone"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPhone_ed" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbAddress_ed" CssClass="col-sm-3 col-form-label" runat="server" Text="Address"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtAddress_ed" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="offset-sm-3 col-sm-3 d-grid">
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnUpdate_Click"  />
            </div>
            <div class="col-sm-3 d-grid">
                <a class="btn btn-outline-primary" href="/Clients/Default" role="button">Cancel</a>
            </div>
        </div>
    </form>
</asp:Content>
