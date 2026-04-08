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
                InitSortDropDown();
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
        Button pwdBtn = (Button)e.Item.FindControl("ImageButton1");
        if (pwdBtn != null)
        {
            pwdBtn.OnClientClick = strjs;
        }

        string sleader = ((Label)e.Item.FindControl("LabelSleader")).Text.ToLower();
        Button mbtn = (Button)e.Item.FindControl("ImageBtnGroup");
        if (mbtn == null)
        {
            return;
        }
        if (sleader == "true")
        {
            mbtn.Text = "组长";
            mbtn.OnClientClick = "if(confirm('您确定撤销" + snum + "学号的组长任命吗?'))return true;else return false; ";
            mbtn.ToolTip = "点击卸任这位组长职位";
            mbtn.CssClass = "stu-mini-btn";
        }
        else
        {
            mbtn.Text = "分组";
            mbtn.OnClientClick = "if(confirm('您确定任命" + snum + "学号的同学为组长吗?'))return true;else return false; ";
            mbtn.ToolTip = "点击任命这位同学为组长";
            mbtn.CssClass = "stu-mini-btn";

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
    private void InitSortDropDown()
    {
        // 初始化排序下拉框，默认选择按机号排序
        DDLsort.SelectedValue = "Sseat";
    }

    protected void DDLsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        GVStudent.PageIndex = 0;
        ShowStudents();
    }

    private void ShowStudents()
    {
        int Sgrade = Int32.Parse(DDLgrade.SelectedValue.ToString());
        int Sclass = Int32.Parse(DDLclass.SelectedValue.ToString());
        string sortField = DDLsort.SelectedValue;
        LearnSite.BLL.Students stus = new LearnSite.BLL.Students();

        // 获取学生数据
        DataSet ds = stus.GetListStudents(Sgrade, Sclass);

        if (ds != null && ds.Tables.Count > 0)
        {
            // 确保包含Sseat列
            if (!ds.Tables[0].Columns.Contains("Sseat"))
            {
                ds.Tables[0].Columns.Add("Sseat", typeof(string));
            }

            // 从Students表获取每个学生的实际座位信息（优先临时座位）
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                string snum = row["Snum"].ToString();
                row["Sseat"] = stus.GetActualSeat(snum);
            }

            // 如果选择按机号排序
            if (sortField == "Sseat")
            {
                DataView dv = ds.Tables[0].DefaultView;
                dv.Sort = "Sseat ASC";
                DataTable sortedTable = dv.ToTable();
                ds.Tables.Clear();
                ds.Tables.Add(sortedTable.Copy());
            }
        }

        Label1.Text = "学生总数" + ds.Tables[0].Rows.Count.ToString() + "位";
        GVStudent.DataSource = ds;
        GVStudent.DataBind();
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
            InitSortDropDown();
            GVStudent.PageIndex = 0;
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
        InitSortDropDown();
    }
    protected void BtnExcel_Click(object sender, EventArgs e)
    {
        LearnSite.BLL.Students stu = new LearnSite.BLL.Students();
        stu.StudentsToExcel();
    }
    protected void GVStudent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("ChangePwd"))
        {
            int mySid = Convert.ToInt32(e.CommandArgument.ToString());
            string myPwd = LearnSite.Common.WordProcess.GenerateRandomNum(2);
            LearnSite.BLL.Students bll = new LearnSite.BLL.Students();
            bll.UpdateSidPwd(mySid.ToString(), myPwd);
            ShowStudents();
            string ch = "你的新密码是：" + myPwd;
            LearnSite.Common.WordProcess.Alert(ch, this.Page);
        }
        if (e.CommandName.Equals("ChangeGroup"))
        {
            int mySid = Convert.ToInt32(e.CommandArgument.ToString());
            LearnSite.BLL.Students bll = new LearnSite.BLL.Students();
            bll.ChangeSleader(mySid);
            System.Threading.Thread.Sleep(300);
            ShowStudents();
        }

        if (e.CommandName.Equals("QuitGroup"))
        {
            int mySid = Convert.ToInt32(e.CommandArgument.ToString());
            LearnSite.BLL.Students bll = new LearnSite.BLL.Students();
            bll.QuitThitGroup(mySid);
            System.Threading.Thread.Sleep(300);
            ShowStudents();
        }

        if (e.CommandName.Equals("EditNum"))
        {
            int mySid = Convert.ToInt32(e.CommandArgument.ToString());
            string jsstr = "window.parent.TINY.box.show({iframe:'../teacher/studentnumedit.aspx?sid=" + mySid + "', boxid:'frameless', width:500, height:450, fixed:false, maskopacity:40})";
            ClientScript.RegisterStartupScript(this.GetType(), "EditNum", jsstr, true);
        }

        if (e.CommandName.Equals("EditSeat"))
        {
            int mySid = Convert.ToInt32(e.CommandArgument.ToString());
            string jsstr = "window.parent.TINY.box.show({iframe:'../teacher/studentseatedit.aspx?sid=" + mySid + "', boxid:'frameless', width:500, height:450, fixed:false, maskopacity:40})";
            ClientScript.RegisterStartupScript(this.GetType(), "EditSeat", jsstr, true);
        }

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
