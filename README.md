# CommonWindowsFeature
Combines WindowsFeature and WindowsOptionalFeature into one Resource.

Helps solve dependencies when when configuration can run on different sku's

replaces WindowsFeature & WindowsOptionalFeature

 ## Example
```
        Import-DSCResource -ModuleName CommonWindowsFeature
        CommonWindowsFeature IIS
        {
            WindowsFeatureName = 'Web-Server'
            WindowsOptionalFeatureName = 'IIS-WebServer'
            IsWindowsServer = $false
        }

```



# Local Setup
  Ensure CommonWindowsFeature is in ModulePath, i.e (from root folder)
  
```
 $Env:PSModulePath += ";$(Get-Location)\"
```

