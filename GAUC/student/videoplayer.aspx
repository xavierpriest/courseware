<%@ Page Title="Video View Page | Students Page" Language="C#" MasterPageFile="~/master/student.Master" AutoEventWireup="true" CodeBehind="videoplayer.aspx.cs" Inherits="GAUC.student.videoplayer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <h1>GAU E-learning System</h1>
    <h4>Video Player</h4>
    </div>
    <hr />
<div class="units-row">
<div class="unit-centered unit-80">
    <asp:Panel ID="Panel1" runat="server" Visible=false>
   <video src="../instructor/<%=videourl %>"
        " id="movie" controls height="360" width="480"/>
        
    </asp:Panel>
    
    </div>
    <div class="unit-centered unit-80">
        <h3><%=videotitle %></h3>
        <h6><%=description %></h6>
        <p>Viewed <%=views %> times</p>
        </div>
      </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
