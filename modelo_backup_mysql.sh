#!/bin/bash

# Script de backup completo de banco de dados
# (C) 2016 - RMB Informatica
HOJE=`date +%Y-%m-%d`

echo "Inicializando rotina de backup para o dia $HOJE..."
echo "Exportando banco de dados..."
mysqldump --all-databases > $HOJE.sql
echo "Comprimindo dados..."
gzip -9 $HOJE.sql
echo "Criando arquivo de sessao ftp..."
cp pre.ftp $HOJE.ftp
echo "put $HOJE.sql.gz" >> $HOJE.ftp
echo "bye" >> $HOJE.ftp
echo "Transferindo arquivos..."
lftp -f $HOJE.ftp
echo "Excluindo temporarios..."
rm -f $HOJE.ftp $HOJE.sql.gz