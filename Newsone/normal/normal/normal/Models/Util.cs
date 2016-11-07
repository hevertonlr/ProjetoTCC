using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Globalization;
using System;

namespace normal.Models
{
    public class Util
    {
        public string RetornaURL()
        {
            string vURL = HttpContext.Current.Request.Url.Host;
            return vURL;
        }

        public string formatadata(DateTime data)
        {
            string dataformatada = "";

            dataformatada += data.ToString("dddd, dd", new CultureInfo("pt-BR"));
            dataformatada += " de "+data.ToString("MMMM", new CultureInfo("pt-BR"));
            dataformatada += " de " + data.ToString("yyyy", new CultureInfo("pt-BR"));
            
            return dataformatada;
        }

        public string RemoverAcentos(string texto)
        {
            if (string.IsNullOrEmpty(texto))
                return String.Empty;
            else
            {
                byte[] bytes = System.Text.Encoding.GetEncoding("iso-8859-8").GetBytes(texto);
                return System.Text.Encoding.UTF8.GetString(bytes);
            }
        }
        public string cortaString(string str, int size)
        {
            if (str == null || str == "undefined" || str == "" || size.ToString() == null || size.ToString() == "undefined" || size.ToString() == "")
            {
                return str;
            }

            var shortText = str;
            if (str.Length >= size + 3)
            {
                shortText = str.Substring(0, size);
                shortText = string.Concat(shortText, "...");
            }
            return shortText;
        }
    }
}
