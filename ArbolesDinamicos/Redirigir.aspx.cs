using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArbolesDinamicos
{
    public partial class Redirigir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Tome esta medida por que por alguna razon no borra los datos del panel asi que mejor la reinicio de 0
            Response.Redirect("GraficadorDeArboles.aspx");
        }
    }
}