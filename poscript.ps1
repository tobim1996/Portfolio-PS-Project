<#
Dieses Programm ist ein Admin Multitool für Windows Admins und normale Windows Users
Made by Tobias Madaj
All rights reserved (CC)
#>

# Einleitung
Write-Host "--Windows Multi-Admin Tool wird ausgeführt--"
Write-Host "`n Geben sie ein welches Skript sie ausführen wollen:"

# Liste der Programme die gestartet werden können.
Write-Host "1. Löschen des Temporären Ordners"
Write-Host "2. Automatisierte Datei- und Ordnersicherung"
Write-Host "3. Tägliche Systemstatus-Berichterstattung"
Write-Host "4. Verwaltung von Autostart-Programmen"
Write-Host "5. Benutzer- und Gruppenverwaltung"
Write-Host "6. Automatische Windows-Updates und -Patches"
Write-Host "7. Netzwerk- und Internetgeschwindigkeitstest"
Write-Host "8. Festplatten-Überwachung und Warnsystem"

$inputValue = Read-Host "Welches Script willst du ausführen: "
Write-Host "Script Nr. $inputValue wird ausgeführt"

switch ($inputValue) {
    "1" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "2" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "3" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "4" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "5" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "6" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }
    "7" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }       
    "8" { 
        $scriptPath = "$PSScriptRoot\scritpsrc\temdel.ps1"
        # Prüfen, ob das Skript existiert
        if (Test-Path $scriptPath) {
            # Skript ausführen   
            & $scriptPath  
            } else {
            # Skript wird nicht ausgeführt
            Write-Host "Skript wurde nicht gefunden: $scriptPath"
            }
        }       
    default {
        Write-Host "Falsche Nummer eingegeben!"
        Write-Host "Programm wird beendet"
    }
}
Write-Host "Programm wird beendet"
