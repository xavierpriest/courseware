<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUpload.aspx.cs" Inherits="gau.ManageUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 215px; width: 1055px">
  
    <form id="form1" runat="server">
    <div>
    <h1 style="margin-left: 320px">&nbsp;&nbsp; UPLOAD MANAGEMENT</h1>
    </div>
    <div>
        
        <asp:GridView ID="GridView1" runat="server" Width="400px" HorizontalAlign="Center"
            AutoGenerateColumns="False" DataKeyNames="id" 
            ShowFooter="True" onrowdeleting="GridView1_RowDeleting" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
            CellSpacing="1" GridLines="None" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="#" />
               
                <asp:BoundField DataField="name" HeaderText="Document Name" />
                
              
                
              
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Home" Font-Bold="True" 
            onclick="Button1_Click" />
    </div>
    
    </form>
        
    </body>
</html>
