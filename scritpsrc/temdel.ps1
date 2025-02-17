# Einleitung des Skripts
Write-Host "Programm zum Löschen des temporären Ordners wurde gestartet."

# Prüfe ob die neueste Powershell Version installiert ist
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

# Wenn Windows das Betriebssystem ist
if ($IsWindows) {

    Write-Host "Windows wurde als Betriebssystem erkannt"

    # Löscht alle Dateien & Unterordner in den Temp-Ordnern
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:TMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

}

# Wenn Linux das Betriebssystem ist
elseif ($IsLinux) {
    Write-Host "Linux wurde als Betriebssystem erkannt"

    # Löscht temporäre Dateien im typischen Linux-Temp-Ordner
    Remove-Item -Path "/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue
}

# Wenn macOS das Betriebssystem ist
elseif ($IsMacOS) {
    Write-Host "macOS wurde als Betriebssystem erkannt"

    # Löscht temporäre Dateien im typischen macOS-Temp-Ordner
    Remove-Item -Path "/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue
}

# Falls kein Betriebssystem erkannt wurde
else {
    Write-Host "Kein bekanntes Betriebssystem erkannt. "
}

# END OF SCRIPT
Write-Host "Die Skriptausführung wird abgebrochen."