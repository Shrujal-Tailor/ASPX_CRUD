﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ASPX.Clients.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>Update Client</h2>
    <form method="post">
    <div class="row mb-3">
        <label class="col-sm-3 col-form-label">Name</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="name" asp-for="Details.name" value="@Model.clientInfo.name" />
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-3 col-form-label">Email</label>
        <div class="col-sm-6">
            <input type="email" class="form-control" name="email" asp-for="Details.email" value="@Model.clientInfo.email" />
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-3 col-form-label">Password</label>
        <div class="col-sm-6">
            <input type="password" class="form-control" name="password" asp-for="Details.password" value="@Model.clientInfo.password" />
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-3 col-form-label">Phone</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="phone" asp-for="Details.phone" value="@Model.clientInfo.phone" />
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-sm-3 col-form-label">Address</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="address" asp-for="Details.address" value="@Model.clientInfo.address" />
        </div>
    </div>

   <%-- @if (Model.successMessage.Length > 0)
    {
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>@Model.successMessage</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    }--%>
    <div class="row mb-3">
        <div class="offset-sm-3 col-sm-3 d-grid">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <div class="col-sm-3 d-grid">
            <a class="btn btn-outline-primary" href="/Clients/Default" role="button">Cancel</a>
        </div>
    </div>
</form>
</asp:Content>