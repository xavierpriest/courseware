<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courseapproval.aspx.cs" Inherits="WebApplication1.courseapproval" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 438px;
            height: 126px;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 26px;
            width: 160px;
        }
        .style4
        {
            width: 160px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="left">
    
        <table align="center" bgcolor="#336699" class="style2">
            <tr>
                <td align="left" bgcolor="#3333FF" class="style2" 
                    
                    style="font-family: Arial, Helvetica, sans-serif; color: #000000; background-color: #FFFFFF;">
                    ADMIN PAGE</td>
            </tr>
        </table>
    
        <table class="style1" align=center>
            <tr>
                <td class="style2" 
                    
                    style="font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF; color: #000000">
                    Change</td>
                <td class="style3" 
                    
                    
                    style="font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF; color: #000000">
                    Status :
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="0">Pending</asp:ListItem>
                        <asp:ListItem Value="1">Accepted</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style2" 
                    
                    style="font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF; color: #000000">
                    course ID&nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSource12" DataTextField="id" DataValueField="id" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged1">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                        SelectCommand="SELECT [id], [name] FROM [course] WHERE ([status] = @status)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="status" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="CourseSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                        SelectCommand="SELECT [id] FROM [course] WHERE ([status] = @status)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="0" Name="status" 
                                PropertyName="SelectedValue" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                        SelectCommand="SELECT [id] FROM [course] WHERE ([status] = @status)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="status" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style4">
                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="Accept" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    <span style="font-family: Arial, Helvetica, sans-serif">Instructure ID</span></td>
                <td class="style4" style="font-family: Arial, Helvetica, sans-serif">
                    Quota</td>
                <td>
                    <em></em></td>
            </tr>
            <tr>
                <td>
                    <em>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource7" DataTextField="id" DataValueField="id">
                    </asp:DropDownList>
                    </em>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
                        SelectCommand="SELECT [id] FROM [lecturer]"></asp:SqlDataSource>
                </td>
                <td class="style4">
                    <em>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>80</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                    </asp:DropDownList>
                    </em>
                </td>
                <td>
                    <em>
                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click1" 
                        Text="Course Quota" Width="109px" />
                    </em>
                </td>
            </tr>
            </table>
    
        <p style="height: 21px; font-family: Arial, Helvetica, sans-serif; color: #000000; background-color: #FFFFFF; width: 471px; margin-left: 8px; font-weight: bold;" 
            align="left">
            &nbsp;Pending</p>
    
    </div>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="Pending" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource9" CellPadding="4" ForeColor="#333333" 
            GridLines="None" style="margin-top: 0px" 
            onselectedindexchanged="Pending_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="department_id" HeaderText="department_id" 
                    SortExpression="department_id" />
                <asp:BoundField DataField="description" HeaderText="description" 
                    SortExpression="description" />
                <asp:CheckBoxField DataField="status" HeaderText="status" 
                    SortExpression="status" />
                <asp:BoundField DataField="enroll_type" HeaderText="enroll_type" 
                    SortExpression="enroll_type" />
                <asp:BoundField DataField="enroll_owner" HeaderText="enroll_owner" 
                    SortExpression="enroll_owner" />
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
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [course] WHERE ([status] = @status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="status" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p align="left" 
        
        
        style="font-family: Arial, Helvetica, sans-serif; color: #000000; background-color: #FFFFFF; width: 483px; font-weight: bold;">
        &nbsp; 
        Accepted</p>
    <p>
        <asp:GridView ID="Accept" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource6" AllowPaging="True" 
            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="department_id" HeaderText="department_id" 
                    SortExpression="department_id" />
                <asp:BoundField DataField="description" HeaderText="description" 
                    SortExpression="description" />
                <asp:CheckBoxField DataField="status" HeaderText="status" 
                    SortExpression="status" />
                <asp:BoundField DataField="enroll_type" HeaderText="enroll_type" 
                    SortExpression="enroll_type" />
                <asp:BoundField DataField="enroll_owner" HeaderText="enroll_owner" 
                    SortExpression="enroll_owner" />
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
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [course] WHERE ([status] = @status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="status" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [course]">
        </asp:SqlDataSource>
    </p>
    <p align="left" 
        
        
        style="font-family: Arial, Helvetica, sans-serif; color: #000000; background-color: #FFFFFF; width: 480px; font-weight: bold;">
        &nbsp;Lecture details - You can edit or delete Lecture</p>
    <p style="font-family: Arial, Helvetica, sans-serif; color: #000000; font-weight: bold">
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" CellPadding="2" 
            DataKeyNames="id" DataSourceID="SqlDataSource10" Font-Bold="False" 
            ForeColor="Black" GridLines="None" Width="508px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name_surname" HeaderText="name_surname" 
                    SortExpression="name_surname" />
                <asp:BoundField DataField="email" HeaderText="email" 
                    SortExpression="email" />
                <asp:BoundField DataField="department_id" HeaderText="department_id" 
                    SortExpression="department_id" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="title" HeaderText="title" 
                    SortExpression="title" />
                <asp:CheckBoxField DataField="status" HeaderText="status" 
                    SortExpression="status" />
                <asp:BoundField DataField="quotaid" HeaderText="quotaid" 
                    SortExpression="quotaid" />
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
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            DeleteCommand="DELETE FROM lecturer" 
            SelectCommand="SELECT [id], [name_surname], [email], [department_id], [country], [title], [status], [quotaid] FROM [lecturer]" 
            UpdateCommand="UPDATE lecturer SET"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            
            
            SelectCommand="SELECT [name_surname], [email], [department_id], [country], [title], [quotaid] FROM [lecturer]">
        </asp:SqlDataSource>
        </p>
    <p style="font-family: Arial, Helvetica, sans-serif; color: #000000; font-weight: bold;">
        Quota</p>
    <p>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource11" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="name_surname" HeaderText="name_surname" 
                    SortExpression="name_surname" />
                <asp:BoundField DataField="assign" HeaderText="assign" 
                    SortExpression="assign" />
                <asp:BoundField DataField="used" HeaderText="used" SortExpression="used" />
                <asp:BoundField DataField="remain" HeaderText="remain" 
                    SortExpression="remain" ReadOnly="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            DeleteCommand="DELETE FROM [quota] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [quota] ([assign], [used], [remain]) VALUES (@assign, @used, @remain)" 
            SelectCommand="SELECT lecturer.name_surname, quota.assign, quota.used, quota.remain FROM lecturer INNER JOIN quota ON lecturer.quotaid = quota.id" 
            
            UpdateCommand="UPDATE [quota] SET [assign] = @assign, [used] = @used, [remain] = @remain WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="assign" />
                <asp:Parameter Name="used" />
                <asp:Parameter Name="remain" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="assign" />
                <asp:Parameter Name="used" />
                <asp:Parameter Name="remain" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [quota]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [course] WHERE ([status] = @status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [course]">
        </asp:SqlDataSource>
    </p>
    </form>
</body>
</html>
