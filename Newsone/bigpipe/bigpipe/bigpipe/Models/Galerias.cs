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
    [System.ComponentModel.DataObject]
    public class Galerias
    {
        private static readonly string _connectionString;

        private int codigoGaleria;
        private string titulogaleria;
        private string descricaogaleria;
        private string conteudoGaleria;
        private int codigoCategoria;
        private string nomearquivoFoto;

        public int CodigoGaleria
        {
            get { return codigoGaleria; }
            set { codigoGaleria = value; }
        }
        public string Titulogaleria
        {
            get { return titulogaleria; }
            set { titulogaleria = value; }
        }
        public string Descricaogaleria
        {
            get { return descricaogaleria; }
            set { descricaogaleria = value; }
        }
        public string ConteudoGaleria
        {
            get { return conteudoGaleria; }
            set { conteudoGaleria = value; }
        }
        public int CodigoCategoria
        {
            get { return codigoCategoria; }
            set { codigoCategoria = value; }
        }
        public string NomearquivoFoto
        {
            get { return nomearquivoFoto; }
            set { nomearquivoFoto = value; }
        }
        static Galerias() 
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

        public Galerias(MySqlDataReader reader)
        {
            codigoGaleria = (int)reader["CodigoGaleria"];
            titulogaleria = (string)reader["Titulogaleria"];
            descricaogaleria = (string)reader["Descricaogaleria"];
            conteudoGaleria = (string)reader["ConteudoGaleria"];
            codigoCategoria = (int)reader["CodigoCategoria"];
            nomearquivoFoto = (string)reader["NomearquivoFoto"];
        }

        /// <summary>
        /// seleciona todos os banners da base
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Galerias> SelectGalerias(string query)
        {
            MySqlConnection con = new MySqlConnection(_connectionString);
            MySqlCommand cmd = new  MySqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            List<Galerias> results = new List<Galerias>();
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    results.Add(new Galerias(reader));
                }
            }
            con.Close();
            return results;
        }

    }
}