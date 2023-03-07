<%@ Page Title="" Language="C#" enableEventValidation="false"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="ASPX.Clients.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>New Client</h2>

       <% if (errorMessage.Length > 0)
      { %>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><% errorMessage.ToString();  %></strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
  <%  } %>

    <form method="post">
        <div class="row mb-3">
            <asp:Label ID="lbName" CssClass="col-sm-3 col-form-label" runat="server" Text="Name"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is a required field." ForeColor="Red" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbEmail" CssClass="col-sm-3 col-form-label" runat="server" Text="Email"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is a required field." ForeColor="Red" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbPassword" CssClass="col-sm-3 col-form-label" runat="server" Text="Password"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is a required field." ForeColor="Red" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbPhone" CssClass="col-sm-3 col-form-label" runat="server" Text="Phone"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row mb-3">
            <asp:Label ID="lbAddress" CssClass="col-sm-3 col-form-label" runat="server" Text="Address"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="offset-sm-3 col-sm-3 d-grid">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
            </div>
            <div class="col-sm-3 d-grid">
                <a class="btn btn-outline-primary" href="/Clients/Default" role="button">Cancel</a>
            </div>
        </div>
    </form>
</asp:Content>