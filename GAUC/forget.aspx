<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="WebApplication1.forget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 70%;
            margin-left: 138px;
            height: 183px;
        }
        .style2
        {
            text-align: center;
            width: 583px;
            margin-left: 103px;
        }
        .style3
        {
            width: 219px;
        }
        .style4
        {
            width: 219px;
            text-align: right;
        }
        .style6
        {
            width: 219px;
            text-align: right;
            font-size: medium;
        }
        .style7
        {
            width: 588px;
        }
        .style8
        {
            width: 219px;
            height: 27px;
        }
        .style9
        {
            width: 588px;
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style2">
        <strong>&nbsp;&nbsp;&nbsp;&nbsp; NEW</strong><strong style="font-size: large">&nbsp; PASSWORD PAGE</strong></div>
    <table class="style1">
        <tr>
            <td class="style4">
                <strong style="font-size: medium">Email</strong></td>
            <td class="style7">
                <asp:TextBox ID="TextBox1" runat="server" Height="23px" 
                    Width="155px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Please Enter E-Mail Address..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <strong>Question</strong></td>
            <td class="style7">
                <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="question" 
                    DataValueField="question" Height="23px" Width="155px">
                    <asp:ListItem>Select One...</asp:ListItem>
                    <asp:ListItem>Favorite Team</asp:ListItem>
                    <asp:ListItem>First Animal Name</asp:ListItem>
                    <asp:ListItem>First School Name</asp:ListItem>
                    <asp:ListItem>Grand Father Name</asp:ListItem>
                    <asp:ListItem>Best Friend Name</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DropDownList1" 
                    ErrorMessage="Please Select Secret Question..." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <strong>Answer</strong></td>
            <td class="style7">
                <asp:TextBox ID="TextBox2" runat="server" Height="23px" Width="155px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Please Enter Your Answer..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <strong>New Password</strong></td>
            <td class="style7">
                <asp:TextBox ID="TextBox3" runat="server" Height="23px" Width="155px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Please Enter New Password..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style7">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    style="font-size: medium; font-weight: 700" Text="Enter" Width="90px" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
