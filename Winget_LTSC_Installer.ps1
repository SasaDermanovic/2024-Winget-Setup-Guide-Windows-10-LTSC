Write-Host "Attempting to download and install dependencies"
Add-AppxPackage "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
Invoke-WebRequest -Uri "https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.0" -OutFile "microsoft.ui.xaml.2.7.0.zip"
Expand-Archive .\microsoft.ui.xaml.2.7.0.zip
Add-AppPackage .\microsoft.ui.xaml.2.7.0\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx

Write-Host "Dependencies installed, attempting to download and install Winget"
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.5.2201/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.5.2201/e9f07317387242099dd02cb57aa04c37_License1.xml -OutFile .\e9f07317387242099dd02cb57aa04c37_License1.xml
Add-AppxProvisionedPackage -Online -PackagePath .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -LicensePath .\3463fe9ad25e44f28630526aa9ad5648_License1.xml -Verbose