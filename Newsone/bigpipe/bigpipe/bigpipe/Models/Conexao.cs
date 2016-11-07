using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData.Util;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Collections;
using System.Configuration;



namespace bigpipe.Models
{
    public class BD
    {
        private string stringconexao;
        private MySqlConnection conn;

        public BD()
        {
            Util utl = new Util();
            string vURL = utl.RetornaURL();

            if (utl.RetornaURL() == "localhost")
            {
                stringconexao = ConfigurationManager.ConnectionStrings["newsConnectionString"].ConnectionString;
                //stringconexao = MySqlConfiguration.Settings.CurrentConfiguration.ConnectionStrings["newsConnectionString"].ToString();
            }
            else 
            {
                stringconexao = ConfigurationManager.ConnectionStrings["newsone"].ConnectionString;
            }

            conn = null;
        }

        public string StringConexao
        {
            get { return stringconexao; }
            set { stringconexao = value; }
        }

        public MySqlConnection Conexao
        {
            get { return conn; }
            set { conn = value; }
        }

        public MySqlConnection Conecta()
        {
            MySqlConnection vCon = new MySqlConnection();
            try{
                vCon.ConnectionString = stringconexao;
                vCon.Open();
                conn = vCon;
            }
            catch (Exception ex) {
                conn = null;
                throw new Exception(ex.Message);
            }
            return conn;
        }

        public void Desconecta()
        {
            conn.Close();
        }

        public MySqlDataReader retornaQuery(string query)
        {
            try
            {
                MySqlCommand vComando = new MySqlCommand(query, conn);
                var retornaQuery = vComando.ExecuteReader();
                return retornaQuery;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        
        public void executaQuery(string query)
        {
            try
            {
                //Instância o mysqlcommand com a query sql que será executada e a conexão.
                MySqlCommand comando = new MySqlCommand(query, conn);

                //Executa a query sql.
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
    }
}