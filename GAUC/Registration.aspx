<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication1.Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-bottom: 17px;
        }
        .style2
        {
            width: 160px;
            text-align: right;
            font-weight: bold;
        }
        .style3
        {
            width: 177px;
        }
        #Reset1
        {
            width: 115px;
            height: 34px;
            font-weight: 700;
            font-size: medium;
        }
        .style4
        {
            text-align: justify;
        }
        .style5
        {
            font-size: xx-large;
        }
    </style>
</head>
<body style="width: 746px; margin-left: 253px; margin-right: 307px">
    <form id="form1" runat="server">
    <div class="style4" style="font-weight: 700; font-size: x-large">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style5"> 
        Registration Page</span></div>
    <table class="style1">
        <tr>
            <td class="style2">
                User Name&amp;Surname</td>
            <td class="style3">
                <asp:TextBox ID="TextBoxUN" runat="server" MaxLength="50" Width="180px" 
                    Height="25px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxUN" 
                    ErrorMessage="Please Enter User Name and Surname..." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Department</td>
            <td class="style3">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DEPTSOURCE" 
                    DataTextField="name" DataValueField="id" Height="25px" Width="180px">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>Computer Engineering</asp:ListItem>
                    <asp:ListItem>Industrial Engineering</asp:ListItem>
                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                    <asp:ListItem>Software Engineering</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DEPTSOURCE" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                    SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="DropDownList3" 
                    ErrorMessage="Please Select Your Department.." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                E-Mail Address</td>
            <td class="style3">
                <asp:TextBox ID="TextBoxEA" runat="server" MaxLength="30" Width="180px" 
                    Height="25px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBoxEA" ErrorMessage="Please Enter E-Mail Address..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBoxEA" 
                    ErrorMessage="Please Enter Valid E-Mail Address..." ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Country</td>
            <td class="style3">
                <asp:DropDownList ID="DropDownCountry" runat="server" Height="25px" 
                    Width="191px">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                    <asp:ListItem>UK</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>England</asp:ListItem>
                    <asp:ListItem>France</asp:ListItem>
                    <asp:ListItem>Russia</asp:ListItem>
                    <asp:ListItem>Aberdeen</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="DropDownCountry" 
                    ErrorMessage="Please Select Your Country..." ForeColor="Red" 
                    InitialValue="Select One"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Password</td>
            <td class="style3">
                <asp:TextBox ID="TextBoxPass" runat="server" MaxLength="30" TextMode="Password" 
                    Width="180px" Height="25px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBoxPass" ErrorMessage="Please Enter Your Password..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Question</td>
            <td class="style3">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="187px">
                    <asp:ListItem>Select One...</asp:ListItem>
                    <asp:ListItem>Favorite Team</asp:ListItem>
                    <asp:ListItem>First Animal Name</asp:ListItem>
                    <asp:ListItem>First School Name</asp:ListItem>
                    <asp:ListItem>Grand Father Name</asp:ListItem>
                    <asp:ListItem>Best Friend Name</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList2" ErrorMessage="Please Select Secret Question..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Answer</td>
            <td class="style3">
                <asp:TextBox ID="TextBoxA" runat="server" MaxLength="30" Width="180px" 
                    Height="25px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBoxA" ErrorMessage="Please Enter Secret Answer..." 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Submit" runat="server" Height="34px" onclick="Submit_Click" 
                    style="font-weight: 700; font-size: medium" Text="Submit" Width="112px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
