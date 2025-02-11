Write-Host "Programm zum Löschen des temporären Ordners wurde gestartet."

# Prüfe ob die neueste Powershell Version installiert ist
$requiredVersion = [Version]"7.0.0"
if ($PSVersionTable.PSVersion -lt $requiredVersion) {
    Write-Error "ACHTUNG Die neuste NEUESTE VERSION muss installiert sein POWERSHELL INSTALLIERT SEIN"

    # Überprüfung des Betriebssystems in PowerShell 5.1
    $os = [System.Environment]::OSVersion.Platform
    
    if ($os -eq "Win32NT") {
        Write-Host "Windows wurde als Betriebssystem erkannt 2"
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

# Wenn Windows dass Betriebssystem ist
if ($IsWindows) {

    Write-Host "Windows wurde als Betriebssystem erkannt"

    # Löscht alle Dateien & Unterordner in den Temp-Ordnern
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:TMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

}else {
    <# Action when all if and elseif conditions are false #>
}

# Wenn Linux dass Betriebssystem ist
if ($IsLinux) {
    Write-Host "Linux wurde als Betriebssystem erkannt"

    # Löscht temporäre Dateien im typischen Linux-Temp-Ordner
    Remove-Item -Path "/tmp/*" -Recurse -Force -ErrorAction SilentlyContinue

}else {
    <# Action when all if and elseif conditions are false #>
}

Write-Host "Programm zum Löschen des Temp Ordners erfolgreich beendet"