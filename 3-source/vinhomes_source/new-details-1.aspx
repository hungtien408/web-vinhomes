<%@ Page Title="" Language="C#" MasterPageFile="~/site-news.master" AutoEventWireup="true"
    CodeFile="new-details-1.aspx.cs" Inherits="project_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSite" runat="Server">
    <div id="site">
        <a id="A1" href="~/" runat="server">Home <span class="glyphicon glyphicon-triangle-right">
        </span></a><a href="project.aspx">Tin tức <span class="glyphicon glyphicon-triangle-right"></span>
        </a><span>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="lstArticleDetails" runat="server" DataSourceID="odsArticleDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <h1 class="title-about">
                <%# Eval("ArticleTitle")%></h1>
            <div class="wrapper-text">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsArticleDetails" runat="server" 
        SelectMethod="ArticleSelectOne" TypeName="TLLib.Article">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="tri" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
