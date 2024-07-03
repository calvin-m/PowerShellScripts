# PowerShellScripts

This project contains my collection of PowerShellScripts.

## Project Setup and Conventions

\[RootFolder\] contains the fixed "EntryPoints" & "Modules" subfolders. 

"EntryPoints" folder contains all top-level scripts which should be the executed from commnandline.

"Modules" is for reusable library scripts, which EntryPoints scripts are using.

I picked dot-sourcing with relative paths (hence fixed ""EntryPoints" & "Modules" subfolders structure) to organize the scripts. Module is something for later down the road.

Note:
* [PowerShell Dot Sourcing vs Module]
(https://www.itprotoday.com/powershell/powershell-modules-vs-dot-sourcing-which-approach-is-better-)

* [Automate PowerShell module creation the smart way]
(https://doitpshway.com/automate-powershell-module-creation-the-smart-way)

## To Begin, enable script execution (for current user).

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser


### Other Notes

* [Markdown (.md) Guide]
(https://www.markdownguide.org/basic-syntax/)
