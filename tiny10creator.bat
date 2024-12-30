@echo off
setlocal EnableExtensions EnableDelayedExpansion

title tiny10 builder alpha
echo Welcome to the tiny10 image creator!
timeout /t 3 /nobreak > nul
cls

set DriveLetter=
set /p DriveLetter=Please enter the drive letter for the Windows 10 image: 
set "DriveLetter=%DriveLetter%:"
echo.
    if not exist "%DriveLetter%\sources\boot.wim" (
        echo.Can't find Windows OS Installation files in the specified Drive Letter..
        echo.
        echo.Please enter the correct DVD Drive Letter..
        goto :Stop
    )

    if not exist "%DriveLetter%\sources\install.wim" (
        echo.Can't find Windows OS Installation files in the specified Drive Letter..
        echo.
        echo.Please enter the correct DVD Drive Letter..
        goto :Stop
    )
    md c:\temp\tiny10
echo Copying Windows image...
    xcopy.exe /E /I /H /R /Y /J %DriveLetter% c:\temp\tiny10 >nul
    echo Copy complete!
    sleep 2
    cls
echo Getting image information:
    dism /Get-WimInfo /wimfile:c:\temp\tiny10\sources\install.wim
    set index=
    set /p index=Please enter the image index:
    set "index=%index%"
echo Mounting Windows image. This may take a while.
echo.
    md c:\temp\scratchdir
    dism /mount-image /imagefile:c:\temp\tiny10\sources\install.wim /index:%index% /mountdir:c:\temp\scratchdir
echo Mounting complete! Performing removal of applications...

echo Removing Solitaire...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_4.4.8204.0_neutral_~_8wekyb3d8bbwe
echo Removing Weather...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_4.25.20211.0_neutral_~_8wekyb3d8bbwe
echo Removing GetHelp...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_10.1706.13331.0_neutral_~_8wekyb3d8bbwe
echo Removing GetStarted...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_8.2.22942.0_neutral_~_8wekyb3d8bbwe
echo Removing Office Hub...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_18.1903.1152.0_neutral_~_8wekyb3d8bbwe
echo Removing PeopleApp...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2019.305.632.0_neutral_~_8wekyb3d8bbwe
echo Removing Alarms...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2019.807.41.0_neutral_~_8wekyb3d8bbwe
echo Removing Mail...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_16005.11629.20316.0_neutral_~_8wekyb3d8bbwe
echo Removing Feedback Hub...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2019.1111.2029.0_neutral_~_8wekyb3d8bbwe
echo Removing Maps...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2019.716.2316.0_neutral_~_8wekyb3d8bbwe
echo Removing Sound Recorder...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2019.716.2313.0_neutral_~_8wekyb3d8bbwe
echo Removing XboxTCUI...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Xbox.TCUI_1.23.28002.0_neutral_~_8wekyb3d8bbwe
echo Removing XboxGamingOverlay...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2.34.28001.0_neutral_~_8wekyb3d8bbwe
echo Removing XboxGameOverlay...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameOverlay_1.46.11001.0_neutral_~_8wekyb3d8bbwe
echo Removing XboxSpeechToTextOverlay...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_neutral_~_8wekyb3d8bbwe
echo Removing Xbox...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxApp_48.49.31001.0_neutral_~_8wekyb3d8bbwe
echo Removing Your Phone...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_2019.430.2026.0_neutral_~_8wekyb3d8bbwe
echo Removing Music...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2019.19071.19011.0_neutral_~_8wekyb3d8bbwe
echo Removing Video...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2019.19071.19011.0_neutral_~_8wekyb3d8bbwe
echo Removing Skype...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.SkypeApp_14.53.77.0_neutral_~_kzf8qxf38zg5c
echo Removing Photos...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Windows.Photos_2019.19071.12548.0_neutral_~_8wekyb3d8bbwe
echo Removing Camera...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCamera_2018.826.98.0_neutral_~_8wekyb3d8bbwe
echo Removing OneNote...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Office.OneNote_16001.12026.20112.0_neutral_~_8wekyb3d8bbwe
echo Removing MixedRealityPortal...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MixedReality.Portal_2000.19081.1301.0_neutral_~_8wekyb3d8bbwe
echo Removing StickyNotes...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftStickyNotes_3.6.73.0_neutral_~_8wekyb3d8bbwe
echo Removing 3DViewer
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Microsoft3DViewer_6.1908.2042.0_neutral_~_8wekyb3d8bbwe
echo Removing Cortana...
    dism /image:c:\temp\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_1.1911.21713.0_neutral_~_8wekyb3d8bbwe


echo Removing of system apps complete! Now proceeding to removal of system packages...
timeout /t 1 /nobreak > nul
cls

echo Removing Internet Explorer...
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.19041.1566
echo Removing Handwriting:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-gb-Package~31bf3856ad364e35~amd64~~10.0.19041.1
echo Removing OCR:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-gb-Package~31bf3856ad364e35~amd64~~10.0.19041.1
echo Removing Speech:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-gb-Package~31bf3856ad364e35~amd64~~10.0.19041.1
echo Removing TTS:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-gb-Package~31bf3856ad364e35~amd64~~10.0.19041.1
echo Removing Media Player Legacy:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.19041.2006
echo Removing Tablet PC Math:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.19041.1865
echo Removing QuickAssist:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-QuickAssist-Package~31bf3856ad364e35~amd64~~10.0.19041.1949
echo Removing Wordpad Legacy:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-WordPad-FoD-Package~31bf3856ad364e35~amd64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-WordPad-FoD-Package~31bf3856ad364e35~amd64~~10.0.19041.1682
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-WordPad-FoD-Package~31bf3856ad364e35~wow64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-WordPad-FoD-Package~31bf3856ad364e35~wow64~~10.0.19041.1
echo Removing MSPaint Legacy:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MSPaint-FoD-Package~31bf3856ad364e35~amd64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MSPaint-FoD-Package~31bf3856ad364e35~amd64~~10.0.19041.746
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MSPaint-FoD-Package~31bf3856ad364e35~wow64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MSPaint-FoD-Package~31bf3856ad364e35~wow64~~10.0.19041.1
echo Removing Notepad Legacy:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Notepad-FoD-Package~31bf3856ad364e35~amd64~en-GB~10.0.19041.488
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Notepad-FoD-Package~31bf3856ad364e35~amd64~~10.0.19041.1865
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Notepad-FoD-Package~31bf3856ad364e35~wow64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Notepad-FoD-Package~31bf3856ad364e35~wow64~~10.0.19041.1
echo Removing StepsRecorder:
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-StepsRecorder-Package~31bf3856ad364e35~amd64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-StepsRecorder-Package~31bf3856ad364e35~amd64~~10.0.19041.746
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-StepsRecorder-Package~31bf3856ad364e35~wow64~en-GB~10.0.19041.1
    dism /image:c:\temp\scratchdir /Remove-Package /PackageName:Microsoft-Windows-StepsRecorder-Package~31bf3856ad364e35~wow64~~10.0.19041.1


echo Removing Edge:
    rd "C:\temp\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
    rd "C:\temp\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q
echo Removing OneDrive:
    takeown /f C:\temp\scratchdir\Windows\WinSxS\wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_e585f901f9ce93e6\OneDriveSetup.exe
    icacls C:\temp\scratchdir\Windows\WinSxS\wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_e585f901f9ce93e6\OneDriveSetup.exe /grant Administrators:F /T /C
    del /f /q /s "C:\temp\scratchdir\Windows\WinSxS\wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_e585f901f9ce93e6\OneDriveSetup.exe"
    echo Removal complete!
    timeout /t 2 /nobreak > nul
    cls
echo Loading registry...
    reg load HKLM\zCOMPONENTS "c:\temp\scratchdir\Windows\System32\config\COMPONENTS" >nul
    reg load HKLM\zDEFAULT "c:\temp\scratchdir\Windows\System32\config\default" >nul
    reg load HKLM\zNTUSER "c:\temp\scratchdir\Users\Default\ntuser.dat" >nul
    reg load HKLM\zSOFTWARE "c:\temp\scratchdir\Windows\System32\config\SOFTWARE" >nul
    reg load HKLM\zSYSTEM "c:\temp\scratchdir\Windows\System32\config\SYSTEM" >nul
echo Bypassing system requirements(on the system image):
    reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
echo Disabling Sponsored Apps:
    reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": [{}]}" /f >nul 2>&1
echo Enabling Local Accounts on OOBE:
    reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d "1" /f >nul 2>&1
    copy /y %~dp0autounattend.xml c:\temp\scratchdir\Windows\System32\Sysprep\autounattend.xml
echo Disabling Reserved Storage:
    reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f >nul 2>&1
echo Disabling Chat icon:
    reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f >nul 2>&1
    reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >nul 2>&1
echo Tweaking complete!
echo Unmounting Registry...
    reg unload HKLM\zCOMPONENTS >nul 2>&1
    reg unload HKLM\zDRIVERS >nul 2>&1
    reg unload HKLM\zDEFAULT >nul 2>&1
    reg unload HKLM\zNTUSER >nul 2>&1
    reg unload HKLM\zSCHEMA >nul 2>&1
    reg unload HKLM\zSOFTWARE >nul 2>&1
    reg unload HKLM\zSYSTEM >nul 2>&1
echo Cleaning up image...
    dism /image:c:\temp\scratchdir /Cleanup-Image /StartComponentCleanup /ResetBase
echo Cleanup complete.
echo Unmounting image...
    dism /unmount-image /mountdir:c:\temp\scratchdir /commit
echo Exporting image...
    dism /Export-Image /SourceImageFile:c:\temp\tiny10\sources\install.wim /SourceIndex:%index% /DestinationImageFile:c:\temp\tiny10\sources\install2.wim /compress:max
    del c:\temp\tiny10\sources\install.wim
    ren c:\temp\tiny10\sources\install2.wim install.wim
echo Windows image completed. Continuing with boot.wim.
timeout /t 2 /nobreak > nul
cls
echo Mounting boot image:
    dism /mount-image /imagefile:c:\temp\tiny10\sources\boot.wim /index:2 /mountdir:c:\temp\scratchdir
echo Loading registry...
    reg load HKLM\zCOMPONENTS "c:\temp\scratchdir\Windows\System32\config\COMPONENTS" >nul
    reg load HKLM\zDEFAULT "c:\temp\scratchdir\Windows\System32\config\default" >nul
    reg load HKLM\zNTUSER "c:\temp\scratchdir\Users\Default\ntuser.dat" >nul
    reg load HKLM\zSOFTWARE "c:\temp\scratchdir\Windows\System32\config\SOFTWARE" >nul
    reg load HKLM\zSYSTEM "c:\temp\scratchdir\Windows\System32\config\SYSTEM" >nul
echo Bypassing system requirements(on the setup image):
    reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
    reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
echo Tweaking complete! 
echo Unmounting Registry...
    reg unload HKLM\zCOMPONENTS >nul 2>&1
    reg unload HKLM\zDRIVERS >nul 2>&1
    reg unload HKLM\zDEFAULT >nul 2>&1
    reg unload HKLM\zNTUSER >nul 2>&1
    reg unload HKLM\zSCHEMA >nul 2>&1
    reg unload HKLM\zSOFTWARE >nul 2>&1
    reg unload HKLM\zSYSTEM >nul 2>&1
echo Unmounting image...
    dism /unmount-image /mountdir:c:\temp\scratchdir /commit 
cls
echo the tiny10 image is now completed. Proceeding with the making of the ISO...
echo Copying unattended file for bypassing MS account on OOBE...
copy /y %~dp0autounattend.xml c:\temp\tiny10\autounattend.xml
echo.
echo Creating ISO image...
"%~dp0oscdimg.exe" -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\temp\tiny10\boot\etfsboot.com#pEF,e,bc:\temp\tiny10\efi\microsoft\boot\efisys.bin c:\temp\tiny10 "%~dp0tiny10.iso"
echo Creation completed! Press any key to exit the script...
pause 
echo Performing Cleanup...
rd c:\temp\tiny10 /s /q 
rd c:\temp\scratchdir /s /q 
exit
