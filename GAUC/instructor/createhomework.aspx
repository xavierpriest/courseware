<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="createhomework.aspx.cs" Inherits="GAUC.instructor.createhomework" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="units-row unit-80">
    <h1>GAU E-learning System</h1>
    <h4>Create Homework</h4>
    </div>
    <div class="unit-80">
    <hr />
    <div class="unit-50">
    <p>
        <asp:Label ID="Label3" runat="server" Text="Select Course" CssClass="unit-80"></asp:Label><br />
        <asp:DropDownList CssClass="unit-60" ID="drpCourse" runat="server" DataSourceID="CourseSource" 
            DataTextField="name" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="CourseSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT course.id, course.name FROM course INNER JOIN courselecturer ON course.id = courselecturer.course_id WHERE (courselecturer.lecturer_id = @id) AND (courselecturer.status = 1) AND (course.status = 1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Titile"></asp:Label><br />
        <asp:TextBox ID="txtTitle" runat="server" CssClass="unit-60"></asp:TextBox>
        
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" > </ajaxToolkit:ToolkitScriptManager>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label><br />
        <asp:TextBox ID="txtDescription" runat="server" CssClass="unit-60" TextMode="MultiLine"></asp:TextBox>
    </p>
     <p>
        <asp:Label ID="Label4" runat="server" Text="Starting Date"></asp:Label><br />
        <asp:TextBox
            ID="txtStart" runat="server" ontextchanged="TextBox1_TextChanged" CssClass="unit-60"
             Font-Strikeout="False"></asp:TextBox>
         <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
             Enabled="True" TargetControlID="txtStart">
         </ajaxToolkit:CalendarExtender>
    </p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Due Date"></asp:Label><br />
        <asp:TextBox
            ID="txtDue" runat="server" ontextchanged="TextBox1_TextChanged" CssClass="unit-60" ></asp:TextBox>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
             Enabled="True" TargetControlID="txtDue">
         </ajaxToolkit:CalendarExtender>
    </p>
    <p>
        <asp:CheckBox ID="chkStatus" runat="server" Checked="True" Text="Active" CssClass="unit-50"/>
    </p>
    <p>
    <asp:Button ID="btnSubmit" runat="server" Text="Create Homework" 
            CssClass="btn btn-medium btn-green" onclick="btnSubmit_Click"/></p>
</div>
</div>
</asp:Content>
