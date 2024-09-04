using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentValidation;
using Microsoft.Extensions.Options;
using WebMaruim.Domain.Data;

namespace WebMaruim.Domain.Validacoes
{
    public class ClienteValidacao : AbstractValidator<ClienteDto>
    {
        public ClienteValidacao()
        {
            RuleFor(usuario => usuario.Nome)
                           .NotEmpty().WithMessage("O nome é obrigatório. ")
                           .Length(2, 150).WithMessage("O nome precisa ter entre 2 a 150 caracteres. ");

            RuleFor(usuario => usuario.DataCadastro)
                .NotEmpty().WithMessage("A data de criação é obrigatória.")
                .LessThanOrEqualTo(DateTime.Now).WithMessage("A data de criação não pode ser uma data futura.")
                .GreaterThan(new DateTime(2024, 1, 1)).WithMessage("A data de criação deve ser após 01/01/2024.");

            RuleFor(usuario => usuario.Email)
                .NotEmpty().WithMessage("O e-mail é obrigatório.")
                .EmailAddress().WithMessage("O e-mail deve ser válido.");

            RuleFor(usuario => usuario.Telefone)
                .NotEmpty().WithMessage("O telefone é obrigatório.")
                .Matches(@"^\(?\d{2}\)?[\s-]?\d{4,5}[\s-]?\d{4}$")
                .WithMessage("O telefone deve estar no formato válido, ex: (11) 91234-5678.")
                .Length(10, 11).WithMessage("O telefone deve ter entre 10 a 11 dígitos.");


        }


    }
}
