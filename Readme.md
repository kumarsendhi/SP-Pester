# SharePoint PowerShell Unit Testing with Pester

[Pester][] is a **BDD** based test runner for PowerShell.

[Pester][] provides a framework for running Unit Tests to execute and validate PowerShell commands.

This project tries to explain how [Pester][] framework can be used for Unit testing SharePoint PowerShell commands.

This Project will try to solve the following problems pertaining to SharePoint PowerShell Unit Testing:
1. The SharePoint Installed server is a mandatory requirement for SharePoint Unit Testing. 
2. Testing multiple versions of SharePoint with commands getting modified or new commands being added.

Let's understand what is done to solve the above problems and get seamless unit testing done on SharePoint.

1. Setting up the Pester in our Environment.
   * Goto [PowerShell Gallery][]. Click on Get PowerShellGet for PS 3 & 4.
        ![Powershell Gallery][PowerShellGallerySS]
   * Download the Package Management and Install the same.
   * Open Windows PowerShell
   * Execute the **Find-Module Pester** and **Install-Module Pester** as shown.
        ![Install Pester][InstallPester]

2. Setting up the Project to include Unit Testing.
   * Created a Project Structure as shown in the image below which solved this particular requirement.
        ![Folder Structure][dirStructure]

   * Mock the entire cmdlet of SharePoint. Used this [blog][] as reference.
     * This should be done in **SharePoint server**
     * Double Click the **MockGenerator.bat** file which is located in **SharePoint-With-Pester\Tests** folder.
     * It will generate the SharePoint Cmdlet mocks in **SharePoint-With-Pester\Stubs** folder.

2. Begin Unit Testing with [Pester][]


hi
hello
             

One of the challenges when we intially planned for implementing **Unit Test** for SharePoint is, We need an environment/server where SharePoint is installed 








[Pester]: https://github.com/pester/Pester/wiki
[blog]: https://blogs.msdn.microsoft.com/brian_farnhill/2015/09/27/better-approaches-to-unit-testing-powershell-scripts-that-call-sharepoint-cmdlets/
[PowerShell Gallery]: http://www.powershellgallery.com/
[dirStructure]:https://github.com/kumarsendhi/GitImages/blob/master/SP%20with%20Pester%20Folder%20Structure.png?raw=true
[PowerShellGallerySS]: https://github.com/kumarsendhi/GitImages/blob/master/Powershellgallery.png?raw=true
[InstallPester]: https://github.com/kumarsendhi/GitImages/blob/master/InstallPester.png?raw=true