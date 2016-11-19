$ConfigData = @{
    AllNodes = 
    @(
        
        @{
            NodeName = "localhost";
            IsWindowsServer = $false
        }, 
        @{
            NodeName = "SomeWindowsMachine";
            IsWindowsServer = $true
        }
    );      
} 

configuration MyConfiguration
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName CommonWindowsFeature 
    node $AllNodes.NodeName
    {
        CommonWindowsFeature IIS
        {
            WindowsFeatureName = 'Web-Server'
            WindowsOptionalFeatureName = 'IIS-WebServer'
        }


        File ConfigFile
        {
            DestinationPath = "c:\\temp\\config.xml"
            Contents = "abc"

            #now we can Depend on IIS is setup for any windows IIS
            DependsOn = '[CommonWindowsFeature]IIS'
        }
    }
}

#MyConfiguration -ConfigurationData $ConfigData