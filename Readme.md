# SharePoint PowerShell Unit Testing with Pester

[Pester][] is a **BDD** based test runner for PowerShell.

[Pester][] provides a framework for running Unit Tests to execute and validate PowerShell commands.

This project tries to explain how [Pester][] framework can be used for Unit testing SharePoint PowerShell commands.

This Project will try to solve the following problems pertaining to SharePoint PowerShell Unit Testing:
1. The SharePoint Installed server will not be a mandatory requirement. 
2. Testing multiple versions of SharePoint

Let's understand what is done to solve the above problems and get seamless unit testing done on SharePoint.

1. Created a Project Structure as shown in the image below.
        ![Folder Structure][dirStructure]

2. Mocked the entire cmdlet of SharePoint. Used this [blog][] for reference.

One of the challenges when we intially planned for implementing **Unit Test** for SharePoint is, We need an environment/server where SharePoint is installed 








[Pester]: https://github.com/pester/Pester/wiki
[blog]: https://blogs.msdn.microsoft.com/brian_farnhill/2015/09/27/better-approaches-to-unit-testing-powershell-scripts-that-call-sharepoint-cmdlets/
[dirStructure]:https://github.com/kumarsendhi/GitImages/blob/master/SP%20with%20Pester%20Folder%20Structure.png?raw=true