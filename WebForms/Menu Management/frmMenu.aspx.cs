using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eDawaKhana.WebForms.Menu_Management
{
    public partial class frmMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlMenu.SelectedIndex = -1;
            ddlMenu.Visible = false;
            txtUrl.Visible = false;
            txtUrl.Text = "#";
            rfvtxtUrl.Enabled = false;
            rfvddlMenu.Enabled = false;

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void ddlMenuType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMenuType.SelectedValue == "0")
            {
                ddlMenu.SelectedIndex = -1;
                ddlMenu.Visible = false;
                txtUrl.Visible = false;
                txtUrl.Text = "#";
                rfvtxtUrl.Enabled = false;
                rfvddlMenu.Enabled = false;
            }
            else
            {
                ddlMenu.SelectedIndex = -1;
                ddlMenu.Visible = true;
                txtUrl.Visible = true;
                txtUrl.Text = "";
                rfvtxtUrl.Enabled = true;
                rfvddlMenu.Enabled = true;
            }
        }
    }
}