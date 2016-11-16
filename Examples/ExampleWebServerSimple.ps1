Configuration ExampleWebServerSimple {
    
    node ('localhost')
    {
       
        Import-DSCResource -ModuleName CommonWindowsFeature
        CommonWindowsFeature IIS
        {
            WindowsFeatureName = 'Web-Server','Web-Asp-Net45' , 'Web-IP-Security','Web-WebSockets'
            WindowsOptionalFeatureName = 'IIS-WebServer','IIS-ASPNET45', 'IIS-IPSecurity','IIS-WebSockets'
            IsWindowsServer = $false
        }

    }
}

ExampleWebServerSimple
Test-DscConfiguration -Path .\ExampleWebServerSimple