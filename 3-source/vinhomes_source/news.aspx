<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-project">
        <div class="wrapper-in">
            <h2 class="title text-uppercase text-center">
                <asp:Label ID="lblTitle" runat="server"></asp:Label></h2>
            <div class="project-tb row">
                <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-md-3 col-xs-4 element-item">
                            <div class="project-box text-center">
                                <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tri-" + Eval("ArticleID") + ".aspx" %>' class="project-img">
                                    <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/project-img-1.jpg" %>' runat="server" /></a>
                                <h4 class="project-name">
                                    <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'><%# Eval("ArticleTitle")%></a></h4>
                                <div class="desription">
                                    <%# Eval("Description") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="ArticleCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
