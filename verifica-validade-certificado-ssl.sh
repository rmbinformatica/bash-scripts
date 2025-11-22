#!/bin/bash

# Crie um arquivo dominios.txt com a lista de domínios a serem verificados
# um dominio por linha

# CONFIGURAÇÕES
LIMITE=15  # Dias antes da expiração para alertar
EMAIL="seuemail@exemplo.com"  # Opcional: para envio de alerta
ARQUIVO_DOMINIOS="dominios.txt"

# Verifica se o arquivo existe
if [ ! -f "$ARQUIVO_DOMINIOS" ]; then
  echo "Arquivo $ARQUIVO_DOMINIOS não encontrado!"
  exit 1
fi

# Loop pelos domínios
while IFS= read -r DOMINIO || [ -n "$DOMINIO" ]; do
  # Ignora linhas vazias ou comentários
  [[ -z "$DOMINIO" || "$DOMINIO" =~ ^# ]] && continue

  # Obtém data de expiração
  EXPIRACAO=$(echo | openssl s_client -servername "$DOMINIO" -connect "$DOMINIO:443" 2>/dev/null \
    | openssl x509 -noout -enddate | cut -d= -f2)

  # Verifica se conseguiu obter a data
  if [ -z "$EXPIRACAO" ]; then
    echo "❌ Não foi possível verificar o certificado de $DOMINIO"
    continue
  fi

  # Converte para timestamp
  EXPIRACAO_TS=$(date -d "$EXPIRACAO" +%s)
  HOJE_TS=$(date +%s)
  DIAS_RESTANTES=$(( (EXPIRACAO_TS - HOJE_TS) / 86400 ))

  # Exibe resultado
  echo "🔍 $DOMINIO: expira em $DIAS_RESTANTES dias ($EXPIRACAO)"

  # Alerta se estiver próximo da expiração
  if [ "$DIAS_RESTANTES" -le "$LIMITE" ]; then
    echo "⚠️ Alerta: certificado de $DOMINIO expira em menos de $LIMITE dias!"

    # Envia e-mail (requer 'mail' instalado e configurado)
    echo "Certificado SSL de $DOMINIO expira em $DIAS_RESTANTES dias ($EXPIRACAO)" \
      | mail -s "Alerta de Expiração SSL - $DOMINIO" "$EMAIL"
  fi

done < "$ARQUIVO_DOMINIOS"
