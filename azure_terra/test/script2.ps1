$result = az ad signed-in-user show --query displayName --output Json
Write-Output $result 

