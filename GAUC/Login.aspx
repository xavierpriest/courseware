<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 84%;
            margin-left: 129px;
            margin-bottom: 57px;
        }
        .style3
        {
            width: 188px;
            font-weight: bold;
            font-size: large;
            height: 30px;
            text-align: right;
        }
        .style4
        {
            font-size: xx-large;
        }
        .style5
        {
            text-align: center;
            width: 598px;
            margin-left: 131px;
        }
        .style6
        {
            width: 188px;
            font-weight: bold;
            font-size: large;
            text-align: right;
            height: 26px;
        }
        .style7
        {
            height: 26px;
            width: 450px;
            text-align: justify;
        }
        .style9
        {
            height: 30px;
            width: 450px;
            text-align: justify;
        }
        .style10
        {
            width: 188px;
            text-align: center;
            height: 21px;
        }
        .style11
        {
            height: 21px;
            width: 450px;
        }
        .style12
        {
            width: 188px;
        }
        </style>
</head>
<body style="height: 232px">
    <form id="form1" runat="server">
    <div>
    
        <div class="style5">
            <strong><span class="style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOGIN</span></strong></div>
        <table class="style1">
            <tr>
                <td class="style6">
                    &nbsp;Email</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox1" runat="server" Width="155px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Password</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox2" runat="server" Width="155px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10">
                </td>
                <td class="style11">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" 
                        style="font-weight: 700; font-size: medium" Width="90px" />
                </td>
            </tr>
        
            <tr>
            <td class="style12"></td>
             <td>
                 <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="Register" 
                     Width="90px" style="font-weight: 700; font-size: medium" />
                </td>
               
             

                  
            </tr>
             <tr>
            <td class="style12"></td>
                
             <td>
                
                 <asp:Button ID="Button6" runat="server" Text="Forgot" Width="90px" 
                     onclick="Button6_Click" style="font-weight: 700; font-size: medium" />
                
                </td>       
                                           
            </tr>
        </table>
         
    
    </div>
    </form>
</body>
</html>
