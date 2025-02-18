Write-Host "Programm zum Automatischen Updates."

$requiredVersion = [Version]"7.0.0"
if ($PSVersionTable.PSVersion -lt $requiredVersion) {
    Write-Error "ACHTUNG NEUESTE VERSION VON POWERSHELL MUSS INSTALLIERT SEIN"

    # Überprüfung des Betriebssystems in PowerShell 5.1
    $os = [System.Environment]::OSVersion.Platform
    
    if ($os -eq "Win32NT") {
        Write-Host "Windows wurde als Betriebssystem erkannt"
        Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$env:TMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    elseif ($os -eq "Unix") {
        Write-Host "Linux/macOS wurde als Betriebssystem erkannt"
        Remove-Item -Path "/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue
    }
    else {
        Write-Host "Unbekanntes Betriebssystem erkannt"
    }
}

# Überprüfen, welches Betriebssystem vorliegt und den entsprechenden Update-Prozess starten

if ($IsWindows) {
    Write-Host "Betriebssystem: Windows" -ForegroundColor Cyan

    # Prüfen, ob das Modul PSWindowsUpdate vorhanden ist, andernfalls installieren
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Write-Host "PSWindowsUpdate-Modul wird installiert..."
        Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
    }

    Import-Module PSWindowsUpdate

    # Nach Windows-Updates suchen
    $updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot
    if ($updates) {
        Write-Host "Gefundene Windows-Updates:" -ForegroundColor Green
        $updates | Format-Table -AutoSize
    }
    else {
        Write-Host "Keine neuen Updates gefunden." -ForegroundColor Yellow
    }

    # Updates installieren, bei Bedarf automatisch neu starten
    Install-WindowsUpdate -AcceptAll -AutoReboot

}
elseif ($IsLinux) {
    Write-Host "Betriebssystem: Linux" -ForegroundColor Cyan

    # Update für Debian/Ubuntu-basierte Systeme
    if (Get-Command apt-get -ErrorAction SilentlyContinue) {
        Write-Host "Verwende apt-get zum Aktualisieren..."
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get autoremove -y
    }
    # Update für RedHat/CentOS-basierte Systeme
    elseif (Get-Command yum -ErrorAction SilentlyContinue) {
        Write-Host "Verwende yum zum Aktualisieren..."
        sudo yum check-update
        sudo yum update -y
    }
    # Update für Fedora/RHEL 8+ basierte Systeme
    elseif (Get-Command dnf -ErrorAction SilentlyContinue) {
        Write-Host "Verwende dnf zum Aktualisieren..."
        sudo dnf upgrade --refresh -y
    }
    else {
        Write-Host "Kein unterstützter Paketmanager gefunden." -ForegroundColor Red
    }
}
elseif ($IsMacOS) {
    Write-Host "Betriebssystem: macOS" -ForegroundColor Cyan

    # Updates für macOS mithilfe des softwareupdate-Tools durchführen
    Write-Host "Führe softwareupdate aus..."
    sudo softwareupdate -ia --verbose
}
else {
    Write-Host "Unbekanntes Betriebssystem. Update nicht möglich." -ForegroundColor Red
}
