Write-Host "Programm zum Messen der Download-Geschwindigkeit wurde gestartet."


# URL der Testdatei (hier 10 MB)
$TestFile = "https://ipv4.download.thinkbroadband.com/10MB.zip"

# Temporärer Speicherort
$TempFile = Join-Path -Path $env:TEMP -ChildPath "testfile.zip"

# Starte die Zeitmessung
$StartTime = Get-Date

# Datei herunterladen (dies blockiert den Skriptablauf, bis der Download abgeschlossen ist)
Invoke-WebRequest -Uri $TestFile -OutFile $TempFile -TimeoutSec 10

# Endzeitpunkt erfassen
$EndTime = Get-Date
$Duration = ($EndTime - $StartTime).TotalSeconds

# Berechnung: 10 MB in Megabits (1 MB = 8 Mbit) und durch die Zeit teilen
$FileSizeMB = 10
$SpeedMbps = ($FileSizeMB * 8) / $Duration

Write-Output ("Download-Geschwindigkeit: {0:N2} Mbps" -f $SpeedMbps)
