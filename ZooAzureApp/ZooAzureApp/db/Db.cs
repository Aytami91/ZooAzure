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
        public static void Conectar() {
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
        public static List<Especies> GetEspeciesId() {
            List<Especies> especie = null;
            string consultaSQL = "dbo.GetEspeciesId";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = comando.ExecuteReader();
            especie = new List<Especies>();
            while (reader.Read())
            {
                especie.Add(new Especies() {
                    idEspecie = (int)reader["idEspecies"],
                    idClasificacion = (int)reader["idClasificacion"],
                    idTipoAnimal = (int)reader["idTipoAnimal"],
                    nombre = reader["nombre"].ToString(),
                    nPatas = reader["nPatas"].ToString(),
                    esMascota = (bool)reader["esMascota"],
                    
                });
            }
            return especie;
        }
        public static List<Especies> EliminarEspecie(int idEspecie) {
            string consultaSQL = "dbo.EliminarEspecie";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter()
            {
                ParameterName = "idEspecie",
                Value = idEspecie,
                SqlDbType = SqlDbType.BigInt
                
        });
                int filasAfectadas = comando.ExecuteNonQuery();
                return filasAfectadas;
        }
        public static int AgregarEspecie(Especies especie)
        {
            string procedimiento = "dbo.AgregarEspecie";

            SqlCommand comando = new SqlCommand(procedimiento, conexion);
            comando.CommandType = CommandType.StoredProcedure;
            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = "idEspecie";
            parametro.SqlDbType = SqlDbType.Int;
            parametro.SqlValue = especie.idEspecie;

            parametro.ParameterName = "idTipoAnimal";
            parametro.SqlDbType = SqlDbType.Int;
            parametro.SqlValue = especie.idTipoAnimal;

            parametro.ParameterName = "idClasificacion";
            parametro.SqlDbType = SqlDbType.Int;
            parametro.SqlValue = especie.idClasificacion;

            parametro.ParameterName = "nombre";
            parametro.SqlDbType = SqlDbType.VarChar;
            parametro.SqlValue = especie.nombre;

            parametro.ParameterName = "nPatas";
            parametro.SqlDbType = SqlDbType.VarChar;
            parametro.SqlValue = especie.nPatas;

            parametro.ParameterName = "esMascota";
            parametro.SqlDbType = SqlDbType.Bit;
            parametro.SqlValue = especie.esMascota;

            comando.Parameters.Add(parametro);
            int filasAfectadas = comando.ExecuteNonQuery();

            return filasAfectadas;
        }
    }
}