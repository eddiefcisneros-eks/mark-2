# Read input from stdin
$jsonInput = az ad signed-in-user show --query displayName
#$jsonInput = [Console]::In.ReadLine() | ConvertFrom-Json

# Extract values from the input JSON
$name = $jsonInput.name
#$age = $jsonInput.age

# Do some processing, e.g., generate a message
$message = t values from the input JSON
$name = $jsonInput.name

# Create a PowerShell custom object
$outputObject = [PSCustomObject]@{
  message = $message
  timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ"
}

# Convert the object to JSON and output it
$outputObject | ConvertTo-Json