Connect-AzAccount

$token = (Get-AzAccessToken -ResourceUrl 'https://management.azure.com').Token
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization","Bearer $token")

$url = "https://management.azure.com/tenants?api-version=2020-01-01"

# Send the request
Invoke-RestMethod $url -Method 'Get' -Headers $headers


# Good article: https://adatum.no/azure/azure-active-directory/azure-token-from-a-custom-app-registration
