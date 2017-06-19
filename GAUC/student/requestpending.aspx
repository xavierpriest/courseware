<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="requestpending.aspx.cs" Inherits="GAUC.student.requestpending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>GAU E-Learning System</h3>
<h5>Students Home Page</h5>

<br />
<div class="unit-80">
<h3>Request is still pending approval</h3>
<p>You will have access when request is approved</p>
    <asp:Button ID="Button1" runat="server" Text="Home" onclick="Button1_Click" CssClass="btn btn-medium" />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
