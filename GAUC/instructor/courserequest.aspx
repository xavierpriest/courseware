<%@ Page Title="" Language="C#" MasterPageFile="~/master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="courserequest.aspx.cs" Inherits="GAUC.Instructor.courserequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="unit-centered  unit-50">

<h3>GAU E-Learning System</h3>
<h5>Instructor Course Request</h5>

<p>
    <asp:Label ID="Label3" runat="server" Text="Course Code"></asp:Label>
    <asp:TextBox ID="txtCode" runat="server" CssClass="width-100"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
    <asp:DropDownList ID="listDepartment" runat="server" 
        DataSourceID="DepartmentSource" DataTextField="name" CssClass="width-100" 
        DataValueField="id" 
        onselectedindexchanged="listDepartment_SelectedIndexChanged">
    </asp:DropDownList>

    <asp:SqlDataSource ID="DepartmentSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
        SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>

</p>

<p>
    <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" CssClass="width-100"></asp:TextBox>
</p>

<p>
    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
    <asp:TextBox ID="txtDescription" runat="server" Rows="10" TextMode="MultiLine" CssClass="width-100"></asp:TextBox>
</p>
<p>
    <asp:Button ID="Button1" runat="server" Text="Request Course" 
        CssClass="btn btn-medium btn-green" onclick="Button1_Click"/>
    <asp:Button ID="Button2" runat="server" Text="Close" 
        CssClass="btn btn-medium btn-red" onclick="Button2_Click" />
    <asp:Label ID="lblMsg" runat="server" CssClass="color-green"></asp:Label>
</p>
</div>
</asp:Content>
