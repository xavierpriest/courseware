<%@ Page Language="C#" Title="Instructor List"  MasterPageFile="~/master/One.Master" AutoEventWireup="true" CodeBehind="instructors.aspx.cs" Inherits="GAUC.Admin.Instructors" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $('#tabs').tabs({
                activate: function () {
                    var newIdx = $('#tabs').tabs('option', 'active');
                    $('#<%=hidLastTab.ClientID%>').val(newIdx);

                }, heightStyle: "auto",
                active: previouslySelectedTab,
                show: { effect: "fadeIn", duration: 1000 }
            });

        });
 </script>
    
    </asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
    <h1>GAU E-learning System</h1>
    <h4>Instructor Administration</h4>
    </div>
    <hr />
    <div class="units-row unit-100">
    <div class="unit-push-right unit-50 ">
    <div class="nav-tabs">
    <ul>
     <li>   <asp:Button ID="Button2" runat="server" Text="Create Instructor Account" 
            CssClass="btn" onclick="Button2_Click" /></li>
           <li> </li>
            <li> 
                <asp:Button ID="btnUser" runat="server" Text="User Management" 
            CssClass="btn" onclick="btnUser_Click" /></li>
            <li>
                <asp:Button ID="Button3" runat="server" Text="Course Approval" CssClass="btn" 
                    onclick="Button3_Click" />
            </li>
            </ul>
        
            </div>
    </div>
    <div class="unit-push-30 unit-20">Welcome, Admin</div>
    </div>
    <div class="unit-100">
    <hr />
    </div>
    <div class="unit-centered unit-100">
        <asp:Button ID="Button1" runat="server" Text="Load All" 
            onclick="Button1_Click" CssClass="btn btn-blue btn-small" />
        <asp:Label ID="Label1" runat="server" Text="Sort By Department:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
            DataSourceID="DSource" DataTextField="name" DataValueField="id" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
            >
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="DSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="DepartmentSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GAUCoursewareConnectionString %>" 
            SelectCommand="SELECT [id], [name] FROM [department]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CssClass="table-hovered"
            onselectedindexchanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" 
            EnablePersistedSelection="True" Width="514px" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowdeleting="GridView1_RowDeleting">
        <Columns>
            <asp:CommandField ShowSelectButton="True" HeaderText="Select"  />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/delete.png" 
                ShowDeleteButton="True" />
  </Columns> 
  
        <HeaderStyle Font-Bold="True" />
  
    </asp:GridView>
        <asp:Label ID="lblMsg" runat="server" CssClass="color-green"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetByDepartment" TypeName="GAUC.Admin.InstructorFuncs">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="dep_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    </div>
    <h5>Instructor Details</h5>
    
    <hr />

    <div id="tabs" class="nav-tabs" style="margin:0 auto;  margin-bottom:2px;">
  
    <ul>
        <li><a href="#tab22" class="active">Personal Details</a></li>
        <li><a href="#tab11" >Course Assignments</a></li>
        <li><a href="#tab33">Space Allocation</a></li>
        <li><a href="#tab44">Account Management</a></li>
    </ul>
</div>
<hr />
    <div id="tab11">
    
        <asp:GridView ID="GridView2" runat="server" CssClass="table-hovered">
        </asp:GridView>
        <asp:Button ID="btnCourseAssignment" runat="server" Text="Edit Course Assignment" CssClass="btn btn-small btn-blue" />
    </div>
    <div id="tab22" class="content active">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <asp:ObjectDataSource ID="PersonalDetailsSource" runat="server">
        </asp:ObjectDataSource>
        <asp:Button ID="btnEditDetails" runat="server" Text="Edit Personal Details" 
            CssClass="btn btn-small btn-blue" onclick="btnEditDetails_Click" />
    </div>
    <div id="tab33" class="content">
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <asp:Button ID="btnEditQuota" runat="server" Text="Edit Space Quota" CssClass="btn btn-small btn-blue" />
    </div>
    <div id="tab44" class="content">
    <p>
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        </p>
        <asp:Button ID="btnActivate" runat="server" Text="" CssClass="" 
            onclick="btnActivate_Click" />
        <asp:Button ID="btnBackUp" runat="server" Text="Backup Instructor Details" 
            CssClass="btn btn-green" onclick="btnBackUp_Click" />
    </div>

    <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
    
</asp:Content>


