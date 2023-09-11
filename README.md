# Setting up Winget (Windows Package Manager) on Windows 10 LTSC 2021 without Microsoft Store

## Introduction

Winget, short for Windows Package Manager, is a command-line tool introduced by Microsoft to simplify the installation, removal, and management of software packages on Windows systems. It made its debut with Windows 10, starting with version 2004. Winget offers several benefits, including streamlined software installation, automatic updates, and scriptability, making it a powerful tool for developers and users alike. In this guide, we'll walk you through setting up Winget on Windows 10 LTSC 2021 without relying on the Microsoft Store, so you can take full advantage of its capabilities.

## Prerequisites

Before we begin, ensure that you have the following prerequisites:

1. **PowerShell as Administrator:** You'll need PowerShell in administrator mode to execute some of the commands in this guide. 

2. **Execution Policy Setting:** To run certain PowerShell commands like `Add-AppxPackage` without encountering execution policy restrictions, your PowerShell execution policy should be set to "RemoteSigned" or "Unrestricted." To check your current execution policy, open PowerShell as an administrator and run the following command:

   ```powershell
   Get-ExecutionPolicy
To set the execution policy to "RemoteSigned," run:
```powershell
 Set-ExecutionPolicy RemoteSigned
```
Or, if necessary, to set it to "Unrestricted," use:
```powershell
 Set-ExecutionPolicy Unrestricted
```
  
  
 ## Installation
Before installing Winget, please ensure that the following dependencies are installed on your system: 

1.**VC++ v14 Desktop Framework:** This framework includes the Microsoft Visual C++ Runtime Libraries (VCLibs) for 64-bit Windows desktop applications.
* If your system architecture is 64-bit, install the framework using the following command:
    ```powershell
    Add-AppxPackage "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
    ```
 * If your system architecture is 32-bit, install the framework using the following command:
    ```powershell
    Add-AppxPackage "https://aka.ms/Microsoft.VCLibs.x86.14.00.Desktop.appx"
    ```
2. **Microsoft.UI.Xaml.2.7:** Before installation, you'll need to download the Microsoft.UI.Xaml.2.7 package from the following URL:
     [Download Microsoft.UI.Xaml.2.7 Package](https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.0) 

* After downloading the package, follow these steps in PowerShell to extract it:
- Rename nupkg in order to extract it:
```powershell
mv .\microsoft.ui.xaml.2.7.0.nupkg .\microsoft.ui.xaml.2.7.0.zip
```
- Use the following command to extract the nupkg archive:
```powershell
Expand-Archive .\microsoft.ui.xaml.2.7.0.zip
```
* Next, navigate to the appropriate directory based on your system architecture:
- For **64-bit** architecture, navigate to:
    ```powershell
    cd .\microsoft.ui.xaml.2.7.0\tools\AppX\x64\Release
    ```
- For **32-bit** architecture, navigate to:
    ```powershell
    cd .\microsoft.ui.xaml.2.7.0\tools\AppX\x86\Release
    ```  
* After cd-ing into the Release directory, execute the following command to install the UI Xaml 2.7 package:
```powershell
Add-AppxPackage .\Microsoft.UI.Xaml.2.7.appx
```
With these dependencies correctly installed and the appropriate directory navigated, you can proceed to install Winget.

To get the latest version of Winget as of September 2023, which is version 1.5.2201 released in August 2023, follow these steps:

1. Open your web browser and go to the following URL:
   [Winget Latest Releases](https://github.com/microsoft/winget-cli/releases/latest)

2. On the GitHub page, scroll down to find the latest release. Look for the version "1.5.2201" or a newer version if available.

3. In the Assets section of the release, you should see a file with the extension ".msixbundle" at the bottom of the page.

4. Download the ".msixbundle" file and license file. The file that contains the Winget package in MSIXBundle format and the file that contains the licesne is in XML format.

5. Once the download is complete, navigate to the folder where the ".msixbundle" and ".xml" file are downloaded.

6. Open PowerShell in administrator mode by searching for "PowerShell" in the Start menu, right-clicking on "Windows PowerShell," and selecting "Run as administrator."

7. In the PowerShell window, execute the following command to install Winget using the downloaded MSIXBundle:
    ```powershell
    Add-AppxProvisionedPackage -Online -PackagePath "PATH TO MSIXBUNDLE" -LicensePath "PATH TO XML" -Verbose
    ```
8.    Verify that the installation succeeded by running winget in PowerShell. If no errors occur then you're done!
