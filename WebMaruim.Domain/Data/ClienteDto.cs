using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebMaruim.Domain.Data
{
    public class ClienteDto
    {
        public int Id {  get; set; }
        public string? Nome { get; set; }
        public string? Email { get; set; }
        public string? Telefone { get; set; }
        public DateTime DataCadastro { get; set; }
        public bool Ativo {  get; set; }
    }
}
