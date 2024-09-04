using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentValidation;
using FluentValidation.Validators;
using WebMaruim.Domain.Data;

namespace WebMaruim.Domain.Validacoes
{
    public class UsuarioValidacao : AbstractValidator<UsuarioDto>
    {
        public UsuarioValidacao()
        {

            RuleFor(usuario => usuario.UserName)
                .NotEmpty().WithMessage("O nome é obrigatório. ")
                .Length(2, 150).WithMessage("O nome precisa ter entre 2 a 150 caracteres. ");

            RuleFor(usuario => usuario.SenhaHash)
             .NotEmpty().WithMessage("A senha é obrigatória.")
            .MinimumLength(8).WithMessage("A senha deve ter no mínimo 8 caracteres.")
            .MaximumLength(100).WithMessage("A senha deve ter no máximo 100 caracteres.")
            .Matches(@"[0-9]").WithMessage("A senha deve conter pelo menos um número.")
            .Matches(@"[A-Z]").WithMessage("A senha deve conter pelo menos uma letra maiúscula.")
            .Matches(@"[a-z]").WithMessage("A senha deve conter pelo menos uma letra minúscula.")
            .Matches(@"[!@#$%^&*(),.?\:{ }|<>]").WithMessage("A senha deve conter pelo menos um caractere especial.")
            .Matches(@"^\S+$").WithMessage("A senha não pode conter espaços.");

            RuleFor(usuario => usuario.DataCriacao)
            .NotEmpty().WithMessage("A data de criação é obrigatória.")
            .LessThanOrEqualTo(DateTime.Now).WithMessage("A data de criação não pode ser uma data futura.")
            .GreaterThan(new DateTime(2024, 1, 1)).WithMessage("A data de criação deve ser após 01/01/2024.");

        }
    }
}
