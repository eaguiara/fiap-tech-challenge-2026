#!/bin/bash

# Aguarda o SQL Server ficar pronto
echo "Aguardando SQL Server iniciar..."
for i in {1..30}; do
  /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "FIAP@2026" -Q "SELECT 1" -No -C 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "SQL Server pronto!"
    break
  fi
  echo "Tentativa $i - SQL Server ainda não está pronto. Aguardando..."
  sleep 2
done

# Executa o seed script
echo "Executando script de seed do banco de dados..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "FIAP@2026" -i /var/opt/mssql/seed-database.sql

echo "Script de seed executado com sucesso!"
