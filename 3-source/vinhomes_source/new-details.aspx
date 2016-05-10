<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="new-details.aspx.cs" Inherits="new_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSite" runat="Server">
    <div id="site">
        <a id="A1" href="~/" runat="server">Home <span class="glyphicon glyphicon-triangle-right">
        </span></a><a href="news.aspx">Tin Tức <span class="glyphicon glyphicon-triangle-right">
        </span></a><span>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-news">
        <div class="headno">
            <h2 class="title title-2 text-uppercase">
                <span>Tin tức - Sự kiện</span></h2>
        </div>
        <div class="content-news">
            <asp:ListView ID="lstNewDetails" runat="server" DataSourceID="odsNewDetails" EnableModelValidation="True">
                <ItemTemplate>
                    <h1 class="title title-news">
                        <%# Eval("ArticleTitle") %></h1>
                    <div class="date">
                        <%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%>
                    </div>
                    <div class="wrapper-text">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNewDetails" runat="server" SelectMethod="ArticleSelectOne"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="tri" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="headpo">
                <h2 class="title">
                    Tin liên quan</h2>
            </div>
            <asp:ListView ID="lstNewSame" runat="server" DataSourceID="odsNewSame" EnableModelValidation="True">
                <ItemTemplate>
                    <li><a href='<%# progressTitle(Eval("ArticleTitle")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'>
                        <%# Eval("ArticleTitle") %></a></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul class="list-order">
                        <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNewSame" runat="server" SelectMethod="ArticleSameSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter Name="RerultCount" Type="String" DefaultValue="5" />
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="tri" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
