<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-slider">
        <div class="slick-slider">
            <asp:ListView ID="lstProject" runat="server" DataSourceID="odsProject" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slick-slide">
                        <div class="box-pro">
                            <a href='<%# progressTitle(Eval("ProjectTitle")) + "-pri-" + Eval("ProjectID") + ".aspx" %>' class="pro-img">
                                <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/project/" + Eval("ImageName") : "~/assets/images/img-pro-1.png" %>' runat="server" /></a>
                            <h2 class="title-pro">
                                <span>Dự án</span></h2>
                            <div class="pro-name">
                                <a href='<%# progressTitle(Eval("ProjectTitle")) + "-pri-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitle") %></a></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProject" runat="server" 
                SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProjectTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ProjectCategoryID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBottom" runat="Server">
</asp:Content>
