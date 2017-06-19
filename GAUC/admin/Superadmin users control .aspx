<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Superadmin users control .aspx.cs" Inherits="WebApplication1.Superadmin_users_control" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        


        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="style2">
            <strong><span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span><span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SUPERADMIN USERS CONTROL PAGE</span><span class="style1"><br />
            </span></strong>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name_surname" HeaderText="name_surname" 
                            SortExpression="name_surname" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="department_id" HeaderText="department_id" 
                            SortExpression="department_id" />
                        <asp:BoundField DataField="country" HeaderText="country" 
                            SortExpression="country" />
                        <asp:BoundField DataField="password" HeaderText="password" 
                            SortExpression="password" />
                        <asp:BoundField DataField="question" HeaderText="question" 
                            SortExpression="question" />
                        <asp:BoundField DataField="answer" HeaderText="answer" 
                            SortExpression="answer" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                    DeleteCommand="DELETE FROM [users] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [users] ([name_surname], [email], [department_id], [country], [password], [question], [answer], [status]) VALUES (@name_surname, @email, @department_id, @country, @password, @question, @answer, @status)" 
                    SelectCommand="SELECT * FROM [users]" 
                    
                    
            
            
            UpdateCommand="UPDATE [users] SET [name_surname] = @name_surname, [email] = @email, [department_id] = @department_id, [country] = @country, [password] = @password, [question] = @question, [answer] = @answer, [status] = @status WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name_surname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="department_id" Type="Int32" />
                        <asp:Parameter Name="country" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="question" Type="String" />
                        <asp:Parameter Name="answer" Type="String" />
                        <asp:Parameter Name="status" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name_surname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="department_id" Type="Int32" />
                        <asp:Parameter Name="country" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="question" Type="String" />
                        <asp:Parameter Name="answer" Type="String" />
                        <asp:Parameter Name="status" Type="Boolean" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
