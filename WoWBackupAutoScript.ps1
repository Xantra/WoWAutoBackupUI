
Param (
	[Parameter(Mandatory, HelpMessage = "Please provide the Drive letter where your wow folder lives")][string]$PathLetter,
	[Parameter(Mandatory, HelpMessage = "Retail, Classic (Choose one)")][string]$WowType 
	)


$BaseDir = "${PathLetter}:\"
$user = $env:UserName
$date = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$PathDeletion = "C:\\Users\\" + $user + "\\Desktop\\"


if ($WowType -eq "Retail"){
	$BackupNames = [System.Collections.Generic.List[System.string]] (Get-ChildItem -Recurse -Path $PathDeletion| Where-Object {$_.Name -match '(backupUIRetail.*)'})
	if ($BackupNames.Count -eq 0){
		Write-Host "No existing backups for Retail, creating it"			
	}
	else {
		while ($BackupNames.Count -ge 4){
			Write-Host "More than 3 backups already exist, deleting the oldest one and creating a new backup"
			Remove-Item -Path "C:\Users\${user}\Desktop\$($BackupNames[0])"
			$BackupNames.RemoveAt(0)
		}
	} # if ($WoWPath[1] -like "*World of Warcraft*"){Write-host YEP}
	$NameToFind = "_retail_"
	$WoWPath = (Get-ChildItem -Path $BaseDir -Filter "$NameToFind" -Recurse -Directory).Fullname
	for ($i = 0 ; $i -le $WoWPath.Count ; $i++ ){
		if ($WoWPath[$i] -like "*World of Warcraft*"){
			$Path = $WoWPath[$i]
			Compress-Archive -Path "${Path}\WTF" -CompressionLevel 'Fastest' -DestinationPath "C:\Users\${user}\Desktop\backupUIRetail-$date"
			Write-Host "Created backup at $('C:\Users\'+ ${user} +'\Desktop\backupUIRetail-' + $date + '.zip')"
		}
	}	
}
else {
	if ($WowType -eq "Classic"){
		$BackupNames = [System.Collections.Generic.List[System.string]] (Get-ChildItem -Recurse -Path $PathDeletion| Where-Object {$_.Name -match '(backupUIClassic.*)'})
		if ($BackupNames.Count -eq 0){
			Write-Host "No existing backups for Classic, creating it"
			
		}
		else {
			while ($BackupNames.Count -ge 4){
				Write-Host "More than 3 backups already exist, deleting the oldest ones and creating a new backup"
				Remove-Item -Path "C:\Users\${user}\Desktop\$($BackupNames[0])"
				$BackupNames.RemoveAt(0)
			}
			
		}
	}
	$NameToFind = "_classic_"
	$WoWPath = (Get-ChildItem -Path $BaseDir -Filter "$NameToFind" -Recurse -Directory).Fullname
	for ($i = 0 ; $i -le $WoWPath.Count ; $i++ ){
		if ($WoWPath[$i] -like "*World of Warcraft*"){
			$Path = $WoWPath[$i]
			Compress-Archive -Path "${Path}\WTF" -CompressionLevel 'Fastest' -DestinationPath "C:\Users\${user}\Desktop\backupUIClassic-$date"
			Write-Host "Created backup at $('C:\Users\'+ ${user} +'\Desktop\backupUIClassic-' + $date + '.zip')"
		}
	}
}








