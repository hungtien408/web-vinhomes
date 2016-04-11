<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true"
    CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSite" runat="Server">
    <div id="site">
        <a id="A1" href="~/en/" runat="server">Home <span class="glyphicon glyphicon-triangle-right">
        </span></a><%--<a href="javascript:void(0);">About us <span class="glyphicon glyphicon-triangle-right"></span>
        </a>--%><span>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="lstAboutUs" runat="server" DataSourceID="odsAboutUs" EnableModelValidation="True">
        <ItemTemplate>
            <h1 class="title-about">
                <%# Eval("ArticleTitleEn") %></h1>
            <div class="wrapper-text">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <%--<asp:ObjectDataSource ID="odsAboutUs" runat="server" SelectMethod="ArticleSelectOne"
        TypeName="TLLib.Article">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="tt" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
    <asp:ObjectDataSource ID="odsAboutUs" runat="server" SelectMethod="ArticleSelectAll"
        TypeName="TLLib.Article">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ArticleTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="1" Name="ArticleCategoryID" Type="String" />
            <asp:Parameter Name="Tag" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsHot" Type="String" />
            <asp:Parameter Name="IsNew" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
