<%@ Page Title="" Language="C#" MasterPageFile="~/master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="editpersonal.aspx.cs" Inherits="GAUC.Admin.editcourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="unit-centered unit-50">
<div class="unit-push-20 unit-80"">
<h3>Edit Instructor Account</h3>
    <h5>Personal Details</h5>
</div>
<p>
    <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" CssClass="width-100"></asp:TextBox>
    </p>

<p>
    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="width-100"></asp:TextBox>
    </p>

<p>
    <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
    <asp:TextBox ID="txtTitle" runat="server" CssClass="width-100"></asp:TextBox>
    </p>

<p>
    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="width-100"></asp:TextBox>
    <br />
    </p>
    
   

<p>
    <asp:Label ID="Label5" runat="server" Text="Country"></asp:Label>
    <asp:DropDownList ID="listCountry" runat="server" CssClass="width-100">
        <asp:ListItem>Choose one</asp:ListItem>
        <asp:ListItem>Turkey</asp:ListItem>
        <asp:ListItem>Nigeria</asp:ListItem>
        <asp:ListItem>Austria</asp:ListItem>
        <asp:ListItem>Australia</asp:ListItem>
        <asp:ListItem>Canada</asp:ListItem>
        <asp:ListItem>United States</asp:ListItem>
        <asp:ListItem>Belgium</asp:ListItem>
        <asp:ListItem>Cyprus</asp:ListItem>
        <asp:ListItem>Egypt</asp:ListItem>
        <asp:ListItem>Finland</asp:ListItem>
        <asp:ListItem>France</asp:ListItem>
        <asp:ListItem>Ireland</asp:ListItem>
        <asp:ListItem>Iceland</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    <asp:Label ID="Label6" runat="server" Text="Department"></asp:Label>
    <asp:DropDownList ID="listDepartment" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" CssClass="width-100">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GAUCoursewareConnectionString %>" 
        SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>
</p>
<p>
    <asp:Button ID="btnUpdate" runat="server" Text="Update Changes" 
        CssClass="btn btn-medium btn-green" onclick="btnUpdate_Click"/>
    <asp:Label ID="Label7" runat="server" CssClass="color-green"></asp:Label>
</p>
</div>
</asp:Content>
