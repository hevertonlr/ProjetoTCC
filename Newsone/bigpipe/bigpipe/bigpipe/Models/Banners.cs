using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using MySql.Web;
using System.Web.Configuration;
using System.Data;
using bigpipe.Models;

namespace bigpipe.Models
{
    /// <summary>
    ///     Representa os bannners do site e
    ///     contem metodos para trabalhar com eles
    /// </summary>
    [System.ComponentModel.DataObject]
    public class Banners
    {
        private static readonly string _connectionString;

        private int codigoBanner;
        private string tituloBanner;
        private string subtituloBanner;
        private string linkBanner;
        private string arquivoBanner;
        private int codigoCategoria;

        public int CodigoBanner
        {
            get { return codigoBanner; }
            set { codigoBanner = value; }
        }
        public string TituloBanner
        {
            get { return tituloBanner; }
            set { tituloBanner = value; }
        }
        public string SubtituloBanner
        {
            get { return subtituloBanner; }
            set { subtituloBanner = value; }
        }
        public string LinkBanner
        {
            get { return linkBanner; }
            set { linkBanner = value; }
        }
        public string ArquivoBanner
        {
            get { return arquivoBanner; }
            set { arquivoBanner = value; }
        }
        public int CodigoCategoria
        {
            get { return codigoCategoria; }
            set { codigoCategoria = value; }
        }



        static Banners() 
        {
            Util utl = new Util();
            string vURL = utl.RetornaURL();

            if (utl.RetornaURL() == "localhost")
            {
                _connectionString = WebConfigurationManager.ConnectionStrings["newsConnectionString"].ConnectionString;
                //stringconexao = MySqlConfiguration.Settings.CurrentConfiguration.ConnectionStrings["newsConnectionString"].ToString();
            }
            else
            {
                _connectionString = WebConfigurationManager.ConnectionStrings["newsoneConnectionString"].ConnectionString;
            }

        }

        public Banners(MySqlDataReader reader)
        { 
            codigoBanner = (int)reader["CodigoBanner"];
            tituloBanner = (string)reader["TituloBanner"];
            linkBanner = (string)reader["LinkBanner"];
            arquivoBanner = (string)reader["ArquivoBanner"];
            codigoCategoria = (int)reader["CodigoCategoria"];
            subtituloBanner = (string)reader["SubtituloBanner"];
        }

        /// <summary>
        /// seleciona todos os banners da base
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Banners> SelectBanners(string query)
        {
            MySqlConnection con = new MySqlConnection(_connectionString);
            MySqlCommand cmd = new  MySqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            List<Banners> results = new List<Banners>();
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    results.Add(new Banners(reader));
                }
            }
            con.Close();
            return results;
        }
    }
}