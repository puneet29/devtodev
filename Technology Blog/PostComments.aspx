<%@ Page Title="Comments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostComments.aspx.cs" Inherits="Technology_Blog.PostComments" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:18px">
        <asp:Label ID="headingLabel" style="font-family:Montserrat; font-size:36pt; font-weight:bold" Text="" runat="server"></asp:Label><br />
        ~ <asp:Label ID="usernameLabel" style="font-family:'Arciform Sans'; font-size:larger" Text="" runat="server"></asp:Label><br /><br />
        <asp:Label ID="postLabel" style="font-family:Garamond; white-space:pre-line; font-size:x-large" Text="" runat="server"></asp:Label>
        <hr />
        </div>
    <div class="jumbotron" style="background-color:#1D1D1B; width:90%">
        <asp:Label ID="commentHeading" Text="Comments" style="font-family:Montserrat; color:white; font-size:18pt; font-weight:bold" runat="server"></asp:Label><br />
        <hr style="width:35%; margin-left:unset; border-top-color:white" class="text-left" />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Width="98%" ShowHeader="False">
        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
        <ItemTemplate>
            <li class="list-group-item" style="color:#1D1D1B">
            <asp:Label style="font-family:'Arciform Sans'" ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
            <br />
            <asp:Label style="font-family:Garamond; font-size:large; white-space:pre-line" ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
            <br />
                </li>
<hr style="border-top-color:white"/>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT [Username], [Comment] FROM [blogComments] WHERE ([postId] = @postId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="postId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br /> <br />
        
        <asp:TextBox ID="commentBox" class="form-control" style="max-width:inherit" runat="server" PlaceHolder="Enter your comment here" TextMode="MultiLine" Rows="10" Width="98%"></asp:TextBox><br /> <br />
        <asp:Button ID="commentButton" class="btn btn-primary" OnClick="commentButton_Click" style="background-color:#1D1D1B" runat="server" Text="Submit" />
     
        </div>
</asp:Content>
