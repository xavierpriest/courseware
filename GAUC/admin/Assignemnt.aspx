<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignemnt.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Instructure ID<br />
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource4" DataTextField="id" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            SelectCommand="SELECT [id] FROM [lecturer]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            SelectCommand="SELECT [id] FROM [lecturer]"></asp:SqlDataSource>
        <br />
        Course ID<br />
        <asp:DropDownList ID="DropDownList2" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            SelectCommand="SELECT [id] FROM [course]"></asp:SqlDataSource>
        <br />
        Status<br />
        <asp:DropDownList ID="DropDownList3" runat="server" DataTextField="id" 
            DataValueField="id" onselectedindexchanged="DropDownList3_SelectedIndexChanged">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="lecturer_id,course_id" DataSourceID="SqlDataSource6" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="lecturer_id" HeaderText="lecturer_id" 
                    ReadOnly="True" SortExpression="lecturer_id" />
                <asp:BoundField DataField="course_id" HeaderText="course_id" ReadOnly="True" 
                    SortExpression="course_id" />
                <asp:CheckBoxField DataField="status" HeaderText="status" 
                    SortExpression="status" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            DeleteCommand="DELETE FROM [courselecturer] WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id" 
            SelectCommand="SELECT * FROM [courselecturer]" 
            UpdateCommand="UPDATE [courselecturer] SET [status] = @status WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id">
            <DeleteParameters>
                <asp:Parameter Name="lecturer_id" Type="Int32" />
                <asp:Parameter Name="course_id" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" Type="Boolean" />
                <asp:Parameter Name="lecturer_id" Type="Int32" />
                <asp:Parameter Name="course_id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            DeleteCommand="DELETE FROM [courselecturer] WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id" 
            InsertCommand="INSERT INTO [courselecturer] ([lecturer_id], [course_id], [status]) VALUES (@lecturer_id, @course_id, @status)" 
            SelectCommand="SELECT * FROM [courselecturer]" 
            UpdateCommand="UPDATE [courselecturer] SET [status] = @status WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id">
            <DeleteParameters>
                <asp:Parameter Name="lecturer_id" />
                <asp:Parameter Name="course_id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="lecturer_id" />
                <asp:Parameter Name="course_id" />
                <asp:Parameter Name="status" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" />
                <asp:Parameter Name="lecturer_id" />
                <asp:Parameter Name="course_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FINAL %>" 
            DeleteCommand="DELETE FROM [courselecturer] WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id" 
            InsertCommand="INSERT INTO [courselecturer] ([lecturer_id], [course_id], [status]) VALUES (@lecturer_id, @course_id, @status)" 
            SelectCommand="SELECT * FROM [courselecturer]" 
            
            UpdateCommand="UPDATE [courselecturer] SET [status] = @status WHERE [lecturer_id] = @lecturer_id AND [course_id] = @course_id">
            <DeleteParameters>
                <asp:Parameter Name="lecturer_id" Type="Int32" />
                <asp:Parameter Name="course_id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="lecturer_id" Type="Int32" />
                <asp:Parameter Name="course_id" Type="String" />
                <asp:Parameter Name="status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" Type="Boolean" />
                <asp:Parameter Name="lecturer_id" Type="Int32" />
                <asp:Parameter Name="course_id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
