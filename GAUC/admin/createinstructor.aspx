<%@ Page Language="C#" Title="Create Instructor Account" MasterPageFile="~/master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="createinstructor.aspx.cs" Inherits="GAUC.Admin.CreateInstructor" %>


   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <div class=" unit-50 unit-centered">
    <h3>Create an Instructor Account</h3>
    <h5>Personal Details</h5>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Full Name"> </asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="width-100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtName" CssClass="color-red" ErrorMessage="*Required" 
            Font-Size="XX-Small"></asp:RequiredFieldValidator>
     </p>  
     <p>  
        <asp:Label ID="Label2" runat="server" Text="Email">
        </asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="width-100"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
             ControlToValidate="txtEmail" CssClass="color-red" 
             ErrorMessage="*Enter a valid email" Font-Size="XX-Small" 
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </p>
        <p>
        <asp:Label ID="Label3" runat="server" Text="Title">
            
        </asp:Label><asp:TextBox ID="txtTitle" runat="server" CssClass="width-100"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label4" runat="server" Text="Password">
            
        </asp:Label><asp:TextBox ID="txtPassword" runat="server" CssClass="width-100" 
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtName" CssClass="color-red" ErrorMessage="*Required" 
                Font-Size="XX-Small"></asp:RequiredFieldValidator>
        </p>
        <p>
        <asp:Label ID="Label5" runat="server" Text="Confirm">
            
        </asp:Label><asp:TextBox ID="txtConfirmPassword" runat="server" 
                CssClass="width-100" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                CssClass="color-red" ErrorMessage="*Passwords do not match" 
                Font-Size="XX-Small"></asp:CompareValidator>
        </p>
        <p>
         <asp:Label ID="Label7" runat="server" Text="Department  ">
        </asp:Label>
        
        
         <asp:DropDownList ID="listDepartment" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" CssClass="width-100">
            </asp:DropDownList > 
       </p>
       <p>
        <asp:Label ID="Label6" runat="server" Text="Country  ">
            </asp:Label>
            
            <asp:DropDownList ID="listCountry" runat="server" CssClass="width-100">
                <asp:ListItem>Nigeria</asp:ListItem>
                <asp:ListItem>Turkey</asp:ListItem>
                <asp:ListItem>Australia</asp:ListItem>
                <asp:ListItem>Austria</asp:ListItem>
                <asp:ListItem>Canada</asp:ListItem>
                <asp:ListItem>United States</asp:ListItem>
                <asp:ListItem>United Kingdom</asp:ListItem>
                <asp:ListItem>Belgium</asp:ListItem>
                <asp:ListItem>Cyprus</asp:ListItem>
                <asp:ListItem>Egypt</asp:ListItem>
                <asp:ListItem>France</asp:ListItem>
                <asp:ListItem>Finland</asp:ListItem>
                <asp:ListItem>Ireland</asp:ListItem>
                <asp:ListItem>Iceland</asp:ListItem>
            </asp:DropDownList> 
        </p>
        <h5>Course Assignment</h5>
        <p>
        <asp:Label ID="Label9" runat="server" Text="Select Courses">
        </asp:Label>
            <asp:ListBox ID="ListBox1" runat="server" CssClass="width-100" 
                DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"></asp:ListBox>
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GAUCoursewareConnectionString %>" 
            SelectCommand="SELECT [name], [id] FROM [course]"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetCourses" TypeName="GAUC.Admin.InstructorFuncs">
        </asp:ObjectDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
        SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>

    
    <h5>Space Allocation</h5>
    <p>
        <asp:Label ID="Label8" runat="server" Text="Enter Size in MB"></asp:Label>
        <asp:TextBox ID="txtQouta" runat="server" CssClass="width-100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtQouta" CssClass="color-orange" ErrorMessage="*Required" 
            Font-Size="XX-Small"></asp:RequiredFieldValidator>
        </p>
    
   <p>
    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" CssClass="btn btn-green" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click" CssClass="btn btn-red" />
    </p>
    <p>
    <asp:Label ID="lblMsg" runat="server" CssClass="color-green"></asp:Label>
    </p>
    </div>
   
   </asp:Content>

