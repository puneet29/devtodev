<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Technology_Blog._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background:#1D1D1B">
        <div style="display:inline-block">
            <h1 style="font-family: Broadway; color:#FFFFFF">Welcome to DevtoDev,</h1>
            <h1 style="font-family: Broadway; color:#FFFFFF">where Tech matters.</h1>
            <p class="lead" style="width: 542px; color:#DDDDDD">We&#39;ll deliver the best stories and ideas on the technology you care about most straight to your homepage.</p>
            <hr class="my-4">
            <p><asp:Button ID="getStartedbtn" runat="server" Text="Get Started" class="btn btn-default" OnClick="getStartedbtn_Click" />&nbsp; <a href="About.aspx" class="btn btn-default">Learn more</a></p>
            
        </div>
        <div style="float:left; margin-right:70px; margin-top:70px">
            <asp:Image ID="Image1" class="btn btn-default" style="background-color:#1D1D1B; border-color:white" runat="server" ImageUrl="favicon.png" Height="200px" Width="200px" />

        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                DevtoDev lets you share your knowledge with other developers using a user friendly interface.
            Aspire other developers and learners to learn, share and innovate. Get to know more about changing trends in technology.
            </p>
            <p>
                <asp:Button ID="getStartedbtnSec" runat="server" class="btn btn-default" Text="Get There" OnClick="getStartedbtnSec_Click" />
            </p>
            
        </div>
        <div class="col-md-4">
            <h2>Start reading!</h2>
            <p>
                If you've signed up to read or you are willing to share your articles, then the first step to being a good publisher is to read the existing articles.
            </p>
            <p>
                <a class="btn btn-default" href="Feed">Read &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Liking our website?</h2>
            <p>
                Follow us at Github.
            </p>
            <p>
                <a class="btn btn-default" href="https://github.com/puneet29"> &rsaquo;&rsaquo; Puneet &lsaquo;&lsaquo; </a>&nbsp;
                <a class="btn btn-default" href="https://github.com/Revaneet"> &rsaquo;&rsaquo; Ravneet &lsaquo;&lsaquo; </a>
            </p>
        </div>
    </div>

</asp:Content>
