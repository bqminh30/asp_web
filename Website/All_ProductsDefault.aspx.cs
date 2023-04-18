﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class All_ProductsDefault : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void getProductsListByTypeAndFilter(string idDanhMuc, string Type)
        {
            Utility utility = new Utility();
            DataTable dt = utility.get_SanPham(idDanhMuc);
            Page.Title = "Đồ ăn dành cho " + Type;
            ListViewAllProducts.DataSource = dt;
            ListViewAllProducts.DataBind();
        }

        protected void getProductsListBySearchAndFilter(string search, int begin, int end, List<ProductsList> productsListsBySearchAndFilter, List<ProductsList> productsLists)
        {
            foreach (ProductsList product in productsLists)
            {
                if (product.sTenSanPham.ToLower().IndexOf(search) != -1 && product.fDonGia >= begin && product.fDonGia <= end)
                {
                    productsListsBySearchAndFilter.Add(product);
                }
            }
            ListViewAllProducts.DataSource = productsListsBySearchAndFilter;
            ListViewAllProducts.DataBind();
        }

        protected string totalProducts(List<ProductsList> productsListsByTypeAndFilter)
        {
            int total = 0;
            foreach (ProductsList product in productsListsByTypeAndFilter)
                total++;
            return total.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string idDanhMuc = Request.QueryString.Get("idDanhMuc");
            string sTenDanhMuc = Request.QueryString.Get("type");
            string value = Request.QueryString.Get("searchText");

            if (idDanhMuc != null && value == null)
            {
                getProductsListByTypeAndFilter(idDanhMuc, sTenDanhMuc);
            }
            else if (idDanhMuc == null && value == null)
            {
                Utility utility = new Utility();
                DataTable dt = utility.getAll_SanPham();
                ListViewAllProducts.DataSource = dt;
                ListViewAllProducts.DataBind();
            }

            if (value != null)
            {
                ListViewAllProducts.DataSource = GetFilteredData(value);
                ListViewAllProducts.DataBind();
            }

        }
        private List<Item> GetFilteredData(string searchText)
        {
            List<Item> items = new List<Item>();
            string connString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT * FROM tblSanPham WHERE sTenSanPham LIKE '%' + @searchText + '%'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@searchText", searchText);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Item item = new Item();
                            item.iSanPhamId = Convert.ToInt32(reader["iSanPhamId"]);
                            item.sTenSanPham = Convert.ToString(reader["sTenSanPham"]);
                            items.Add(item);
                        }
                    }
                }
            }
            return items;
        }

        public class Item
        {
            public int iSanPhamId { get; set; }
            public string sTenSanPham { get; set; }
        }


        //private List<ProductsList> GetFilteredData(string searchText)
        //{
        //    // TODO: Implement your data access logic here
        //    List<ProductsList> items = new List<ProductsList>();
        //    // Filter the data based on the search text
        //    items = GetItems().Where(x => x.ItemName.Contains(searchText)).ToList();
        //    return items;
        //}
        


    }
}