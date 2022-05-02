@echo off
title MRX Steam Log Cleaner
echo MRX Steam log temizleyici.
pause

rem Steam kapatiliyor.
rem Kapatilirken hata verebilir ama sorun yok hepsi kapatilir.
echo Steam kapatma durumu -
taskkill /F /IM Steam.exe
taskkill /F /IM SteamService.exe
taskkill /F /IM steamwebhelper.exe

rem Steam log dosyalari siliniyor.
rem Silinirken hata verebilir ama sorun yok hepsi silinir.
echo Log silme durumu -
cd "C:\Program Files (x86)\Steam"
rd /q /s logs
rd /q /s dumps
rd /q /s config
rd /q /s userdata
rd /q /s appcache
rd /q /s depotcache
echo Log silme durumu -
del /f /q /s /a *.mdmp
del /f /q /s /a ssfn*.*
del /f /q /s /a Steam.dll
del /f /q /s /a SteamUI.dll
del /f /q /s /a crashhandler.dll
del /f /q /s /a crashhandler.dll.old
del /f /q /s /a clientregistry.blob
del /f /q /s /a appupdatestats.blob
del /f /q /s /a GameOverlayRenderer.log
del /f /q /s /a GameOverlayUI.exe.log.last
del /f /q /s /a GameOverlayUI.exe.log
del /f /q /s /a debug.log
del /f /q /s /a steam.log
del /f /q /s /a steam.exe.old

rem Steam reg dosyalari siliniyor.
rem Silinirken hata verebilir ama sorun yok hepsi silinir.
echo Reg silme durumu -
reg delete "HKEY_CURRENT_USER\Software\Valve" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Source" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam" /f
reg delete "HKEY_CURRENT_USER\Software\Valve\Steam\Users" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\Valve" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\Valve\Source" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\Valve\Steam" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\Valve\Steam\Users" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\steam" /f
echo Reg silme durumu -
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Valve" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Source" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\Users" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Source" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam\Users" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\steam" /f
echo Reg silme durumu -
reg delete "HKEY_CLASSES_ROOT\steam" /f

rem steamservice.exe Baslatiliyor.
cd "C:\Program Files (x86)\Steam\bin"
start steamservice.exe

rem steam.exe Baslatiliyor.
cd "C:\Program Files (x86)\Steam"
start Steam.exe

rem Steam log dosyalari siliniyor.
echo Log silme durumu -
rd /q /s "%userprofile%\AppData\Local\CrashDumps"

pause
cls

rem Basariyla tamamlandi.
echo Steam loglariniz temizlendi.
pause