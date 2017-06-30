using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ZooAzureApp
{
    public class Db
    {
        private static SqlConnection conexion = null;
        public static void conectar() {
            try
            {
                string cadenaConexion = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
                conexion = new SqlConnection();
                conexion.ConnectionString = cadenaConexion;
                conexion.Open();

                

            }
            catch (Exception)
            {
                if (conexion != null)
                {
                    if (conexion.State != ConnectionState.Closed)
                    {
                        conexion.Close();
                    }
                    conexion.Dispose();
                    conexion = null;

                }                
            }
        }
        public static bool EstaLaConexionAbierta()
        {
            return conexion.State == ConnectionState.Open;
        }
        public static void Desconectar()
        {
            if (conexion != null)
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                }
            }
        }
    }
}