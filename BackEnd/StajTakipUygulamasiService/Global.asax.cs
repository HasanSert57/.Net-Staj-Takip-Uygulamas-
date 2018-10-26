using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace StajTakipUygulamasiService
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            Response.AddHeader("Access-Control-Allow-Origin", "*");
            if (Context.Request.HttpMethod.Equals("OPTIONS"))
            {
                Response.AddHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
                Response.AddHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
                Response.StatusCode = (int)System.Net.HttpStatusCode.OK;
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}