Configuration CommonWindowsFeature
{
    PARAM (
    [string[]]$WindowsFeatureName,
    [string[]]$WindowsOptionalFeatureName,
    [bool]$IsWindowsServer
    )


    
    
    if($IsWindowsServer)
    {

        foreach($CurrentWindowsFeatureName in $WindowsFeatureName)
        {
            WindowsFeature "WindowsFeature$CurrentWindowsFeatureName" 
            {
                Ensure = 'Present'
                Name = $CurrentWindowsFeatureName
            }
        }
    } else {

        foreach($CurrentWindowsOptionalFeatureName in $WindowsOptionalFeatureName)
        {
             WindowsOptionalFeature "OptionalFeature$CurrentWindowsOptionalFeatureName" 
             {
                Ensure = 'Enable'
                Name = $CurrentWindowsOptionalFeatureName
            }
        }
  
    }
 
}


