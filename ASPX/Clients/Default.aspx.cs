using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing.Printing;
using System.Web.Services;

namespace ASPX.Clients
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dgViewClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Update")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("/Clients/Update?id="+id);
            }
            else if(e.CommandName.ToString() == "Delete")
            {
                string id = e.CommandArgument.ToString();
                string StatementType = "Delete";

                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spclients_set";

                        cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                        cmd.Parameters.Add("StatementType", SqlDbType.VarChar).Value = StatementType;

                        cmd.ExecuteNonQuery();
                    }

                    Response.Redirect("/Clients/Default");
                }
            }
        }
    }
}