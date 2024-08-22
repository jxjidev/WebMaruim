# Projeto Trabalho Programação Web - Ecommerce 

# Resumo do Projeto: 

## Tema: 

Desenvolvimento de uma plataforma web chamada Maruim para a venda de bebidas, com foco em fornecer uma experiência simples e intuitiva para os usuários, facilitando a navegação e a compra de produtos variados. 

## Escopo: 

## Funcionalidades principais: 

### Exibição de catálogo de produtos com filtro e pesquisa. 

### Página de produto detalhada com informações e avaliações. 

### Carrinho de compras e checkout. 

### Integração com sistemas de pagamento. 

### Área do cliente com histórico de pedidos e informações de conta. 

### Sistema de recomendação baseado em preferências. 

### Painel administrativo para gerenciamento de produtos, pedidos e usuários. 

 

## Arquitetura do Projeto: 

 

### O projeto será dividido em dois módulos (Front-End e Back-End) de trabalho com a distribuição de tarefas entre os integrantes do grupo de acordo com a divisão dos módulos do projeto. Os módulos de trabalho e as duplas responsáveis estão descritas abaixo: 

 

### FrontEnd: Gabriel Costa e Thiago de Freitas Saraiva   

### BackEnd: João Antonio David e Jéssica Roecker Arns 

 

![image](https://github.com/user-attachments/assets/f8a17a0e-ccff-44aa-9b6f-d0121bca2efc) 

 

 

# Descrição detalhada do projeto 

E-commerce de Venda de Licor 

Bem-vindo ao repositório do nosso projeto de e-commerce! Aqui, estamos desenvolvendo uma plataforma online para a venda de licor, usando ASP.NET Core MVC e Dapper para gerenciar os dados. Abaixo, você encontrará tudo o que precisa saber sobre o projeto, desde a arquitetura até as principais páginas do site. 

Sobre o Projeto 

Nosso objetivo é criar uma loja online onde os amantes de licor possam encontrar e comprar seus produtos favoritos com facilidade. Utilizamos o padrão Model-View-Controller (MVC) e a biblioteca Dapper para garantir uma experiência de compra suave e eficiente. 

Arquitetura do Sistema 

Modelo (Model): Onde mantemos nossos dados e a lógica de negócios. 

Visão (View): A parte visual do site, onde os dados são exibidos. 

Controlador (Controller): Faz a conexão entre o modelo e a visão, gerenciando as ações do usuário. 

Arquitetura do Projeto: Monolítica 

Configuração do Projeto 

Dependências e Tecnologias 

Dapper: Uma ferramenta leve para acessar e manipular nossos dados. 

Banco de Dados: Usamos SQL Server para gerenciar nosso banco de dados relacional. 

Linguagens de Programação: Utilizaremos as linguagens HTML/CSS e JavaScript para Front-End. C# para o Back-End. 

Modelagem de Dados 

Aqui está uma visão detalhada das principais entidades e suas propriedades: 

Produto 

Id: Identificador único do produto. 

Nome: Nome do produto. 

Preco: Preço do produto. 

Descricao: Descrição detalhada do produto. 

ImagemUrl: URL da imagem do produto. 

Categoria 

Id: Identificador único da categoria. 

Nome: Nome da categoria. 

Pedido 

Id: Identificador único do pedido. 

UsuarioId: Identificador do usuário que fez o pedido. 

Data: Data em que o pedido foi realizado. 

Itens: Lista de itens incluídos no pedido. 

ItemPedido 

Id: Identificador único do item do pedido. 

PedidoId: Identificador do pedido ao qual o item pertence. 

ProdutoId: Identificador do produto. 

Quantidade: Quantidade do produto no pedido. 

Preco: Preço do produto no momento do pedido. 

Cliente 

Id: Identificador único do cliente. 

Nome: Nome completo do cliente. 

Email: Endereço de e-mail do cliente. 

Telefone: Número de telefone do cliente. 

Endereco: Endereço de entrega do cliente, incluindo rua, número, cidade, estado e CEP. 

 

Camada de Acesso a Dados 

Usamos Dapper para facilitar as operações no banco de dados. Temos repositórios dedicados para cada tipo de dado, garantindo que tudo funcione de forma rápida e eficiente. 

Principais Páginas do Site 

Página Inicial 

Objetivo: Dar as boas-vindas aos visitantes e apresentar os produtos e categorias. 

O que inclui: Um carrossel de imagens para promoções, seções com produtos em destaque, categorias e um rodapé com links importantes. 

Página de Lista de Produtos 

Objetivo: Mostrar todos os produtos disponíveis em uma categoria ou resultado de busca. 

O que inclui: Filtros para encontrar o que você procura, uma lista de produtos com opções de ordenação e paginação, e um rodapé com links úteis. 

Página de Detalhes do Produto 

Objetivo: Oferecer uma visão completa de um produto específico. 

O que inclui: Imagem em destaque, descrição detalhada, preço, avaliações de clientes e sugestões de produtos relacionados. 

Página de Carrinho de Compras 

Objetivo: Mostrar os itens que o cliente escolheu e preparar para a finalização da compra. 

O que inclui: Uma lista dos itens no carrinho, um resumo do pedido e botões para continuar comprando ou seguir para o checkout. 

Página de Checkout 

Objetivo: Coletar as informações necessárias para completar a compra. 

O que inclui: Formulário para informações de envio, opções de pagamento e um resumo final do pedido. 

Página de Conta do Usuário 

Objetivo: Permitir que os usuários gerenciem suas informações e visualizem seus pedidos. 

O que inclui: Dados da conta, histórico de pedidos e opções de configuração. 

Página de Sobre Nós 

Objetivo: Contar a história da empresa e compartilhar sua missão e visão. 

O que inclui: Descrição da empresa, sua história e informações sobre a equipe. 

Configuração Adicional 

Routing 

Configuramos as rotas no Startup.cs para garantir que cada URL leve ao controlador e ação corretos. 

Middleware 

Configuramos middleware para autenticação e autorização, garantindo que o acesso às funcionalidades do site seja seguro e apropriado. 

Conclusão 

Estamos empolgados com o desenvolvimento deste e-commerce e acreditamos que ele proporcionará uma experiência excelente para os usuários. Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato! 
