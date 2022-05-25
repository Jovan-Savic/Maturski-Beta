using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace JSMaturski
{
    public partial class Racunovodja : System.Web.UI.Page
    {
        DataTable tabela;
        SqlDataAdapter adapter;
        SqlConnection veza = new SqlConnection();
        string cs = ConfigurationManager.ConnectionStrings["Djacki"].ConnectionString;

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            Ime.Text = "Jovan Savic";

            Logika ts = new Logika();
            Label1.Text = ts.Ukupaniznos().ToString() + " din";
            Label2.Text = ts.Neukupaniznos().ToString() + " din";

        }
          
        protected void Selsect_Click(object sender, EventArgs e)
        {
            Logika uplatio = new Logika();
            int id_dinara = Convert.ToInt32((sender as LinkButton).CommandArgument);
            uplatio.tugluplate(id_dinara);
            this.GridView1.DataBind();
        }
        protected void Obrisi_Click(object sender, EventArgs e)
        {
            Logika uplatio = new Logika();
            int id_dinara = Convert.ToInt32((sender as LinkButton).CommandArgument);
            uplatio.Obrisi(id_dinara);
            this.GridView1.DataBind();
        }
        protected void Select_Click(object sender, EventArgs e)
        {
    


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dodaj_Click(object sender, EventArgs e)
        {
            Logika dodj = new Logika();
            string uplacen = "Ne";
            if(Chuplacen.Checked == true)
            {
                uplacen = "Da";
            }
            try { 
            dodj.Dodaj_Dinar(txt_imeuc.Text,txt_prezimeuc.Text, Convert.ToInt32(Prof.SelectedValue), Convert.ToInt32(txt_iznos.Text), Calendar1.SelectedDate,uplacen);
            }
            catch
            {
                MsgBox("Pogresni podaci", this.Page, this); 
            }
            this.GridView1.DataBind();
        }

        protected void dodajuc_Click(object sender, EventArgs e)
        {
            Logika dodjuc = new Logika();
            dodjuc.Dodaj_Ucenika(txt_imeucd.Text, txt_prezimeucd.Text, txt_jmbg.Text);
            GridView2.DataBind();
        }

        protected void Obrisi_uc_Click(object sender, EventArgs e)
        {
            Logika dodjuc = new Logika();
            dodjuc.Obrisi_Ucenika(txt_imeucobr.Text, txt_prezimeucobr.Text, txt_jmbgo.Text);
            GridView2.DataBind();
        }

        protected void izmeni_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tabela = new DataTable();
             veza = new SqlConnection(cs);
            adapter = new SqlDataAdapter("SELECT id_dinara, Ucenik.ime, Ucenik.prezime, datum, iznos, uplacen from Dinar  LEFT JOIN Ucenik on id_ucenika = Ucenik.id  LEFT JOIN Profesor on id_profesora = Profesor.id  WHERE Profesor.id ="+ DropDownList1.SelectedValue.ToString(), veza);
            veza.Open();
            adapter.Fill(tabela);
            veza.Close();
            if (tabela.Rows.Count > 0)
            {
                GridView3.DataSource = tabela;
                GridView3.DataBind();
            }

        }
    }
}