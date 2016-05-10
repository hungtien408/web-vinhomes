<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpSite" runat="Server">
    <div id="site">
        <a id="A1" href="~/" runat="server">Home <span class="glyphicon glyphicon-triangle-right">
        </span></a><span>
            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="wrapper-news">
                    <asp:ListView ID="lstNewsBig" runat="server" DataSourceID="odsNewsBig" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="news-big news-lbox">
                                <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'
                                    class="news-img">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/img-news-1.jpg" %>'
                                        runat="server" /></a>
                                <div class="news-content">
                                    <h2 class="news-name">
                                        <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'>
                                            <%# Eval("ArticleTitleEn")%></a>
                                    </h2>
                                    <div class="date">
                                        <%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%>
                                    </div>
                                    <div class="description">
                                        <%# Eval("DescriptionEn") %>
                                    </div>
                                    <div class="more-details">
                                        <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'>
                                           See more</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="news-lbox">
                                <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'
                                    class="news-img">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/img-news-1.jpg" %>'
                                        runat="server" /></a>
                                <div class="news-content">
                                    <div class="date">
                                        <%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%>
                                    </div>
                                    <h3 class="news-name">
                                        <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tri-" + Eval("ArticleID") + ".aspx" %>'>
                                            <%# Eval("ArticleTitleEn")%></a>
                                    </h3>
                                    <div class="description">
                                        <%# Eval("DescriptionEn") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
            <asp:ObjectDataSource ID="odsNewsBig" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
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
            <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="" Name="EndRowIndex" Type="String" />
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
            <div class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="4" PagedControlID="lstNews">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="" ShowFirstPageButton="true"
                            ShowNextPageButton="false" ShowPreviousPageButton="false" PreviousPageText=""
                            RenderDisabledButtonsAsLabels="true" ButtonCssClass="first icon-backward" />
                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="" ShowFirstPageButton="false"
                            ShowNextPageButton="false" ShowPreviousPageButton="true" PreviousPageText=""
                            RenderDisabledButtonsAsLabels="true" ButtonCssClass="prev icon-caret-left" />
                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="current" CurrentPageLabelCssClass="current" />
                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="" ShowLastPageButton="false"
                            ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="next icon-caret-right"
                            NextPageText="" RenderDisabledButtonsAsLabels="true" />
                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="" ShowLastPageButton="True"
                            ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="last icon-forward"
                            NextPageText="" RenderDisabledButtonsAsLabels="true" />
                    </Fields>
                </asp:DataPager>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
