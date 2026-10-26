using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ByteMarket
{
    public partial class Login : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtregname.Text) && !string.IsNullOrEmpty(txtregemail.Text) && !string.IsNullOrEmpty(txtregpass.Text))
            {
                getcon();

                // Check if email already registered
                cmd = new SqlCommand("SELECT COUNT(*) FROM user_tbl WHERE Email='" + txtregemail.Text.Trim() + "'", con);
                int exist = Convert.ToInt32(cmd.ExecuteScalar());

                if (exist > 0)
                {
                    Response.Write("<script>alert('Email already registered! Please sign in.');</script>");
                    return;
                }

                // 1. First insert into user_tbl
                string qryUser = "INSERT INTO user_tbl(Name, Email, Password, Role, Mobile, City) VALUES('" 
                    + txtregname.Text.Trim() + "', '" 
                    + txtregemail.Text.Trim() + "', '" 
                    + txtregpass.Text.Trim() + "', '" 
                    + ddlrole.SelectedValue + "', '" 
                    + txtregmobile.Text.Trim() + "', '" 
                    + txtregcity.Text.Trim() + "'); SELECT SCOPE_IDENTITY();";

                cmd = new SqlCommand(qryUser, con);
                int newUserId = Convert.ToInt32(cmd.ExecuteScalar());

                // 2. Then insert into respective self table (buyer_tbl or seller_tbl)
                if (ddlrole.SelectedValue == "Buyer")
                {
                    string qryBuyer = "INSERT INTO buyer_tbl(User_Id, FullName, Email, Mobile, City) VALUES(" 
                        + newUserId + ", '" 
                        + txtregname.Text.Trim() + "', '" 
                        + txtregemail.Text.Trim() + "', '" 
                        + txtregmobile.Text.Trim() + "', '" 
                        + txtregcity.Text.Trim() + "')";

                    cmd = new SqlCommand(qryBuyer, con);
                    cmd.ExecuteNonQuery();
                }
                else if (ddlrole.SelectedValue == "Seller")
                {
                    string qrySeller = "INSERT INTO seller_tbl(User_Id, FullName, StoreName, Email, Mobile, City) VALUES(" 
                        + newUserId + ", '" 
                        + txtregname.Text.Trim() + "', '" 
                        + txtregname.Text.Trim() + " Store', '" 
                        + txtregemail.Text.Trim() + "', '" 
                        + txtregmobile.Text.Trim() + "', '" 
                        + txtregcity.Text.Trim() + "')";

                    cmd = new SqlCommand(qrySeller, con);
                    cmd.ExecuteNonQuery();
                }

                // Clear input fields
                txtregname.Text = "";
                txtregemail.Text = "";
                txtregpass.Text = "";
                txtregmobile.Text = "";
                txtregcity.Text = "";

                Response.Write("<script>alert('Registration Successful! Please Sign In.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please fill in Name, Email and Password.');</script>");
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txteml.Text) && !string.IsNullOrEmpty(txtpass.Text))
            {
                getcon();

                cmd = new SqlCommand("SELECT COUNT(*) FROM user_tbl WHERE Email='" + txteml.Text.Trim() + "' AND Password='" + txtpass.Text.Trim() + "'", con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    cmd = new SqlCommand("SELECT User_Id, Name, Role FROM user_tbl WHERE Email='" + txteml.Text.Trim() + "' AND Password='" + txtpass.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["uid"] = dr["User_Id"].ToString();
                        Session["user"] = dr["Name"].ToString();
                        Session["email"] = txteml.Text.Trim();
                        string role = dr["Role"].ToString();
                        Session["role"] = role;

                        dr.Close();

                        if (role == "Buyer")
                        {
                            Response.Redirect("User/BuyerDashboard.aspx");
                        }
                        else if (role == "Seller")
                        {
                            Response.Redirect("Seller/SellerDashboard.aspx");
                        }
                        else if (role == "Admin")
                        {
                            Response.Redirect("Admin/AdminDashboard.aspx");
                        }
                        else
                        {
                            Response.Redirect("User/BuyerDashboard.aspx");
                        }
                    }
                    else
                    {
                        dr.Close();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter Email and Password');</script>");
            }
        }
    }
}
