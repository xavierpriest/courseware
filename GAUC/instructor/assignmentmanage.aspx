<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assignmentmanage.aspx.cs" Inherits="gau.assignmentmanage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        td, th
        {
            height: 25px;
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="margin-left: 120px">ASSIGNMENT MANAGEMENT</h1>
    </div>
    <div>        
        <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
            RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
            AutoGenerateColumns="false" Height="30px" Width="630px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" />
                <asp:BoundField DataField="user_id" HeaderText="User Name" />
                <asp:BoundField DataField="course_id" HeaderText="Course Name" />
                <asp:BoundField DataField="name" HeaderText="File Name" />
                <asp:BoundField DataField="date" HeaderText="Submit Date" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Home" />
    </div>
    </form>
</body>
</html>