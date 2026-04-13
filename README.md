# Azure Resource Provisioning — CLI vs PowerShell vs Terraform

Comparativo prático de criação de recursos no Azure usando três abordagens: **Azure CLI**, **Azure PowerShell** e **Terraform**.

---

## Pré-requisitos

| Ferramenta | Instalação | Verificar |
|---|---|---|
| [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) | `winget install Microsoft.AzureCLI` | `az --version` |
| [Azure PowerShell](https://learn.microsoft.com/powershell/azure/install-az-ps) | `Install-Module -Name Az -Scope CurrentUser` | `Get-Module Az -ListAvailable` |
| [Terraform](https://developer.hashicorp.com/terraform/downloads) | `winget install Hashicorp.Terraform` | `terraform --version` |
| Conta Azure | [Criar conta gratuita](https://azure.microsoft.com/free/) | — |

---

## Estrutura do Projeto

```
├── 01-resource-group/
│   ├── cli-commands.sh          # Azure CLI
│   ├── powershell-commands.ps1  # Azure PowerShell
│   └── main.tf                  # Terraform
│
├── 02-storage-account/
│   ├── cli-commands.sh          # Azure CLI
│   ├── powershell-commands.ps1  # Azure PowerShell
│   └── main.tf                  # Terraform
│
└── README.md
```

---

## Autenticação

Antes de tudo, faça login na sua conta Azure:

```bash
# Azure CLI
az login
```

```powershell
# Azure PowerShell
Connect-AzAccount
```

```bash
# Terraform (usa as credenciais do Azure CLI)
az login
```

---

## 01 — Resource Group

### Azure CLI

```bash
cd 01-resource-group
bash cli-commands.sh
# Ou execute os comandos individualmente:
az group create --name myRG-cli --location eastus
```

### Azure PowerShell

```powershell
cd 01-resource-group
# Execute os comandos do arquivo:
New-AzResourceGroup -Name myRG-powershell -Location eastus
```

### Terraform

```bash
cd 01-resource-group
terraform init      # Baixa o provider azurerm
terraform plan      # Mostra o que será criado
terraform apply     # Cria o recurso (confirme com "yes")
```

Para destruir:

```bash
terraform destroy   # Remove tudo que foi criado (confirme com "yes")
```

---

## 02 — Storage Account

> **Importante:** O Storage Account depende de um Resource Group. Crie o RG antes (etapa 01) ou use o Terraform que já inclui a dependência.

### Azure CLI

```bash
cd 02-storage-account

# 1. Certifique-se que o RG existe
az group create --name myRG-cli --location eastus

# 2. Crie o Storage Account
az storage account create \
  --name mystorageacctcli2026 \
  --resource-group myRG-cli \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2
```

### Azure PowerShell

```powershell
cd 02-storage-account

# 1. Certifique-se que o RG existe
New-AzResourceGroup -Name myRG-powershell -Location eastus

# 2. Crie o Storage Account
New-AzStorageAccount `
  -ResourceGroupName myRG-powershell `
  -Name mystorageacctps2026 `
  -Location eastus `
  -SkuName Standard_LRS `
  -Kind StorageV2
```

### Terraform

```bash
cd 02-storage-account
terraform init      # Baixa o provider azurerm
terraform plan      # Mostra RG + Storage Account que serão criados
terraform apply     # Cria ambos (confirme com "yes")
```

Para destruir:

```bash
terraform destroy   # Remove Storage Account e RG (confirme com "yes")
```

---

## Comparativo Rápido

| | Azure CLI | Azure PowerShell | Terraform |
|---|---|---|---|
| Tipo | Imperativo | Imperativo | Declarativo |
| Gerencia estado | Não | Não | Sim (`terraform.tfstate`) |
| Idempotente | Manual | Manual | Automático |
| Destruir recursos | Comando individual | Comando individual | `terraform destroy` |
| Ideal para | Tarefas rápidas | Automação Windows | IaC em produção |

---

## Limpeza

Para não gerar custos, remova os recursos após os testes:

```bash
# CLI
az group delete --name myRG-cli --yes --no-wait
```

```powershell
# PowerShell
Remove-AzResourceGroup -Name myRG-powershell -Force
```

```bash
# Terraform (dentro de cada pasta)
terraform destroy
```

---

## Licença

MIT
