FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["src/GarageFlowService.API/GarageFlowService.API.csproj", "src/GarageFlowService.API/"]
COPY ["src/GarageFlowService.Application/GarageFlowService.Application.csproj", "src/GarageFlowService.Application/"]
COPY ["src/GarageFlowService.Infrastructure/GarageFlowService.Infrastructure.csproj", "src/GarageFlowService.Infrastructure/"]
COPY ["src/GarageFlowService.Domain/GarageFlowService.Domain.csproj", "src/GarageFlowService.Domain/"]
RUN dotnet restore "src/GarageFlowService.API/GarageFlowService.API.csproj"
COPY . .
WORKDIR "/src/src/GarageFlowService.API"
RUN dotnet build "GarageFlowService.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GarageFlowService.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GarageFlowService.API.dll"]
