using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebMaruim.Domain.Data
{
    public class UsuarioDto
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? SenhaHash { get; set; }
        public DateTime DataCriacao { get; set; }
        public bool Ativo {  get; set; }

    }
}
