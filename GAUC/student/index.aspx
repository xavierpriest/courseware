<%@ Page Title="" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GAUC.student.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
     $(document).ready(function () {

         $('#tabs').tabs({
             activate: function () {
                 var newIdx = $('#nav-tabs').tabs('option', 'active');
                 $('#<%=hidLastTab.ClientID%>').val(newIdx);

             }, heightStyle: "auto",
             active: previouslySelectedTab,
             show: { effect: "fadeIn", duration: 1000 }
         });

     });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>GAU E-Learning System</h2>
<h5>Students Home Page</h5>
<div class="unit-30 unit-push-right">
<p class="bold">Welcome, <%=username %></p>
</div>
<br />
<div class="units-row-end">

    <div id="tabs" class="nav-tabs unit-80 " style="margin:0 auto;  margin-bottom:2px;">
  
    <ul>
        <li><a href="#viewcourses" class="active"> View Courses</a></li>
        <li><a href="#mycourses">My Courses</a></li>
        <li><a href="#profile">My Profile Page</a></li>
        <li><a href="#settings">Account Settings</a></li>
    </ul>
</div>
       <div id="viewcourses" class="content unit-80">
       <br />
       <h5>Department Course List</h5>
       <br />
           <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
               DataKeyNames="id">
               <AlternatingItemTemplate>
                   <a href="coursepage.aspx?CID=<%# Eval("id") %>&amp;SID=<%=studentID %>">
               <li class="unit-80">
                  <h6><%# Eval("id") %> - <%# Eval("name") %></h6>                   
                       <p><%# Eval("description") %></p>
                       <hr />
                   
               </li></a>
               </AlternatingItemTemplate>
              
               <EmptyDataTemplate>
                   <span>No data was returned.</span>
               </EmptyDataTemplate>
              
               
           <ItemTemplate>
               
               <a href="coursepage.aspx?CID=<%# Eval("id") %>&amp;SID=<%=studentID %>">
               <li class="unit-80 clear">
                  <h6><%# Eval("id") %> - <%# Eval("name") %></h6>                   
                       <p><%# Eval("description") %></p>
                       <hr />
                   
               </li></a>
           </ItemTemplate>
               <LayoutTemplate>
                   <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
               </LayoutTemplate>
              
           </asp:ListView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
               
               
               SelectCommand="SELECT id, name, description FROM course WHERE (department_id = @department_id) AND (status = 1)">
               <SelectParameters>
                   <asp:SessionParameter DefaultValue="1" Name="department_id" 
                       SessionField="DepID" Type="Int32" />
               </SelectParameters>
           </asp:SqlDataSource>
       </div>
       
       <div id="mycourses" class="content unit-80">
       <br />
       <h5>My Enrolled Courses</h5>
       <br />
           <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
               DataSourceID="EnrolledSource">
               <AlternatingItemTemplate>
                   <span> <a href="coursepage.aspx?CID=<%# Eval("id") %>&amp;SID=<%=studentID %>">
               <li class="unit-80 clear">
                  <h6><%# Eval("id") %> - <%# Eval("name") %></h6>                   
                       <p><%# Eval("description") %></p>
                       <hr />
               </li></a>
<br /></span>
               </AlternatingItemTemplate>
               
               <EmptyDataTemplate>
                   <span>No data was returned.</span>
               </EmptyDataTemplate>
               
               <ItemTemplate>
                  <span> <a href="coursepage.aspx?CID=<%# Eval("id") %>&amp;SID=<%=studentID %>">
               <li class="unit-80 clear">
                  <h6><%# Eval("id") %> - <%# Eval("name") %></h6>                   
                       <p><%# Eval("description") %></p>
                       <hr />
               </li></a>
<br /></span>
               </ItemTemplate>
               <LayoutTemplate>
                   <div ID="itemPlaceholderContainer" runat="server" style="">
                       <span runat="server" id="itemPlaceholder" />
                   </div>
                   <div style="">
                   </div>
               </LayoutTemplate>
               
           </asp:ListView>

           <asp:SqlDataSource ID="EnrolledSource" runat="server" 
               ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
               
               SelectCommand="SELECT course.id, course.name, course.description FROM course INNER JOIN enroll ON course.id = enroll.course_id WHERE (enroll.user_id = @SID) AND (course.status = 1) AND enroll.status=1">
               <SelectParameters>
                   <asp:QueryStringParameter Name="SID" QueryStringField="SID" />
               </SelectParameters>
           </asp:SqlDataSource>

       </div>

       <div id="profile" class="content">
           <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
               AutoGenerateRows="False" DataKeyNames="id" DataSourceID="UserDetailsSource">
               <Fields>
                   <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                       ReadOnly="True" SortExpression="id" Visible="False" />
                   <asp:BoundField DataField="name_surname" HeaderText="Full Name" 
                       SortExpression="name_surname" />
                   <asp:BoundField DataField="department_id" HeaderText="department_id" 
                       SortExpression="department_id" Visible="False" />
                   <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                   <asp:BoundField DataField="country" HeaderText="Country" 
                       SortExpression="country" />
                   <asp:BoundField DataField="password" HeaderText="Password" 
                       SortExpression="password" />
                   <asp:BoundField DataField="question" HeaderText="Security Question" 
                       SortExpression="question" />
                   <asp:BoundField DataField="answer" HeaderText="Answer" 
                       SortExpression="answer" />
                   <asp:CheckBoxField DataField="status" HeaderText="Account Status" 
                       SortExpression="status" />
               </Fields>
           </asp:DetailsView>
       
           <asp:SqlDataSource ID="UserDetailsSource" runat="server" 
               ConnectionString="<%$ ConnectionStrings:dbgauConnectionString %>" 
               SelectCommand="SELECT id, name_surname, department_id, email, country, password, question, answer, status FROM users WHERE (id = @id)" 
               UpdateCommand="UPDATE ">
               <SelectParameters>
                   <asp:QueryStringParameter Name="id" QueryStringField="SID" />
               </SelectParameters>
           </asp:SqlDataSource>
       
       </div>

       <div id="settings" class="content">
       
       </div>
    

</div>

<asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
</asp:Content>
