@echo off
title MRX Windows Defender Log Cleaner
echo MRX Windows Defender log temizleyici.
pause

rem Windows Defender log dosyalari siliniyor.
echo Log silme durumu -
cd "C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service"
rd /q /s DetectionHistory

echo Log silme durumu -
del /f /q /s /a *.log

pause
cls

rem Basariyla tamamlandi.
echo Windows Defender loglariniz temizlendi.
pause