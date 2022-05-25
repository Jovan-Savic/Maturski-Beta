using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSMaturski
{
    public partial class Login : System.Web.UI.Page
    {
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void prijava_Click(object sender, EventArgs e)
        {
            Logika provera = new Logika();
            int rez;
            rez = provera.Logovanje(txt_email.Text, txt_passw.Text);

            if (rez == 1)
            {

                Session["korisnik"] = provera.Imeprezime(txt_email.Text);
                Session["id"] = provera.Dajid(txt_email.Text);
                MsgBox("Uspesno logovanje! admine", this.Page, this);
                Response.Redirect("Racunovodja.aspx", true);
            }
            else if(rez == 2)
            {
                Session["korisnik"] = provera.Imeprezime(txt_email.Text);
                Session["id"] = provera.Dajid(txt_email.Text);
               MsgBox("Uspesno logovanje! profesore", this.Page, this);
                Response.Redirect("Profesor.aspx", true);
            }
            else
            {
                MsgBox("Pogresni podaci!", this.Page, this);
            }
        }
    }
}