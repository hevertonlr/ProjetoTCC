using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using MySql.Web;
using System.Web.Configuration;
using System.Data;

namespace normal.Models
{
    /// <summary>
    ///     Representa os bannners do site e
    ///     contem metodos para trabalhar com eles
    /// </summary>
    [System.ComponentModel.DataObject]
    public class Videos
    {
        private static readonly string _connectionString;

        private int codigoVideo;
        private string tituloVideo;
        private string resumoVideo;
        private string htmlVideo;
        private Nullable<System.DateTime> dataVideo;

        public int CodigoVideo
        {
            get { return codigoVideo; }
            set { codigoVideo = value; }
        }

        public string TituloVideo
        {
            get { return tituloVideo; }
            set { tituloVideo = value; }
        }

        public string ResumoVideo
        {
            get { return resumoVideo; }
            set { resumoVideo = value; }
        }

        public string HtmlVideo
        {
            get { return htmlVideo; }
            set { htmlVideo = value; }
        }

        public Nullable<System.DateTime> DataVideo
        {
            get { return dataVideo; }
            set { dataVideo = value; }
        }

        
        static Videos() 
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["newsConnectionString"].ConnectionString;

        }

        public Videos(MySqlDataReader reader)
        {

            codigoVideo = (int)reader["CodigoVideo"];
            tituloVideo = (string)reader["TituloVideo"];
            resumoVideo = (string)reader["ResumoVideo"];
            htmlVideo = (string)reader["HtmlVideo"];
            //dataVideo = (System.DateTime)reader["DataVideo"];
        }

        /// <summary>
        /// seleciona todos os videos da base
        /// </summary>
        /// <returns></returns>
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Videos> SelectVideos(string query)
        {
            MySqlConnection con = new MySqlConnection(_connectionString);
            MySqlCommand cmd = new  MySqlCommand(query, con);
            cmd.CommandType = CommandType.Text;
            List<Videos> results = new List<Videos>();
            using (con)
            {
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    results.Add(new Videos(reader));
                }
            }
            con.Close();
            return results;
        }
    }
}