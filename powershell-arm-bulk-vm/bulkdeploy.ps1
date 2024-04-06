# Allows you to deploy identically configured VMs in bulk
# Each loop creates a seperate 'deployment' with the VM and it's name generated via the hostname var

# Define parameters
$resourceGroupName = "MyResourceGroup"
$templateFile = "template.json"
$parametersFile = "parameters.json"

# Loop to deploy VMs with different hostnames
for ($i = 1; $i -le 5; $i++) {
    $hostname = "ubuntuvm$i"  # Define the hostname
    $parameters = @{
        "hostname" = @{
            "value" = $hostname
        }
    }

    # Deploy the ARM template
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterFile $parametersFile `
                                   -Name "Deployment$i" `
                                   -Verbose
}