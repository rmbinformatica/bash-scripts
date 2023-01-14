#!/bin/bash

# Descrição:
# Esse script percorre todos os arquivos no diretório atual e calcula o hash de cada um deles
# utilizando o comando sha256sum. Ele armazena os hashes em um array associativo, onde a chave
# é o hash e o valor é o nome do arquivo. Ele então verifica se o hash já existe no array.
# Se sim, verifica se o arquivo é um duplicado e apaga os duplicados nesses casos, mantendo
# somente a primeira ocorrência de cada arquivo.

# Autor: Renato Monteiro Batista (http://renato.ovh)

# Creates an associative array to store file hashes
declare -A fileHashes

# Iterate through all files in the current directory
for file in *; do
  # Calculate the hash of the current file
  fileHash=$(sha256sum "$file" | cut -f1 -d' ')

  # Check if the hash already exists in the associative array
  if [ -n "${fileHashes[$fileHash]}" ]; then
    # If it does, check if the file is a duplicate
    if [ "${fileHashes[$fileHash]}" != "$file" ]; then
      # If it is, delete the duplicate file
      rm "$file"
      echo "Deleted duplicate file: $file"
    fi
  else
    # If the hash does not exist in the array, add it
    fileHashes[$fileHash]="$file"
  fi
done
