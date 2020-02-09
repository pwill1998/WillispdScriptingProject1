<#
Patrick Willison
Project 1
Due: 2/9/2020
Willispd
In this project I coded a simple script that shows computer system details and calculates the total space that you have used on any computer that has a C:drive
Notes: The data listed is unrounded so that you have a more accurate representation of how much space you have used, and stored.
#>

#ComputerName will find the name of the computer via env:variable
$ComputerName=$env:COMPUTERNAME

#Disk stats retrieves stats for all the disks, filters them by divice id and the computer name variable. in this case we filtered for the C drive
$DiskStats = Get-WmiObject Win32_Logicaldisk -Filter "deviceid='C:'" -ComputerName $ComputerName

#DiskMaxSize only gets the total size of the C drive in Mb's and calculates the total size in Gb
$DiskMaxSize = $DiskStats.Size/1gb

#DiskOpenSpace gets the remainder of free space in the C drive and calculates the total number of Gb left
$DiskOpenSpace = $DiskStats.FreeSpace/1gb

#DiskUsedSpace calculates how much has been used by subtracting the max size by the amount of data free
$DiskUsedSpace= ($DiskMaxSize - $DiskOpenSpace)

#DiskStats Prints various info about the drive to confirm that it can find the drive
$DiskStats

#the two write-host commands just list the space left,used and total storage capacity on the C Drive
Write-Host("The current max size of your drive is  $DiskMaxSize Gb, you have $DiskOpenSpace Gb free")
Write-Host("You have used $DiskUsedSpace Gb of space")
