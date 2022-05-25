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
    public partial class Profesor : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
               Ime.Text = Session["korisnik"].ToString();

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
            Response.Redirect("Profesor.aspx", true);
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
 
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }
    }
}