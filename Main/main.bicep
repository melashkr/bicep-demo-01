targetScope = 'resourceGroup'

param location string
param stAccountName string
param env string
param storageAccountType string
param bicepVersion string

var productName = 'abc'
var prefix = 'st'
var storageAccountSequence = '001'
var stAccountFullName = '${prefix}${stAccountName}${storageAccountSequence}'

module storageAccountModule '../Modules/storage-account.bicep' = {
  name: 'stModule-${productName}-${env}-${storageAccountSequence}'
  params: {
    location: location
    env: env
    storageAccountName: stAccountFullName
    storageAccountType: storageAccountType
    bicepVersion: bicepVersion
  }
}
