using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("san-pham.aspx?ci=") || page.Contains("chi-tiet-san-pham.aspx?pi="))
                activePage = "san-pham.aspx";
            else if (page.Contains("-pri-"))
                activePage = "project.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {

                //send email         
                sendEmail();
                lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                lblMessage.Visible = true;
                lblMessage.Text = "";
                //
                //Clear text
                //
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtAddress.Text = "";
                txtContent.Text = "";
            }
            else
            {
                lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
            }
        }
    }

    private void sendEmail()
    {
        string msg = "<h3>VINHOMES GOLDEN RIVER: CONTACT</h3><br/>";
        msg += "<b>Họ tên: </b>" + txtFullName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Địa chỉ: </b>" + txtAddress.Text.Trim().ToString() + "<br />";
        msg += "<b>Nội dung: </b>" + txtContent.Text.Trim().ToString();
        Common.SendMail("118.69.193.238", 25, "webmaster@thietkewebhcm.com", "web123master", "hungtien408@gmail.com", "", "Contact VINHOMES GOLDEN RIVER", msg, false);
    }
    protected void btnVN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/" + path);
    }
    protected void btnEN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/en/" + path);
    }
}
