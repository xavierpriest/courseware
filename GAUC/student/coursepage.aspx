<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="coursepage.aspx.cs" Inherits="GAUC.student.coursepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h3>GAU E-Learning System</h3>


<div class="unit-80">
    <h3><%= id %></h3>
    <h5><%= name %></h5>
    <hr />
</div>

    <div id="tabs" class="nav-tabs unit-80 ">
  
    <ul>
        <li><a href="#annoucements" class="active">Announcements</a></li>
        <li><a href="#materials">Course Materials</a></li>
        <li><a href="#videos">Videos</a></li>
        <li><a href="#homework">Homework</a></li>
        <li><a href="#unenroll">Unenroll</a></li>
    </ul>
    </div>
    <div class="content" id="materials">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="UploadSource">
            <AlternatingItemTemplate>
                <asp:Label ID="titleLabel"  CssClass="bold" runat="server" Text='<%# Eval("title") %>' />
                <br />
                Added on:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /><br />

                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="DownloadFile">Download</asp:LinkButton>
                <br />
<hr /></span>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            
            <ItemTemplate>
               <asp:Label ID="titleLabel"  CssClass="bold" runat="server" Text='<%# Eval("title") %>' />
                <br />
                Added on:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /><br />

                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="DownloadFile" CommandArgument='<%# Eval("id") %>'>Download</asp:LinkButton>
                <hr />
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="UploadSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT [title], [name], [date], [id] FROM [upload] WHERE (([status] = @status) AND ([course_id] = @course_id))">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="status" Type="Boolean" />
                <asp:SessionParameter Name="course_id" SessionField="CID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="content unit-80" id="annoucements">
    
    </div>
    <div id="homework" class="content unit-80">
    <h5>The following homeworks are active</h5>
    <p class="subheader">Click link to submit homework.</p>
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
            DataSourceID="HomeworkSource">
             <AlternatingItemTemplate>
                <span style="">
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' CssClass="bold" />
                <br />
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' />
                <br />
               
                Submit before:
                <asp:Label ID="duedateLabel" runat="server" Text='<%# Eval("duedate") %>' />
                <br />
                 <a href="assignmentupload.aspx?HID=<%# Eval("id") %>&CID=<%# Eval("course_id") %>&SID=<%=student_id %>">Upload</a>
               <hr />
</span>
            </AlternatingItemTemplate>
           
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <span style="">
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'  CssClass="bold"/>
                <br />
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' CssClass="small" />
                <br />
               
                Submit before:
                <asp:Label ID="duedateLabel" runat="server" Text='<%# Eval("duedate") %>' />
                <br />
                    <a href="assignmentupload.aspx?HID=<%# Eval("id") %>&CID=<%# Eval("course_id") %>&SID=<%=student_id %>">Upload</a>
               <hr />
</span>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="HomeworkSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            
            SelectCommand="SELECT id, title, description, startdate, duedate, course_id FROM homework WHERE (status = @status) AND (course_id = @cid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="status" Type="Boolean" />
                <asp:QueryStringParameter DefaultValue="" Name="cid" QueryStringField="CID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="content unit-80" id="unenroll">
    <h3>You are currently enrolled in this course</h3>
    <h6>Click the button below to Unenroll</h6>
    <p class="subheader">You'll not have access to the course page and materials.</p>

        <asp:Button ID="btnUnenroll" runat="server" Text="Unenroll" 
            CssClass="btn btn-big btn-red" onclick="btnUnenroll_Click"/>
    </div>

    <div id="videos" class="content unit-80">
        <asp:ListView ID="videoList" runat="server" DataKeyNames="id" 
            DataSourceID="VideoSource">
            <AlternatingItemTemplate>
       <span style="">
                <br />
                <asp:Label ID="titleLabel" runat="server" CssClass="bold" Text='<%# Eval("title") %>' /><br />
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' />
                <br />
                <asp:Label ID="viewsLabel" runat="server" Text='<%# Eval("views") %>' /> Views
                <br />
                <p class="small"> Added On:
                <asp:Label ID="submit_dateLabel" runat="server" 
                    Text='<%# Eval("submit_date") %>' />
                <br /></p>
                <a href="videoplayer.aspx?v=<%# Eval("id") %>">Watch this video</a>
<br /><hr /></span>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <span>No videos for this Course</span>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <span style="">
                <br />
                <asp:Label ID="titleLabel" runat="server" CssClass="bold" Text='<%# Eval("title") %>' /><br />
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("description") %>' />
                <br />
                <asp:Label ID="viewsLabel" runat="server" Text='<%# Eval("views") %>' /> Views
                <br />
                <p class="small"> Added On:
                <asp:Label ID="submit_dateLabel" runat="server" 
                    Text='<%# Eval("submit_date") %>' />
                <br /></p>
                <a href="videoplayer.aspx?v=<%# Eval("id") %>">Watch this video</a>
<br /></span><hr />
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
               
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="VideoSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
            SelectCommand="SELECT * FROM [videos] WHERE ([course_id] = @course_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="course_id" QueryStringField="CID" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
    
 <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
</asp:Content>
