<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="courseenroll.aspx.cs" Inherits="GAUC.student.courseenroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h3>GAU E-Learning System</h3>
<h5>Students Home Page</h5>

<br />
<asp:Panel ID="Panel1" runat="server">
    
<div class="unit-80">
<hr />
<h2>You are currently not enrolled to this course</h2>
<p>Click the button to enroll</p>
    <asp:Button ID="btnEnroll" runat="server" Text="Enroll" CssClass="btn btn-big btn-green" OnClick="btnEnroll_Click"/>
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
</div>
</asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false">
    <div class="unit-80">
<hr />
   <h2>Your enrollment request has been sent to the lecturer</h2>
<p>You will have access when enrollment is approved</p>
    <asp:Button ID="Button1" runat="server" Text="Home Page" CssClass="btn btn-big btn-green" OnClick="btnHome"/>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</div>
    </asp:Panel>
</asp:Content>
