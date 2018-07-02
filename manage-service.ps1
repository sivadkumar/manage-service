
Param(
[string]$servicename,
[string]$serviceaction
)
write-host "Name of the Service you want to Manage: $servicename"
write-host "Action you want to Perform on the Service: $serviceaction"


function validateConnection {

    param($compName)

    if ( (Test-Connection -ComputerName $compName -Count 2 -Quiet) -eq "True" )
    {
        Write-Host "$compName is Online" -ForegroundColor Green
    }
    else 
    {
        Write-Host "$compName is Offline" -ForegroundColor Red
    }

}



$hostnames = @("192.168.145.140", "192.168.145.145")



ForEach ($hostname in $hostnames) {
    validateConnection -compName $hostname
}