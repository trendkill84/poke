ipmo poke -force

[reflection.assembly]::LoadWithPartialName("microsoft.sharepoint") > $null
[reflection.assembly]::LoadWithPartialName("microsoft.sharepoint.publishing") > $null
[reflection.assembly]::LoadWithPartialName("Microsoft.Office.Server") > $null

$type = peek -typename "System.Text.StringBuilder" -verbose -IncludeDotNetAssemblies

$VerbosePreference = "Continue"

$instance = $type.__CreateInstance()

if ($instance) {    
    $instance | gm
}

"length: {0}" -f $instance.Length
"append returned: {0}" -f $instance.Append([system.int16]42)
"length: {0}" -f $instance.Length
