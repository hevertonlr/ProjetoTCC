using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using MySql.Web;
using System.Web.Configuration;
using System.Data;
using normal.Models;

namespace normal.Models
{
    [System.ComponentModel.DataObject]
    public class Fotos
    {
        private static readonly string _connectionString;

        private int codigoFoto;
        private string descricaoFoto;
        private string nomearquivoFoto;
        private int codigoGaleria;

        public int CodigoFoto
        {
            get { return codigoFoto; }
            set { codigoFoto = value; }
        }
        
        public string DescricaoFoto
        {
            get { return descricaoFoto; }
            set { descricaoFoto = value; }
        }
        
        public string NomearquivoFoto
        {
            get { return nomearquivoFoto; }
            set { nomearquivoFoto = value; }
        }
        
        public int CodigoGaleria
        {
            get { return codigoGaleria; }
            set { codigoGaleria = value; }
        }

        static Fotos() 
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

        public Fotos(MySqlDataReader reader)
        {
            codigoFoto = (int)reader["CodigoFoto"];
            descricaoFoto = (string)reader["DescricaoFoto"];
            nomearquivoFoto = (string)reader["NomearquivoFoto"];
            codigoGaleria = (int)reader["CodigoGaleria"];
        }

        /// <summary>
        /// seleciona todos os banners da base
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Fotos> SelectFotos(string query)
        {
            MySqlConnection con = new MySqlConnection(_connectionString);
            MySqlCommand cmd = new  MySqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            List<Fotos> results = new List<Fotos>();
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    results.Add(new Fotos(reader));
                }
            }
            con.Close();
            return results;
        }
    }
}