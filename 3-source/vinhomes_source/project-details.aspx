<%@ Page Title="" Language="C#" MasterPageFile="~/site-project.master" AutoEventWireup="true"
    CodeFile="project-details.aspx.cs" Inherits="project_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSite" runat="Server">
    <div id="site">
        <a id="A1" href="~/" runat="server">Home <span class="glyphicon glyphicon-triangle-right">
        </span></a><a href="project.aspx">Dự án <span class="glyphicon glyphicon-triangle-right"></span>
        </a><span>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="lstProjectDetails" runat="server" DataSourceID="odsProjectDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <h1 class="title-about">
                <%# Eval("ProjectTitle") %></h1>
            <div class="wrapper-text">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProjectDetails" runat="server" 
        SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="pri" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
