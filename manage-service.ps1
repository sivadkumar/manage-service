
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
        service_Action -serviceaction $serviceaction -servicename $servicename

    }
    else 
    {
        Write-Host "$compName is Offline" -ForegroundColor Red
    }

}

function service_Action {

    param($serviceaction, $servicename)

    $action = $serviceaction.ToLower()

    switch ($serviceaction) {
        'start' {
            Write-Host "Going to Start the Service $servicename"
            Start-Service -servicename $servicename -PassThru
        }
        'stop' {
            Write-Host "Going to Stop the Service $servicename"
            Stop-Service -servicename $servicename -PassThru
        }
        'status' {
            Write-Host "Going to check teh Status of the Service $servicename"
            Get-Service -servicename $servicename
        }
    }

}


$hostnames = @("192.168.145.140", "192.168.145.145")



ForEach ($hostname in $hostnames) {
    validateConnection -compName $hostname
}