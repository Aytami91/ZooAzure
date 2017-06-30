using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZooAzureApp
{
    public class Especies
    {
        public int idEspecie { get; set; }
        public int idClasificacion { get; set; }
        public int idTipoAnimal { get; set; }
        public string nombre { get; set; }
        public string nPatas { get; set; }
        public bool esMascota { get; set; }


    }
}