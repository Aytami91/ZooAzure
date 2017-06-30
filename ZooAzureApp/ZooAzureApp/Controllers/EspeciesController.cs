using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ZooAzureApp
{
    public class EspeciesController : ApiController
    {
        // GET: api/Especies
        public RespuestaAPI Get()
        {
            RespuestaAPI resultado = new RespuestaAPI();
            List<Especies> especie = new List<Especies>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    especie = Db.GetEspeciesId();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch (Exception ex)
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = especie.Count;
            resultado.dataEspecies = especie;
            return resultado;
        }

        // GET: api/Especies/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Especies
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Especies/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Especies/5
        [HttpDelete]
        public RespuestaAPI Delete(int idEspecie)
        {
            RespuestaAPI resultado = new RespuestaAPI();
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.EliminarEspecie(idEspecie);
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch (Exception ex)
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = filasAfectadas;
            resultado.dataEspecies = null;
            return resultado;
        }
    
    }
}
