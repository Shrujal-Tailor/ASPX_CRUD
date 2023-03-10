using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ASPX.Clients
{
	public partial class Edit : System.Web.UI.Page
	{
        public String errorMessage = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                var id = Convert.ToInt32(Request.QueryString["id"]);
                string StatementType = "Update";

                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spclients_get";
                        cmd.Parameters.Add("id", SqlDbType.VarChar).Value = id;
                        cmd.Parameters.Add("StatementType", SqlDbType.VarChar).Value = StatementType;
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            txtName_ed.Text = sdr["name"].ToString();
                            txtEmail_ed.Text = sdr["email"].ToString();
                            txtPhone_ed.Text = sdr["phone"].ToString();
                            txtAddress_ed.Text = sdr["address"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            { 
                var id = Convert.ToInt32(Request.QueryString["id"]);
                string name = txtName_ed.Text;
                string email = txtEmail_ed.Text;
                string phone = txtPhone_ed.Text;
                string address = txtAddress_ed.Text;
                string StatementType = "Update";

                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spclients_set";

                        cmd.Parameters.Add("id", SqlDbType.VarChar).Value = Convert.ToInt32(id);
                        cmd.Parameters.Add("name", SqlDbType.VarChar).Value = name;
                        cmd.Parameters.Add("email", SqlDbType.VarChar).Value = email;
                        cmd.Parameters.Add("phone", SqlDbType.VarChar).Value = phone;
                        cmd.Parameters.Add("address", SqlDbType.VarChar).Value = address;
                        cmd.Parameters.Add("StatementType", SqlDbType.VarChar).Value = StatementType;

                        cmd.ExecuteNonQuery();
                    }
                }
                
                Response.Redirect("/Clients/Default");
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }
    }
}