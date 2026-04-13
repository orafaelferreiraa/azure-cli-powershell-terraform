# =============================================
# Resource Group - Azure PowerShell
# =============================================

# 1. Login
Connect-AzAccount

# 2. Criar Resource Group
New-AzResourceGroup -Name RG-powershell -Location eastus

# 3. Verificar se foi criado
Get-AzResourceGroup -Name RG-powershell

# 4. Listar todos os Resource Groups
Get-AzResourceGroup | Format-Table ResourceGroupName, Location

# 5. (Opcional) Deletar
# Remove-AzResourceGroup -Name RG-powershell -Force
