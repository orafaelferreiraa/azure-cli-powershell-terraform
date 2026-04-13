# =============================================
# Storage Account - Azure PowerShell
# =============================================

# Pré-requisito: Resource Group já criado
# New-AzResourceGroup -Name myRG-powershell -Location eastus

# 1. Criar Storage Account
New-AzStorageAccount `
  -ResourceGroupName myRG-powershell `
  -Name mystorageacctps2026 `
  -Location eastus `
  -SkuName Standard_LRS `
  -Kind StorageV2

# 2. Verificar se foi criado
Get-AzStorageAccount `
  -ResourceGroupName myRG-powershell `
  -Name mystorageacctps2026

# 3. Listar Storage Accounts no Resource Group
Get-AzStorageAccount -ResourceGroupName myRG-powershell | Format-Table StorageAccountName, Location

# 4. Obter as chaves de acesso
Get-AzStorageAccountKey `
  -ResourceGroupName myRG-powershell `
  -Name mystorageacctps2026

# 5. (Opcional) Deletar
# Remove-AzStorageAccount -ResourceGroupName myRG-powershell -Name mystorageacctps2026 -Force
