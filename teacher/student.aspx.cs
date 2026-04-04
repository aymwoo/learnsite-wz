using System;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Teacher_student : System.Web.UI.Page
{
    LearnSite.Model.TeaCook tcook = new LearnSite.Model.TeaCook();
    private const int PageSize = 15;
    private int _currentPage = 0;
    private int _totalCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        LearnSite.Common.CookieHelp.JudgeTeacherCookies();

        if (!IsPostBack)
        {
            Master.Page.Title = LearnSite.Common.CookieHelp.SetMainPageTitle() + "学生浏览页面";
            BtnNoGroup.Attributes["OnClick"] = "return confirm('您确定要解除本班所有学生的分组及组长吗？');";
            BtnSpwdInit.Attributes["OnClick"] = "return confirm('您确定要将本班学生的个人密码初始化为12345吗？');";
            if (Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] != null)
            {
                GradeClass();
                ShowStudents();
                profileSet();
                addStuJs(DDLgrade.SelectedValue, DDLclass.SelectedValue);
            }
        }
    }

    protected void RptStudent_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

        int rowIndex = e.Item.ItemIndex + _currentPage * PageSize;
        ((Label)e.Item.FindControl("LabelRowIndex")).Text = (rowIndex + 1).ToString();

        HyperLink hl = (HyperLink)e.Item.FindControl("Hlname");
        string sid = hl.ToolTip;
        string sgrade = DDLgrade.SelectedValue;
        string sclass = DDLclass.SelectedValue;
        hl.Attributes.Add("onclick", "stuShow('" + sid + "', '" + sgrade + "', '" + sclass + "');");

        string snum = ((Label)e.Item.FindControl("LabelSnum")).Text;
        string strjs = "if(confirm('您确定更新" + snum + "学号的密码吗?'))return true;else return false; ";
        ((ImageButton)e.Item.FindControl("ImageButton1")).OnClientClick = strjs;

        string sleader = ((Label)e.Item.FindControl("LabelSleader")).Text.ToLower();
        ImageButton mbtn = (ImageButton)e.Item.FindControl("ImageBtnGroup");
        if (sleader == "true")
        {
            mbtn.ImageUrl = "~/images/gflag.gif?temp=" + DateTime.Now.Millisecond.ToString();
            mbtn.OnClientClick = "if(confirm('您确定撤销" + snum + "学号的组长任命吗?'))return true;else return false; ";
            mbtn.ToolTip = "点击卸任这位组长职位";
        }
        else
        {
            mbtn.ImageUrl = "~/images/gcard.gif?temp=" + DateTime.Now.Millisecond.ToString();
            mbtn.OnClientClick = "if(confirm('您确定任命" + snum + "学号的同学为组长吗?'))return true;else return false; ";
            mbtn.ToolTip = "点击任命这位同学为组长";

            LinkButton lbtn = (LinkButton)e.Item.FindControl("LinkBtnQuit");
            if (lbtn != null && lbtn.Text != "")
            {
                lbtn.OnClientClick = "if(confirm('您确定将" + snum + "学号的同学退组吗?'))return true;else return false; ";
                lbtn.ToolTip = "点击将这位同学退组";
            }
        }
    }

    protected void RptStudent_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int mySid = Convert.ToInt32(e.CommandArgument.ToString());
        LearnSite.BLL.Students bll = new LearnSite.BLL.Students();
        if (e.CommandName == "ChangePwd")
        {
            string myPwd = LearnSite.Common.WordProcess.GenerateRandomNum(2);
            bll.UpdateSidPwd(mySid.ToString(), myPwd);
            ShowStudents();
            LearnSite.Common.WordProcess.Alert("你的新密码是：" + myPwd, this.Page);
        }
        else if (e.CommandName == "ChangeGroup")
        {
            bll.ChangeSleader(mySid);
            System.Threading.Thread.Sleep(300);
            ShowStudents();
        }
        else if (e.CommandName == "QuitGroup")
        {
            bll.QuitThitGroup(mySid);
            System.Threading.Thread.Sleep(300);
            ShowStudents();
        }
    }
    private void GradeClass()
    {
        LearnSite.BLL.Room room = new LearnSite.BLL.Room();
        DDLgrade.DataSource = room.GetGrade(tcook.Hid);
        DDLgrade.DataTextField = "Rgrade";
        DDLgrade.DataValueField = "Rgrade";
        DDLgrade.DataBind();
        string Hid = tcook.Hid.ToString();
        if (Session[Hid + "grade"] != null)
        {
            DDLgrade.SelectedValue = Session[Hid + "grade"].ToString();
        }
        int Rgrade = Int32.Parse(DDLgrade.SelectedValue);
        LearnSite.BLL.Room rm = new LearnSite.BLL.Room();
        DDLclass.DataSource = rm.GetLimitClass(Rgrade);
        DDLclass.DataTextField = "Rclass";
        DDLclass.DataValueField = "Rclass";
        DDLclass.DataBind();
        if (Session[Hid + "class"] != null)
        {
            DDLclass.SelectedValue = Session[Hid + "class"].ToString();
        }
    }
    private void ShowStudents()
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Students stus = new LearnSite.BLL.Students();
        System.Data.DataSet ds = stus.GetListStudents(Sgrade, Sclass);
        System.Data.DataTable dt = ds.Tables[0];
        _totalCount = dt.Rows.Count;
        Label1.Text = "学生总数" + _totalCount.ToString() + "位";

        if (ViewState["PageIndex"] != null)
            _currentPage = (int)ViewState["PageIndex"];

        int pageCount = (_totalCount + PageSize - 1) / PageSize;
        if (_currentPage >= pageCount) _currentPage = Math.Max(0, pageCount - 1);

        LblPageIndex.Text = (_currentPage + 1).ToString();
        LblPageCount.Text = pageCount.ToString();
        btnFirst.Enabled = btnPrev.Enabled = _currentPage > 0;
        btnNext.Enabled = btnLast.Enabled = _currentPage < pageCount - 1;

        System.Data.DataTable page = dt.Clone();
        int start = _currentPage * PageSize;
        int end = Math.Min(start + PageSize, _totalCount);
        for (int i = start; i < end; i++)
            page.ImportRow(dt.Rows[i]);

        RptStudent.DataSource = page;
        RptStudent.DataBind();
        ds.Dispose();
    }

    protected void Pager_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int pageCount = int.Parse(LblPageCount.Text);
        if (ViewState["PageIndex"] != null)
            _currentPage = (int)ViewState["PageIndex"];
        switch (btn.CommandArgument)
        {
            case "First": _currentPage = 0; break;
            case "Prev":  _currentPage = Math.Max(0, _currentPage - 1); break;
            case "Next":  _currentPage = Math.Min(pageCount - 1, _currentPage + 1); break;
            case "Last":  _currentPage = pageCount - 1; break;
        }
        ViewState["PageIndex"] = _currentPage;
        ShowStudents();
    }

    private void addStuJs(string sgrade, string sclass)
    {
        if (sgrade != "" && sclass != "")
        {
            string jsstradd = "stuAdd('" + sgrade + "', '" + sclass + "');";
            HkaddStu.Attributes.Add("onclick", jsstradd);
        }
    }
    protected void DDLgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLgrade.SelectedItem != null)
        {
            int Rgrade = Int32.Parse(DDLgrade.SelectedValue);
            LearnSite.BLL.Room rm = new LearnSite.BLL.Room();
            DDLclass.DataSource = rm.GetLimitClass(Rgrade);
            DDLclass.DataBind();
            ViewState["PageIndex"] = 0;
            ShowStudents();
            profileSet();
            addStuJs(DDLgrade.SelectedValue, DDLclass.SelectedValue);
            if (Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] != null)
            {
                string Hid = tcook.Hid.ToString();
                Session[Hid + "grade"] = DDLgrade.SelectedValue;
                Session[Hid + "class"] = DDLclass.SelectedValue;
            }
        }
        Labelmsg.Text = "";
    }
    protected void DDLclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] != null)
        {
            string Hid = tcook.Hid.ToString();
            Session[Hid + "grade"] = DDLgrade.SelectedValue;
            Session[Hid + "class"] = DDLclass.SelectedValue;
        }
        ViewState["PageIndex"] = 0;
        ShowStudents();
        profileSet();
        addStuJs(DDLgrade.SelectedValue, DDLclass.SelectedValue);
        Labelmsg.Text = "";
    }
    protected void BtnExcel_Click(object sender, EventArgs e)
    {
        LearnSite.BLL.Students stu = new LearnSite.BLL.Students();
        stu.StudentsToExcel();
    }
    protected void BtnSpell_Click(object sender, EventArgs e)
    {
        if (Request.Cookies[LearnSite.Common.CookieHelp.teaCookieNname] != null)
        {
            int Hid = tcook.Hid;
            string InitPwd = TextBoxPwd.Text.Trim();
            LearnSite.BLL.Students sbll = new LearnSite.BLL.Students();
            Labelmsg.Text = sbll.SpwdToSpell(Hid, InitPwd);//如果初始化密码格式为字母或数字，则进行转换 
            System.Threading.Thread.Sleep(200);
            ShowStudents();
        }
    }
    protected void BtnRevive_Click(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        string url = "~/teacher/delstudents.aspx?sgrade=" + Sgrade + "&sclass=" + Sclass;
        Response.Redirect(url, false);
    }
    protected void BtnNoGroup_Click(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Students sbll = new LearnSite.BLL.Students();
        Labelmsg.Text = "解除本班分组共" + sbll.NoGroup(Sgrade, Sclass).ToString() + "位同学！";
        System.Threading.Thread.Sleep(500);
        ShowStudents();
    }
    protected void DDLgroupMax_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLgroupMax.SelectedValue != "")
        {
            int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
            int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
            LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
            int groupMax = Int32.Parse(DDLgroupMax.SelectedValue);
            rbll.SetRgroupMax(Sgrade, Sclass, groupMax);
        }
    }

    private void profileSet()
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        LearnSite.Model.Room rmodel = rbll.GetModel(Sgrade, Sclass);
        if (rmodel == null) return;
        Ckclass.Checked = rmodel.Rclassedit;
        Ckphoto.Checked = rmodel.Rphotoedit;
        Cksex.Checked = rmodel.Rsexedit;
        Ckname.Checked = rmodel.Rnameedit;
        Ckreg.Checked = rmodel.Rreg;
        string gmax = rbll.GetRgroupMax(Sgrade, Sclass).ToString();
        for (int i = 0; i < DDLgroupMax.Items.Count; i++)
        {
            if (DDLgroupMax.Items[i].Value == gmax)
            {
                DDLgroupMax.SelectedValue = rbll.GetRgroupMax(Sgrade, Sclass).ToString();
                break;
            }
        }
    }
    protected void Ckclass_CheckedChanged(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        rbll.SetRclassedit(Sgrade, Sclass, Ckclass.Checked);
    }
    protected void Ckphoto_CheckedChanged(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        rbll.SetRphotoedit(Sgrade, Sclass, Ckphoto.Checked);

    }
    protected void Cksex_CheckedChanged(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        rbll.SetRsexedit(Sgrade, Sclass, Cksex.Checked);
    }
    protected void Ckname_CheckedChanged(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        rbll.SetRnameedit(Sgrade, Sclass, Ckname.Checked);
    }
    protected void Btngroups_Click(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        string url = "~/teacher/grouping.aspx?sgrade=" + Sgrade + "&sclass=" + Sclass;
        Response.Redirect(url, false);
    }
    protected void Ckreg_CheckedChanged(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        LearnSite.BLL.Room rbll = new LearnSite.BLL.Room();
        rbll.SetRreg(Sgrade, Sclass, Ckreg.Checked);
        if (Ckreg.Checked)
        {
            Ckreg.ToolTip = "允许在线注册为本班学员！";
        }
        else
        {
            Ckreg.ToolTip = "禁止在线注册为本班学员！";
        }
    }
    protected void BtnSpwdInit_Click(object sender, EventArgs e)
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        string InitPwd = TextBoxPwd.Text.Trim();
        if (!String.IsNullOrEmpty(InitPwd))
        {
            LearnSite.BLL.Students sbll = new LearnSite.BLL.Students();
            sbll.UpdateMyClassPwd(Sgrade, Sclass, InitPwd);
            System.Threading.Thread.Sleep(200);
            ShowStudents();
        }
    }
}
