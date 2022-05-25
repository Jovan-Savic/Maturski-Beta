using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace JSMaturski
{
   
    public class Logika
    { 
        
    SqlConnection veza = new SqlConnection();
    string cs = ConfigurationManager.ConnectionStrings["Djacki"].ConnectionString;
    SqlCommand komanda = new SqlCommand();

        public int Logovanje(string email, string lozinka)
        {

            veza.ConnectionString = cs;
            int rezultat;

            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Logovanje";

            komanda.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            komanda.Parameters.Add(new SqlParameter("@passw", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

            int Ret,status;
            Ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                komanda.CommandText = "dbo.Jeladmin";
                komanda.Parameters.Clear();

                komanda.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
                komanda.Parameters.Add(new SqlParameter("@passw", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
                komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

                veza.Open();
                komanda.ExecuteNonQuery();
                veza.Close();

                status = (int)komanda.Parameters["@RETURN_VALUE"].Value;
                if (status == 1)
                {
                    rezultat = 1;
                }
                else
                {
                    rezultat = 2;
                }
            }
            else
            {
                rezultat = 0;
            }
            return rezultat;
        }

        public int Dajid(string email)
        {
            int id;

            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dajid";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

            id = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            return id;
        }
        public string Imeprezime(string email)
        {
            string ime;

            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dajime";
            komanda.Parameters.Clear();
       
            komanda.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.NVarChar, 20, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

            ime = komanda.Parameters["@RETURN_VALUE"].Value.ToString();
            return ime;
        }

        public void tugluplate(int id_dinara)
        {

            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.tugluplate";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@id_dinara", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_dinara));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

        }
        public void Obrisi(int id_dinara)
        {

            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dinar_Delete";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@id_dinara", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_dinara));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
        }
        public void Dodaj_Dinar(string imeuc, string prezimeuc, int id_profesora, int iznos, DateTime datum, string upalacen)
        {
            int iduc;
            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dajiduc";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, imeuc));
            komanda.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezimeuc));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.NVarChar, 20, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
            iduc = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            komanda.Parameters.Clear();
            komanda.CommandText = "dbo.Dinar_Insert";
            komanda.Parameters.Add(new SqlParameter("@id_ucenika", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, iduc));
            komanda.Parameters.Add(new SqlParameter("@id_profesora", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_profesora));
            komanda.Parameters.Add(new SqlParameter("@iznos", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, iznos));
            komanda.Parameters.Add(new SqlParameter("@datum", SqlDbType.Date, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, datum.Date));
            komanda.Parameters.Add(new SqlParameter("@uplacen", SqlDbType.NVarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, upalacen));
            
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
        }

        public void Dodaj_Ucenika(string ime, string prezime ,string jmbg)
        {

            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Ucenik_Insert";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            komanda.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            komanda.Parameters.Add(new SqlParameter("@jmbg", SqlDbType.NVarChar, 13, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, jmbg));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
        }

        public int Dajjid(string prezime)
        {

            int id;

        veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dajidprof";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

            id = (int) komanda.Parameters["@RETURN_VALUE"].Value;
            return id;
        }
        public void Obrisi_Ucenika(string ime, string prezime, string jmbg)
        {
            int iduc;
            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Dajiduc";
            komanda.Parameters.Clear();

            komanda.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            komanda.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.NVarChar, 20, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();

            iduc = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            komanda.Parameters.Clear();

            komanda.CommandText = "dbo.Ucenik_Delete"; 
            komanda.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 20, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, iduc));
            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
        }


        public int Ukupaniznos()
        {
            int ret;
            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Ukupaniznos";
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.NVarChar, 20, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
            ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;

                return ret;
        }
        public int Neukupaniznos()
        {
            int ret;
            veza.ConnectionString = cs;
            komanda.Connection = veza;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "dbo.Neukupaniznos";
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.NVarChar, 20, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            veza.Open();
            komanda.ExecuteNonQuery();
            veza.Close();
            ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;

            return ret;
        }

    }
}
