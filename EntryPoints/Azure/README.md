# Azure Powershell Scripts

## Getting started - [Installation of the AZ Powershell](https://learn.microsoft.com/en-us/powershell/azure/install-azps-windows?view=azps-14.2.0&tabs=powershell&pivots=windows-psgallery)

Determine if you have the AzureRM PowerShell module installed

- Get-Module -Name AzureRM -ListAvailable

Check the PowerShell execution policy

- Get-ExecutionPolicy -List

Set the PowerShell execution policy to remote signed:

- Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Use the Install-Module cmdlet to install the Az PowerShell module:
- Install-Module -Name Az -Repository PSGallery -Force

Use Update-Module to update to the latest version of the Az PowerShell module:
- Update-Module -Name Az -Force

NOTE: Uninstallation can be complicated if you have more than one version of the Az PowerShell module installed. Because of this complexity, we only support uninstalling all versions of the Az PowerShell module that are installed.

First, you'll need a list of all the Az PowerShell module versions installed on your system.

```
Get-InstalledModule -Name Az -AllVersions -OutVariable AzVersions
```

You can use the following example to generate a list of all the Az PowerShell modules that need to be uninstalled in addition to the Az module.

```
($AzVersions |
  ForEach-Object {
    Import-Clixml -Path (Join-Path -Path $_.InstalledLocation -ChildPath PSGetModuleInfo.xml)
  }).Dependencies.Name | Sort-Object -Descending -Unique -OutVariable AzModules
```

Remove the Az modules from memory and then uninstall them.

```
$AzModules |
  ForEach-Object {
    Remove-Module -Name $_ -ErrorAction SilentlyContinue
    Write-Output "Attempting to uninstall module: $_"
    Uninstall-Module -Name $_ -AllVersions
  }
```

The final step is to remove the Az PowerShell module.

```
Remove-Module -Name Az -ErrorAction SilentlyContinue
Uninstall-Module -Name Az -AllVersions
```

## Sign in, then get access bearer token

```
Connect-AzAccount
Get-AzAccessToken -ResourceUrl "https://management.azure.com"
```

There are many REST APIs in Azure 😉 . The Azure Resource Manager (ARM) API as "normal Rest API' and Microsoft Graph API for accessing many M365 resources in a unified way, including Azure Active Directory objects.

In other words, you use ARM API to manage Azure resources, and MS Graph API to manage AAD objects (users, groups, etc.).