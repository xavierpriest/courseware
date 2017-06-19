<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="SendEmail.aspx.cs" Inherits="GAUC.SendEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
<p>
    <asp:Label ID="Label1" runat="server" Text="From:"></asp:Label>
    <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label2" runat="server" Text="To:"></asp:Label>
    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Subject:"></asp:Label>
    <asp:TextBox ID="txtSub" runat="server"></asp:TextBox>
</p>

    <asp:Button ID="btnSend" runat="server" Text="Send" onclick="btnSend_Click" />
</div>
</asp:Content>
