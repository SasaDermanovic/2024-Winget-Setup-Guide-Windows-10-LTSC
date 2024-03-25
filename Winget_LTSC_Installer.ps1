Write-Host "Attempting to download and install dependencies"

# Download and install VCLibs package
try 
{
  Add-AppxPackage "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -Verbose
}
catch
{
  Write-Host "Failed to install VCLibs package. Error: $_" -ForegroundColor Red
  exit 1
}

# Download XAML package
try 
{
  Invoke-WebRequest -Uri "https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.8.6" -OutFile "microsoft.ui.xaml.2.8.6.zip" -ErrorAction Stop
}
catch
{
  Write-Host "Failed to download XAML package. Error: $_" -ForegroundColor Red
  exit 1
}

# Extract XAML package
try 
{
  Expand-Archive .\microsoft.ui.xaml.2.8.6.zip -Force -ErrorAction Stop
} 
catch
{
  Write-Host "Failed to extract XAML package. Error: $_" -ForegroundColor Red
  exit 1
}

# Install XAML package
try
{
  Add-AppPackage .\microsoft.ui.xaml.2.8.6\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx -Verbose
}
catch 
{
  Write-Host "Failed to install XAML package. Error: $_" -ForegroundColor Red
  exit 1
}

Write-Host "Dependencies installed successfully."

Write-Host "Attempting to download and install Winget"

# Download Winget package
try 
{
  Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.7.10661/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -ErrorAction Stop
  Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.7.10661/9ea36fa38dd3449c94cc839961888850_License1.xml" -OutFile ".\9ea36fa38dd3449c94cc839961888850_License1.xml" -ErrorAction Stop
} 
catch 
{
  Write-Host "Failed to download Winget package. Error: $_" -ForegroundColor Red
  exit 1
}

# Install Winget package
try 
{
  Add-AppxProvisionedPackage -Online -PackagePath ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -LicensePath ".\9ea36fa38dd3449c94cc839961888850_License1.xml" -Verbose
} 
catch 
{
  Write-Host "Failed to install Winget package. Error: $_" -ForegroundColor Red
  exit 1
}

Write-Host "Winget installed successfully."
