using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace bigpipe.Models
{
    public class Data
    {
        public string Id { get; set; }
        public string Content { get; set; }
        public IEnumerable<string> Css { get; set; }
        public IEnumerable<string> Js { get; set; }
        public string Param { get; set; }
    }

    public class Pagelet
    {
        public static JavaScriptSerializer jss = new JavaScriptSerializer();

        Func<string> Action { get; set; }
        public readonly string Container;
        public Data Data { get; set; }
        public readonly string Parameters;

        /// <summary>
        /// Manages a pagelet
        /// </summary>
        /// <param name="container">The id of the div container in which the output will be appended</param>
        /// <param name="action">The action to execute that will generate the output</param>
        public Pagelet(string container, Func<string> action)
        {
            this.Container = container;
            this.Action = action;
            this.Data = new Data() { Id = container };
        }

        public Pagelet(string container, string parameters, Func<string> action)
        {
            this.Container = container;
            this.Parameters = parameters;
            this.Action = action;
            this.Data = new Data() { Id = container, Param = parameters };
        }

        public Pagelet(string container, string parameters, Func<string> action, IEnumerable<string> css)
        {
            this.Container = container;
            this.Parameters = parameters;
            this.Action = action;
            this.Data = new Data()
            {
                Id = container,
                Param = parameters,
                Css = css
            };
        }

        public Pagelet(string container, Func<string> action, IEnumerable<string> css, IEnumerable<string> js)
        {
            this.Container = container;
            this.Action = action;
            this.Data = new Data()
            {
                Id = container,
                Css = css,
                Js = js
            };
        }

        public Pagelet(string container, string parameters, Func<string> action, IEnumerable<string> css, IEnumerable<string> js)
        {
            this.Container = container;
            this.Parameters = parameters;
            this.Action = action;
            this.Data = new Data()
            {
                Id = container,
                Param = parameters,
                Css = css,
                Js = js
            };
        }

        public void Execute()
        {
            this.Data.Content = Action();
        }

        public string Serialize()
        {
            return String.Format("<script>bigpipe.onPageletArrive({0});</script>", jss.Serialize(Data));
        }
    }
}