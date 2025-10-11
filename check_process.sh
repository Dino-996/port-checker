#!/bin/bash

# Controlla se l'utente ha passato una porta
if [ -z "$1" ]; then
  echo "Uso: $0 <porta>"
  exit 1
fi

PORT=$1

# Controlla se c'è un processo in ascolto sulla porta
PID=$(lsof -t -iTCP:$PORT -sTCP:LISTEN)

if [ -z "$PID" ]; then
  echo "La porta $PORT è libera."
else
  echo "La porta $PORT è occupata dal processo PID $PID."
  read -p "Vuoi terminare questo processo? (y/N): " yn
  case $yn in
      [Yy]* ) 
          kill -9 $PID
          echo "Processo $PID terminato. La porta $PORT è ora libera."
          ;;
      * ) 
          echo "Processo non terminato. Porta ancora occupata."
          ;;
  esac
fi