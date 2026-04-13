#!/bin/bash

# =============================================
# Resource Group - Azure CLI
# =============================================

# 1. Login
az login

# 2. Criar Resource Group
az group create \
  --name RG-cli \
  --location eastus

# 3. Verificar se foi criado
az group show --name RG-cli

# 4. Listar todos os Resource Groups
az group list --output table

# 5. (Opcional) Deletar
# az group delete --name RG-cli --yes --no-wait
