using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArbolesDinamicos
{
    public partial class GraficadorDeArboles : System.Web.UI.Page
    {
        protected static int parentesis = 0;
        protected static int nivel = 0;
        protected static int inicio = 0;
        protected static int final = 0;
        private static string graficando = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                graficando = "";
                lblInstrucciones.Text = "Bienvenidos a mi aplicación, esta aplicación grafica arboles basados en los parámetros dados en la tarea";
                pnlresultado.Visible = false;
                pnlfiltros.Visible = true;
            }
        }

        protected void btnGraficar_Click(object sender, EventArgs e)
        {
            graficando = "";
            pnlgraficador.Controls.Clear();
            String cadenaTexto = "";
            cadenaTexto = txtGraficador.Text;
            string resultado = "";

            if (string.IsNullOrEmpty(cadenaTexto))
            {
                MostrarMensaje("El campo esta vacio.", 1);
            }
            else
            {
                cadenaTexto = cadenaTexto.Replace(" ", "");
                recorrer(cadenaTexto);
                pnlfiltros.Visible = false;
                pnlresultado.Visible = true;
            }


        }

        public void recorrer(string cadena)
        {
            for (int i = 0; i < cadena.Length; i++)
            {
                Char caracterActual, caracterSiguiente;
                if (i < cadena.Length - 1)
                {
                    caracterActual = cadena[i];
                    caracterSiguiente = cadena[i + 1];

                    if (Char.IsLetter(caracterActual) && caracterSiguiente == '(')
                    {
                        if (nivel > 0)
                        {
                            graficando += "<td>";
                            graficando += "<table class='nivel" + nivel + "'><tr><th colspan='100%'>" + caracterActual + "</th></tr><tr>";
                        }
                        else
                        {
                            graficando += "<table class='principal'><tr><th colspan='100%'>" + caracterActual + "</th></tr><tr>";
                        }

                    }
                    else if (Char.IsLetter(caracterActual) && caracterSiguiente == ')')
                    {
                        graficando += "<td>" + caracterActual + "</td></tr></table>";
                        if (nivel > 0)
                        {
                            graficando += "</td>";
                        }
                    }
                    else if (Char.IsLetter(caracterActual) && caracterSiguiente == ',')
                    {
                        graficando += "<td>-" + caracterActual + "</td>";
                    }
                    else if (caracterActual == ',' || caracterActual == ')' || caracterActual == '(')
                    {
                        if (caracterActual == '(')
                        {
                            nivel++;
                        }
                        else if (caracterActual == ')')
                        {
                            nivel--;
                        }
                    }
                }

            }
            pnlgraficador.Controls.Add(new LiteralControl(cadena));
            pnlgraficador.Controls.Add(new LiteralControl(graficando));
            graficando = "";
        }
        public void MostrarMensaje(String desc, int estado = 2)
        {
            //Si el estado es 0 lanza alerta de informacion
            //Si el estado es 1 lanza alerta de advertencia
            //Si el estado es 2 lanza alerta de realizado
            //Si el estado es 3 lanza alerta de error
            string[] tipoalerta = { "info", "warning", "success", "error" };
            string alerta = "toastr." + tipoalerta[estado] + "('" + desc + "', 'Generador de Arboles', {" +
            "'progressBar': true," +
            "'positionClass': 'toast-bottom-right'," +
                "'timeOut': '10000'," +
                "'extendedTimeOut': '10000'" +
            "});";
            Page.ClientScript.RegisterStartupScript(GetType(), "mostrar", alerta, true);

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Redirigir.aspx");
        }
    }
}