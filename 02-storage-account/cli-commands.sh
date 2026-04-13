#!/bin/bash

# =============================================
# Storage Account - Azure CLI
# =============================================

# Pré-requisito: Resource Group já criado
# az group create --name myRG-cli --location eastus

# 1. Criar Storage Account
az storage account create \
  --name mystorageacctcli2026 \
  --resource-group myRG-cli \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2

# 2. Verificar se foi criado
az storage account show \
  --name mystorageacctcli2026 \
  --resource-group myRG-cli \
  --output table

# 3. Listar Storage Accounts no Resource Group
az storage account list \
  --resource-group myRG-cli \
  --output table

# 4. Obter as chaves de acesso
az storage account keys list \
  --account-name mystorageacctcli2026 \
  --resource-group myRG-cli \
  --output table

# 5. (Opcional) Deletar
# az storage account delete --name mystorageacctcli2026 --resource-group myRG-cli --yes
