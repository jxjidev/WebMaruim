/*
Script de implantação para WebMaruim

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "WebMaruim"
:setvar DefaultFilePrefix "WebMaruim"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 5eefaf7c-86a0-471a-9023-a55cea6d88e0 foi ignorada; o elemento [dbo].[Produto].[Id] (SqlSimpleColumn) não será renomeado para Id_Produto';


GO
PRINT N'A operação de refatoração Renomear com chave 9949e7e8-0f54-4d0c-a3c8-3f24a2caec10 foi ignorada; o elemento [dbo].[Categoria].[Id] (SqlSimpleColumn) não será renomeado para IdCategoria';


GO
PRINT N'Criando Tabela [dbo].[Categoria]...';


GO
CREATE TABLE [dbo].[Categoria] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Nome]      VARCHAR (255) NOT NULL,
    [Descricao] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[CategoriaProduto]...';


GO
CREATE TABLE [dbo].[CategoriaProduto] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [ProdutoId]   INT NOT NULL,
    [CategoriaId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Cliente]...';


GO
CREATE TABLE [dbo].[Cliente] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Nome]         VARCHAR (255) NOT NULL,
    [Email]        VARCHAR (255) NOT NULL,
    [Telefone]     VARCHAR (20)  NULL,
    [DataCadastro] DATETIME      NULL,
    [Ativo]        BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Endereco]...';


GO
CREATE TABLE [dbo].[Endereco] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [ClienteId]    INT           NOT NULL,
    [Cidade]       VARCHAR (100) NOT NULL,
    [Estado]       VARCHAR (2)   NOT NULL,
    [CEP]          VARCHAR (10)  NOT NULL,
    [Bairro]       VARCHAR (100) NULL,
    [Rua]          VARCHAR (255) NULL,
    [Numero]       VARCHAR (10)  NULL,
    [Complemento]  VARCHAR (255) NULL,
    [TipoEndereco] VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[ItemPedido]...';


GO
CREATE TABLE [dbo].[ItemPedido] (
    [Id]         INT             IDENTITY (1, 1) NOT NULL,
    [PedidoId]   INT             NOT NULL,
    [ProdutoId]  INT             NOT NULL,
    [Quantidade] INT             NOT NULL,
    [Preco]      DECIMAL (10, 2) NOT NULL,
    [Desconto]   DECIMAL (10, 2) NULL,
    [Total]      DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Pagamento]...';


GO
CREATE TABLE [dbo].[Pagamento] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [PedidoId]        INT             NOT NULL,
    [MetodoPagamento] VARCHAR (50)    NOT NULL,
    [StatusPagamento] VARCHAR (50)    NOT NULL,
    [Valor]           DECIMAL (10, 2) NOT NULL,
    [DataPagamento]   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Pedido]...';


GO
CREATE TABLE [dbo].[Pedido] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [UsuarioId]      INT             NOT NULL,
    [Data]           DATETIME        NOT NULL,
    [StatusPedidoId] INT             NOT NULL,
    [Total]          DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Produto]...';


GO
CREATE TABLE [dbo].[Produto] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Nome]        VARCHAR (255)   NOT NULL,
    [Preco]       DECIMAL (10, 2) NOT NULL,
    [Descricao]   TEXT            NULL,
    [ImagemUrl]   VARCHAR (255)   NULL,
    [CategoriaId] INT             NULL,
    [Estoque]     INT             NOT NULL,
    [Ativo]       BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[StatusPedido]...';


GO
CREATE TABLE [dbo].[StatusPedido] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Nome]      VARCHAR (50)  NOT NULL,
    [Descricao] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Usuario]...';


GO
CREATE TABLE [dbo].[Usuario] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [ClienteId]   INT           NOT NULL,
    [Username]    VARCHAR (50)  NOT NULL,
    [SenhaHash]   VARCHAR (255) NOT NULL,
    [DataCriacao] DATETIME      NULL,
    [Ativo]       BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Username] ASC)
);


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Cliente]...';


GO
ALTER TABLE [dbo].[Cliente]
    ADD DEFAULT GETDATE() FOR [DataCadastro];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Cliente]...';


GO
ALTER TABLE [dbo].[Cliente]
    ADD DEFAULT 1 FOR [Ativo];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[ItemPedido]...';


GO
ALTER TABLE [dbo].[ItemPedido]
    ADD DEFAULT 0 FOR [Desconto];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Pagamento]...';


GO
ALTER TABLE [dbo].[Pagamento]
    ADD DEFAULT 'Pendente' FOR [StatusPagamento];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Produto]...';


GO
ALTER TABLE [dbo].[Produto]
    ADD DEFAULT 1 FOR [Ativo];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Usuario]...';


GO
ALTER TABLE [dbo].[Usuario]
    ADD DEFAULT GETDATE() FOR [DataCriacao];


GO
PRINT N'Criando Restrição Padrão restrição sem nome em [dbo].[Usuario]...';


GO
ALTER TABLE [dbo].[Usuario]
    ADD DEFAULT 1 FOR [Ativo];


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[CategoriaProduto]...';


GO
ALTER TABLE [dbo].[CategoriaProduto] WITH NOCHECK
    ADD FOREIGN KEY ([ProdutoId]) REFERENCES [dbo].[Produto] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[CategoriaProduto]...';


GO
ALTER TABLE [dbo].[CategoriaProduto] WITH NOCHECK
    ADD FOREIGN KEY ([CategoriaId]) REFERENCES [dbo].[Categoria] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Endereco]...';


GO
ALTER TABLE [dbo].[Endereco] WITH NOCHECK
    ADD FOREIGN KEY ([ClienteId]) REFERENCES [dbo].[Cliente] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[ItemPedido]...';


GO
ALTER TABLE [dbo].[ItemPedido] WITH NOCHECK
    ADD FOREIGN KEY ([PedidoId]) REFERENCES [dbo].[Pedido] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[ItemPedido]...';


GO
ALTER TABLE [dbo].[ItemPedido] WITH NOCHECK
    ADD FOREIGN KEY ([ProdutoId]) REFERENCES [dbo].[Produto] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Pagamento]...';


GO
ALTER TABLE [dbo].[Pagamento] WITH NOCHECK
    ADD FOREIGN KEY ([PedidoId]) REFERENCES [dbo].[Pedido] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Pedido]...';


GO
ALTER TABLE [dbo].[Pedido] WITH NOCHECK
    ADD FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuario] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Pedido]...';


GO
ALTER TABLE [dbo].[Pedido] WITH NOCHECK
    ADD FOREIGN KEY ([StatusPedidoId]) REFERENCES [dbo].[StatusPedido] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Produto]...';


GO
ALTER TABLE [dbo].[Produto] WITH NOCHECK
    ADD FOREIGN KEY ([CategoriaId]) REFERENCES [dbo].[Categoria] ([Id]);


GO
PRINT N'Criando Chave Estrangeira restrição sem nome em [dbo].[Usuario]...';


GO
ALTER TABLE [dbo].[Usuario] WITH NOCHECK
    ADD FOREIGN KEY ([ClienteId]) REFERENCES [dbo].[Cliente] ([Id]);


GO
PRINT N'Criando Restrição de Verificação [dbo].[CK_Quantidade]...';


GO
ALTER TABLE [dbo].[ItemPedido] WITH NOCHECK
    ADD CONSTRAINT [CK_Quantidade] CHECK (Quantidade > 0);


GO
PRINT N'Criando Restrição de Verificação [dbo].[CK_Preco]...';


GO
ALTER TABLE [dbo].[ItemPedido] WITH NOCHECK
    ADD CONSTRAINT [CK_Preco] CHECK (Preco >= 0);


GO
PRINT N'Criando Restrição de Verificação [dbo].[CK_Estoque]...';


GO
ALTER TABLE [dbo].[Produto] WITH NOCHECK
    ADD CONSTRAINT [CK_Estoque] CHECK (Estoque >= 0);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5eefaf7c-86a0-471a-9023-a55cea6d88e0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5eefaf7c-86a0-471a-9023-a55cea6d88e0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9949e7e8-0f54-4d0c-a3c8-3f24a2caec10')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9949e7e8-0f54-4d0c-a3c8-3f24a2caec10')

GO

GO
PRINT N'Verificando os dados existentes em restrições recém-criadas';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.CategoriaProduto'), OBJECT_ID(N'dbo.Endereco'), OBJECT_ID(N'dbo.ItemPedido'), OBJECT_ID(N'dbo.Pagamento'), OBJECT_ID(N'dbo.Pedido'), OBJECT_ID(N'dbo.Produto'), OBJECT_ID(N'dbo.Usuario'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Verificando restrição: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Falha na verificação de restrição:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Erro ao verificar restrições', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Atualização concluída.';


GO
