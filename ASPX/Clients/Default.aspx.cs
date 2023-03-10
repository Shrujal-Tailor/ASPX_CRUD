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
using System.Text.RegularExpressions;
using Microsoft.AspNet.FriendlyUrls;

namespace ASPX.Clients
{
    public partial class Default : System.Web.UI.Page
    {
        public String errorMessage = "";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                string StatementType = "Display";

                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spclients_get";

                        cmd.Parameters.Add("StatementType", SqlDbType.VarChar).Value = StatementType;

                        using (DataTable dataTable = new DataTable())
                        {
                            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                            {
                                adapter.Fill(dataTable);
                                dgViewClients.DataSource = dataTable;
                                dgViewClients.DataBind();
                            }
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }

        protected void dgViewClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "Update")
                {
                    string id = e.CommandArgument.ToString();
                    Response.Redirect("/Clients/Update?id=" + id);
                }
                else if (e.CommandName.ToString() == "Delete")
                {
                    string id = e.CommandArgument.ToString();

                    string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                    using (SqlConnection conn = new SqlConnection(ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "spclients_delete";

                            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);

                            cmd.ExecuteNonQuery();
                        }

                        Response.Redirect("/Clients/Default");
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            try
            {
                string StatementType = "Search";
                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConn"].ToString();
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spclients_get";

                        cmd.Parameters.Add("StatementType", SqlDbType.VarChar).Value = StatementType;
                        cmd.Parameters.AddWithValue("@val", txtSearch.Text.Trim());

                        DataTable dataTable = new DataTable();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dataTable);
                            dgViewClients.DataSource = dataTable;
                            dgViewClients.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgViewClients.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}