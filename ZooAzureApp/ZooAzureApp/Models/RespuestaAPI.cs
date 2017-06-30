using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZooAzureApp
{
    public class RespuestaAPI
    {
        public string error { get; set; }
        public int totalElementos { get; set; }
        public List<Especies> dataEspecies { get; set; }
    }
}