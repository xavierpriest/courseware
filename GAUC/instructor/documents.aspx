﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="documents.aspx.cs" Inherits="WebApplication1.documents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            width: 208px;
            height: 29px;
        }
        .style4
        {
            width: 213px;
            height: 29px;
        }
        .style5
        {
            width: 208px;
            height: 34px;
        }
        .style6
        {
            width: 213px;
            height: 34px;
        }
        .style7
        {
            width: 208px;
            height: 38px;
        }
        .style8
        {
            width: 213px;
            height: 38px;
        }
        .style9
        {
            width: 208px;
            height: 31px;
        }
        .style10
        {
            width: 213px;
            height: 31px;
        }
        .style11
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VIDEO UPLOAD</h1>
    <table>
    <tr>
    <td class="style3">
        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
        </td>
    <td class="style4">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>

    <tr>
    <td class="style5">
        <asp:Label ID="Label2" runat="server" Text="Path"></asp:Label>
        </td>
    <td class="style6">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" ControlToValidate="FileUpload1" ErrorMessage="Please select MP4 file" Display="Dynamic" ValidationExpression="^.+\.((mp4))$"></asp:RegularExpressionValidator>
        </td>
    </tr>

    <tr>
    <td class="style7">
        <asp:Label ID="Label3" runat="server" Text="Course "></asp:Label>
        </td>
    <td class="style8">
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT [id] FROM [course] ORDER BY [id]"></asp:SqlDataSource>
        </td>
    </tr>

    <tr>
    <td class="style9">
        <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
        </td>
    <td class="style10">
        <asp:Label ID="Label6" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
    <td class="style11">Description&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
    <td class="style11">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>

    <tr>
    <td class="style5">
        <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
        </td>
    <td class="style6">
        <asp:CheckBox ID="CheckBox1" runat="server" />
        </td>
    </tr>


    <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="List" 
            Width="48px" />
        <asp:Label ID="lblSonuc" runat="server"></asp:Label>
        </td>
  
    </tr>

    </table>
    
    </div>
    </form>
</body>
</html>
