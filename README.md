# fiap-tech-challenge-2026

Backend (MVP) para gestão de ordens de serviço da oficina GarageFlow Service, desenvolvido para o Tech Challenge da pós-graduação em Software Architecture da FIAP. 

Por Eduarda Aguiar Angelo e Raphael Barbosa Rodrigues.

## Tecnologias

- **.NET 8** - ASP.NET Core Web API
- **Entity Framework Core** - ORM com SQL Server
- **MediatR** - Padrão CQRS
- **JWT** - Autenticação
- **Swagger** - Documentação da API
- **xUnit + FluentAssertions** - Testes unitários
- **Docker** - Containerização

## Arquitetura

O projeto segue **Clean Architecture** com conceitos de **DDD**:

```text
src/
├── GarageFlowService.Domain/          # Entidades, enums, interfaces, exceções
├── GarageFlowService.Application/     # Casos de uso, DTOs, interfaces de aplicação
├── GarageFlowService.Infrastructure/  # EF Core, repositórios, UnitOfWork
└── GarageFlowService.API/             # Controllers, autenticação, Swagger

tests/
└── GarageFlowService.Tests/           # Testes unitários
```

## Pré-requisitos

- `.NET 8 SDK`
- `Docker Desktop` (ou Docker Engine + Compose)

## Como iniciar o projeto

### 1) Com Docker (recomendado)

Na raiz do repositório (`fiap-tech-challenge-2026`):

```bash
docker compose up -d --build
```

#### Inicializar o banco de dados

Após os containers estarem rodando, execute as migrações do Entity Framework para criar as tabelas:

```bash
dotnet ef database update --project src/GarageFlowService.Infrastructure --startup-project src/GarageFlowService.API
```

#### Popular o banco com dados de teste

Execute o script de seed para inserir dados de teste:

```bash
sqlcmd -S localhost,1433 -U sa -P "FIAP@2026" -i seed-database.sql
```

Swagger:
- `http://localhost:5000/swagger`

Parar containers:

```bash
docker compose down
```

### 2) Rodando localmente 

Na raiz do repositório:

```bash
dotnet restore src/GarageFlowService.slnx
```

#### Aplicar migrações

```bash
dotnet ef database update --project src/GarageFlowService.Infrastructure --startup-project src/GarageFlowService.API
```

#### Popular com dados de teste

```bash
sqlcmd -S localhost,1433 -U sa -P "FIAP@2026" -i seed-database.sql
```

#### Rodar a API

```bash
dotnet run --project src/GarageFlowService.API
```

Com o perfil atual da API, o Swagger abre automaticamente em:
- `https://localhost:7129/swagger`

> Observação: para execução local, é necessário ter um SQL Server acessível na connection string configurada. A connection string padrão está em `appsettings.Development.json`.

## Testes

```bash
dotnet test tests/GarageFlowService.Tests/GarageFlowService.Tests.csproj
```

## Autenticação

`POST /api/auth/login`

**Credenciais padrão para teste:**
```json
{
  "username": "admin",
  "password": "Admin@123"
}
```

> Nota: As credenciais padrão são configuradas no seed database. Para produção, use credenciais seguras.

## Endpoints principais

### Work Orders
- `GET /api/workorders`
- `GET /api/workorders/{id}`
- `GET /api/workorders/{id}/budget`
- `POST /api/workorders` (auth)
- `PATCH /api/workorders/{id}/status` (auth)
- `POST /api/workorders/{id}/services` (auth)
- `POST /api/workorders/{id}/parts` (auth)

### Customers
- `GET /api/customers`
- `GET /api/customers/{id}`
- `POST /api/customers` (auth)
- `PUT /api/customers/{id}` (auth)

### Vehicles
- `GET /api/vehicles/customer/{customerId}`
- `POST /api/vehicles` (auth)

### Services
- `GET /api/services`
- `POST /api/services` (auth)

### Parts
- `GET /api/parts`
- `POST /api/parts` (auth)
- `PATCH /api/parts/{id}/stock` (auth)
