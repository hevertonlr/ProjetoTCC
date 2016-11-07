using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bigpipe.Models;
using System.Threading.Tasks;

namespace bigpipe.Helpers
{
    public static class BigPipeHelper
    {
        public static void IncludeCss(this HtmlHelper helper, string cssFile)
        {
            helper.ViewContext.HttpContext.Response.Write(
                string.Format("<link type=\"text/css\" rel=\"stylesheet\" href=\"{0}\" />", cssFile));
        }

        public static void IncludeJs(this HtmlHelper helper, string jsFile)
        {
            helper.ViewContext.HttpContext.Response.Write(
                string.Format("<script type=\"text/javascript\" src=\"{0}\"></script>", jsFile));
        }

        public static void RegisterPagelet(this HtmlHelper helper, Pagelet pagelet)
        {
            var context = helper.ViewContext.HttpContext;
            bool jsEnabled = context.Request.Cookies["js"] != null && context.Request.Cookies["js"].Value == "true";

            if (!jsEnabled || true)
            {
                //JavaScript is not enabled, so we write the execution to the output and
                //not register the pagelet
                if (pagelet.Data.Css != null)
                    foreach (string css in pagelet.Data.Css)
                        helper.IncludeCss(css);
                
                pagelet.Execute();
                context.Response.Write(string.Format("<div id=\"{0}\" {1} >{2}</div>", pagelet.Container, pagelet.Parameters, pagelet.Data.Content));
                if (pagelet.Data.Js != null)
                    foreach (string js in pagelet.Data.Js)
                        helper.IncludeJs(js);

                context.Response.Flush();
                return;
            }

            List<Pagelet> pagelets = (List<Pagelet>)context.Items["Pagelets"];
            if (pagelets == null)
            {
                pagelets = new List<Pagelet>();
                context.Items["Pagelets"] = pagelets;
            }
            pagelets.Add(pagelet);

            //write pagelet container 
            var parameters = pagelet.Parameters+" ";
            context.Response.Write("<div id=\"" + pagelet.Container + "\" "+parameters+" ></div>");

        }

        static readonly object _locker = new object();
        public static void ExecutePagelets(this HtmlHelper helper)
        {
            var context = helper.ViewContext.HttpContext;
            List<Pagelet> pagelets = (List<Pagelet>)context.Items["Pagelets"];
            if (pagelets == null) return;

            //initialize bigpipe object
            context.Response.Write(String.Format("<script> var bigpipe = new BigPipe({0});</script>", pagelets.Count));
            context.Response.Flush();

            Parallel.For(0, pagelets.Count, (i) =>
            {
                System.Diagnostics.Debug.WriteLine("Pagelet " + i + " started at " + DateTime.Now.ToLongTimeString());
                var pagelet = pagelets[i];
                pagelet.Execute();

                lock (_locker)
                {
                    context.Response.Write(pagelet.Serialize());
                    context.Response.Flush();
                }
                System.Diagnostics.Debug.WriteLine("Pagelet " + i + " finished at " + DateTime.Now.ToLongTimeString());

            });
        }
    }
}