﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPX.Clients.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br>
    <h2>List of Clients</h2>
    <a class='btn btn-primary btn-sm' style="margin-bottom: 10px" href='/Clients/Create'>New Client </a>
    <table id="myTable" class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Created At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%--@foreach (var item in Model.listClients)--%>
        {
            <tr>
                <td>@item.name</td>
                <td>@item.email</td>
                <td>@item.phone</td>
                <td>@item.address</td>
                <td>@item.created_at</td>
                <td>
                    <a class="btn btn-primary btn-sm" href="/Clients/Edit?id=@item.id">Edit</a>
                    <a class="btn btn-danger btn-sm" href="/Clients/Delete?id=@item.id" onclick="return confirm('ARE YOU SURE YOU WANT TO DELETE THIS RECORD')">Delete</a>
                </td>
            </tr>
            }
        </tbody>
    </table>
</asp:Content>
