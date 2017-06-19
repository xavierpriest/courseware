<%@ Page Title="" Language="C#" MasterPageFile="~/master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="backupinstructor.aspx.cs" Inherits="GAUC.admin.backupinstructor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
<h2>GAU E-learning System</h2>
<h4>Instructor Backup</h4>
<p>
    <asp:Button ID="Button1" runat="server" Text="Click to Begin Backup" 
        CssClass="btn btn-medium btn-green" onclick="Button1_Click"/>

</p>

</div>
</asp:Content>
