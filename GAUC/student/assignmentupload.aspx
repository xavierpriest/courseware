<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assignmentupload.aspx.cs" Inherits="gau.assignmentupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 236px;
        }
        .style2
        {
            width: 301px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>ASSIGNMENT UPLOAD</h1>
    </div>
    <div>
    <table style="height: 219px; width: 483px">
    <tr>
    <td class="style1">Select File&nbsp;&nbsp; :</td>
    <td class="style2">

        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" ControlToValidate="FileUpload1" ErrorMessage="Please select Pdf,txt or Word file" Display="Dynamic" ValidationExpression="^.+\.((docx)|(pdf)|(txt)|(doc))$"></asp:RegularExpressionValidator>

    </td>
    </tr>

    <tr>
    
    <td class="style2">
        
    </td>
    </tr>

    <tr>
    <td class="style1">Date</td>
    <td class="style2">
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </td>
    </tr>

    <tr>
    <td class="style1">Course Name</td>
    <td class="style2">
        <p><%=cid %></p>
    </td>
    </tr>

    <tr>
    <td></td>
    <td>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" />
        </td>
    </tr>

    <tr>
    <td>
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Management" />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Home" />
        </td>
    <td>
    
        <asp:Label ID="Label2" runat="server"></asp:Label>
    
    </td>
    </tr>

    </table>
    
    </div>
    </form>
</body>
</html>
