param storageAccountName string
param location string
param env string
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
])
param storageAccountType string = 'Standard_LRS'
param bicepVersion string

resource storageAccountRes 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: toLower(storageAccountName)
  location: location
  sku: {
    name: storageAccountType
  }
  properties: {
    accessTier: 'Cool'
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
  kind: 'StorageV2'
  tags: {
    Environment: toLower(env)
    BicepVersion: bicepVersion
  }
}

output storageAccountId string = storageAccountRes.id
output storageAccountName string = storageAccountRes.name
