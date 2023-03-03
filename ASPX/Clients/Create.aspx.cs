using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;
using System.Web.Routing;

namespace ASPX.Clients
{   
    public partial class Create : System.Web.UI.Page
    {
        public String errorMessage = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string phone = txtPhone.Text;
                string address = txtAddress.Text;

                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                SqlConnection conn = new SqlConnection(ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spclients_set";

                cmd.Parameters.Add("name", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("password", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("phone", SqlDbType.VarChar).Value = phone;
                cmd.Parameters.Add("address", SqlDbType.VarChar).Value = address;

                cmd.ExecuteNonQuery();

                Response.Redirect("/Clients/Default");
            }
            catch(Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }
    }
}