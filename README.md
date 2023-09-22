# bicep-demo-01

// install azure bicep 
Url: https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install

Tools to install:
 - Visual studio (VS) Code
 - Bicep Extension in VS-Code
 - Azure PowerShell, Url: https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-powershell

// check if bicep is already installed  
cmd: bicep --version  
// log in to azure account by CLI  (open neu terminal in VS-Code)
cmd: az login

// show my account   
cmd: az account show --output table

// set specific subscription    
cmd: az account set --subscription "your-subscription-name-or-id"

// Convert bicep to ARM-Template  
cmd: bicep build .\main.bicep
cmd: bicep build .\storage-account.bicep

// Prerequisite: create resource group manually in azure portal before deploying storage account

// check what will be happen if you are trying to create a storage account on target scope of resource group  
cmd: az deployment group create --what-if  --resource-group rg-rgname-dev-001 --template-file .\main.bicep --parameters .\main.parameters.json

// deploy azure storage account on target scope of resource group  
 cmd: az deployment group create --resource-group rg-rgname-dev-001 --template-file .\main.bicep --parameters .\main.parameters.json

// deploy resource on target scope of subscription  
 cmd: az deployment sub create --location westeurope --template-file --template-file .\main.bicep --parameters .\main.parameters.json


