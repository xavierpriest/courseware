<%@ Page Language="C#" MasterPageFile="~/master/One.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GAUC.Instructor.Instructor" Title="Instructor's Homepage" %>

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
    <h4>Instructor Home Page</h4>
    </div>
    <hr />

    <div id="tabs" class="nav-tabs" style="margin:0 auto;  margin-bottom:2px;">
  
    <ul>
        <li><a href="#courses" class="active">View Courses</a></li>
        <li><a href="#uploads">Uploads</a></li>
        <li><a href="#enrollments">Enrolled Students</a></li>
        <li><a href="#videos">My Videos</a></li>
        <li><a href="#personalinfo">Personal Info</a></li>
        <li><a href="#homework">Homework Submissions</a></li>
    </ul>
</div>
    <div id="courses">
    <h5>View Courses</h5>
        <asp:GridView ID="gridCourses" runat="server" AllowSorting="True" 
            onselectedindexchanged="gridCourses_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnCourse" runat="server" Text="New Course Request" 
            CssClass="btn btn-medium btn-blue" onclick="btnCourse_Click" />
            <hr />
        <h5>Enrollment Settings</h5>
        <asp:Label ID="enrollMsg" runat="server" Text="" Visible="true"></asp:Label>
        <asp:Panel ID="enrollPanel" runat="server" Visible="false">
        
            <asp:RadioButtonList ID="enrollList" runat="server">
                <asp:ListItem Selected="True" Value="0">None</asp:ListItem>
                <asp:ListItem Value="1">Automatic</asp:ListItem>
                <asp:ListItem Value="2">Manual</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="btnSaveEnroll" runat="server" Text="Save Enrollment" 
                CssClass="btn btn-blue" onclick="btnSaveEnroll_Click"/>
        </asp:Panel>
    </div>
    <div id="uploads">
    <h5>My Uploads</h5>
        <asp:GridView ID="gridUploads" runat="server">
            <Columns>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/del.png" 
                    ShowDeleteButton="True" />
            </Columns>
            <EmptyDataTemplate>
                No uploads added
            </EmptyDataTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="Medium" />
        </asp:GridView>
        <asp:Button ID="btnUpload" runat="server" Text="Upload New Item" 
            CssClass="btn btn-medium btn-blue" onclick="btnUpload_Click" />
    </div>
    <div id="enrollments">
    <h5>Enrolled Students</h5>
        <asp:GridView ID="gridStudents" runat="server">
        </asp:GridView>

    </div>
    <div id="personalinfo">
    <h5>View Personal Info</h5>
    
        <asp:DetailsView ID="detailsInfo" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <asp:Button ID="btnInfo" runat="server" Text="Edit Personal Info" 
            CssClass="btn btn-medium btn-blue" onclick="btnInfo_Click" />
    </div>
    <div id="videos">
    <h5>My Videos</h5>
        <asp:GridView ID="gridVideos" runat="server">
        </asp:GridView>
        <asp:Button ID="btnAddVideo" runat="server" Text="Upload New Video" 
            CssClass="btn btn-medium btn-blue" onclick="btnAddVideo_Click"/>
    </div>
    <div id="homework">
    <h5>Homework Submissions</h5>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:Button ID="btnHw" runat="server" Text="Create A New Homework" 
            CssClass="btn btn-medium btn-blue" onclick="btnHw_Click"/>
    </div>
 
   <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
    
</asp:Content>
