#!/bin/bash

# Inicia SQL Server em background
/opt/mssql-tools18/bin/sqlservr &
SERVER_PID=$!

# Aguarda o SQL Server ficar pronto
echo "Aguardando SQL Server iniciar..."
for i in {1..60}; do
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
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "FIAP@2026" -i /var/opt/mssql/seed-database.sql 2>/dev/null

if [ $? -eq 0 ]; then
  echo "✓ Script de seed executado com sucesso!"
else
  echo "⚠ Aviso: Script de seed não executou (banco pode já existir)"
fi

# Mantém o SQL Server rodando
wait $SERVER_PID
