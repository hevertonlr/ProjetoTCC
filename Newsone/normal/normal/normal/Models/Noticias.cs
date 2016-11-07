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
    /// <summary>
    ///     Representa as noticias do site e
    ///     contem metodos para trabalhar com elas
    /// </summary>
    [System.ComponentModel.DataObject]
    public class Noticias
    {
        private static readonly string _connectionString;

        private int codigoNoticia;
        private int codigoGaleria;
        private int codigoCidade;
        private string tituloNoticia;
        private System.DateTime dataNoticia;
        private string resumoNoticia;
        private string descricaoNoticia;
        private string fonteNoticia;
        private Nullable<int> visualizacoesNoticia;
        private int codigoCategoria;
        private string nomearquivoFoto;

        public string NomearquivoFoto
        {
            get { return nomearquivoFoto; }
            set { nomearquivoFoto = value; }
        }
        public int CodigoNoticia
        {
            get { return codigoNoticia; }
            set { codigoNoticia = value; }
        }
        public int CodigoGaleria
        {
            get { return codigoGaleria; }
            set { codigoGaleria = value; }
        }
        public int CodigoCidade
        {
            get { return codigoCidade; }
            set { codigoCidade = value; }
        }
        public string TituloNoticia
        {
            get { return tituloNoticia; }
            set { tituloNoticia = value; }
        }
        public System.DateTime DataNoticia
        {
            get { return dataNoticia; }
            set { dataNoticia = value; }
        }
        public string ResumoNoticia
        {
            get { return resumoNoticia; }
            set { resumoNoticia = value; }
        }
        public string DescricaoNoticia
        {
            get { return descricaoNoticia; }
            set { descricaoNoticia = value; }
        }
        public string FonteNoticia
        {
            get { return fonteNoticia; }
            set { fonteNoticia = value; }
        }
        public Nullable<int> VisualizacoesNoticia
        {
            get { return visualizacoesNoticia; }
            set { visualizacoesNoticia = value; }
        }
        public int CodigoCategoria
        {
            get { return codigoCategoria; }
            set { codigoCategoria = value; }
        }

        static Noticias() 
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

        public Noticias(MySqlDataReader reader)
        {
            nomearquivoFoto = (string)reader["NomearquivoFoto"];
            codigoNoticia = (int)reader["CodigoNoticia"];
            codigoGaleria = (int)reader["CodigoGaleria"];
            codigoCidade = (int)reader["CodigoCidade"];
            tituloNoticia = (string)reader["TituloNoticia"];
            dataNoticia = (System.DateTime)reader["DataNoticia"];
            resumoNoticia = (string)reader["ResumoNoticia"];
            descricaoNoticia = (string)reader["DescricaoNoticia"];
            fonteNoticia = (string)reader["FonteNoticia"];
            visualizacoesNoticia = (int)reader["VisualizacoesNoticia"];
            codigoCategoria = (int)reader["CodigoCategoria"];
        }

        /// <summary>
        /// seleciona todos as noticias da base
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Noticias> SelectNoticias(string query)
        {
            MySqlConnection con = new MySqlConnection(_connectionString);
            MySqlCommand cmd = new  MySqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            List<Noticias> results = new List<Noticias>();
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    results.Add(new Noticias(reader));
                }
            }
            con.Close();
            return results;
        }
    }
}