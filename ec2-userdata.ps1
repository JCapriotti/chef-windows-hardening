<powershell>
####################################################################################################
# NOTE: This is the default user-data file generated by the Kitchen EC2 driver, but it has been 
#       modified with the following line so that it works with Windows 1803: 
#               New-Item $logfile -Force
#
#       A PR has been submitted to get this fix upstreamed.
#       https://github.com/test-kitchen/kitchen-ec2/pull/405
####################################################################################################

$OSVersion = (get-itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ProductName).ProductName
If($OSVersion.contains('2016'))
{
$logfile='C:\ProgramData\Amazon\EC2-Windows\Launch\Log\kitchen-ec2.log'
# EC2Launch doesn't init extra disks by default
C:\ProgramData\Amazon\EC2-Windows\Launch\Scripts\InitializeDisks.ps1
}
Else
{
$logfile='C:\Program Files\Amazon\Ec2ConfigService\Logs\kitchen-ec2.log'
}

# Fail safe in case the directory does not exist 
New-Item $logfile -Force

# Allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
#PS Remoting and & winrm.cmd basic config
$enableArgs=@{Force=$true}
$command=Get-Command Enable-PSRemoting
if($command.Parameters.Keys -contains "skipnetworkprofilecheck"){
$enableArgs.skipnetworkprofilecheck=$true
}
Enable-PSRemoting @enableArgs
& winrm.cmd set winrm/config '@{MaxTimeoutms="1800000"}' >> $logfile
& winrm.cmd set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}' >> $logfile
& winrm.cmd set winrm/config/winrs '@{MaxShellsPerUser="50"}' >> $logfile
& winrm.cmd set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}' >> $logfile
#Firewall Config
& netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" profile=public protocol=tcp localport=5985 remoteip=localsubnet new remoteip=any  >> $logfile
Set-ItemProperty -Name LocalAccountTokenFilterPolicy -Path HKLM:\software\Microsoft\Windows\CurrentVersion\Policies\system -Value 1

####################################################################################################
# NOTE: This is the default user-data file generated by the Kitchen EC2 driver, but it has been 
#       modified with the following line so that it works with Windows 1803: 
#               New-Item $logfile -Force
#
#       A PR has been submitted to get this fix upstreamed.
####################################################################################################
</powershell>