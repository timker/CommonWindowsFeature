# CommonWindowsFeature

CommonWindowsFeature is a simple DSC resource that Combines WindowsFeature and WindowsOptionalFeature into one Composite Resource.

Windows OS's either support WindowsFeature or WindowsOptionalFeature. DSC make it hard to use a DependsOn when the target OS could required either one of these resources. .

* OS Type needs to be known at design time
* It's best used with configurationData
Helps solve dependencies when when configuration can run on different sku's

[ConfigurationData Example](Examples/ExampleConfigurationData.ps1)

 ## Example
```
        Import-DSCResource -ModuleName CommonWindowsFeature
        CommonWindowsFeature IIS
        {
            WindowsFeatureName = 'Web-Server'
            WindowsOptionalFeatureName = 'IIS-WebServer'
            IsWindowsServer = $false # this should calculated from Node Data
        }

```



# Local Setup
  Ensure CommonWindowsFeature is in ModulePath, i.e (from root folder)
  
```
 $Env:PSModulePath += ";$(Get-Location)\"
```

