<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="project.aspx.cs" Inherits="project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Vinhomes</title>
    <meta name="description" content="Vinhomes" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-project">
        <div class="wrapper-in">
            <h2 class="title text-uppercase text-center">
                Bất động sản đang bán</h2>
            <div class="project-tb row">
                <asp:ListView ID="lstProject" runat="server" DataSourceID="odsProject" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-md-3 col-xs-4 element-item">
                            <div class="project-box text-center">
                                <a href='<%# progressTitle(Eval("ProjectTitle")) + "-pri-" + Eval("ProjectID") + ".aspx" %>' class="project-img">
                                    <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/project/" + Eval("ImageName") : "~/assets/images/project-img-1.jpg" %>' runat="server" /></a>
                                <h4 class="project-name">
                                    <a href='<%# progressTitle(Eval("ProjectTitle")) + "-pri-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitle")%></a></h4>
                                <div class="desription">
                                    <%# Eval("Description") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProject" runat="server" SelectMethod="ProjectSelectAll"
                        TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
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
