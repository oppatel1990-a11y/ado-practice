$csvFile = ".\resource.csv"
$tfvarsFile = ".\terraform.tfvars"

$csvFile = ".\resource.csv"
$tfvarsFile = ".\terraform.tfvars"

$lines = Get-Content $csvFile

$output = "resource_groups = {`n"

foreach ($line in $lines | Select-Object -Skip 1) {

    if ([string]::IsNullOrWhiteSpace($line)) {
        continue
    }

    $parts = $line -split '\s+'

    $name = $parts[0]
    $location = ($parts[1..($parts.Length - 1)] -join " ")

    $output += "  $name = {`n"
    $output += "    name     = `"$name`"`n"
    $output += "    location = `"$location`"`n"
    $output += "  }`n"
}

$output += "}`n"

Set-Content -Path $tfvarsFile -Value $output

Write-Host "terraform.tfvars created successfully!"