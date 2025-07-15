@ECHO off
cls
:start
ECHO.
ECHO                 Вас приветствует Adobe Cleaner by Concept,
ECHO           который следует запускать с правами администратора!
ECHO.
ECHO.
ECHO  Доступные команды:
ECHO   1. Удалить все следы Adobe в системе.
ECHO   2. Справка.
ECHO   3. Выход.
ECHO.
set /p choice=Введите номер команды и нажмите Enter: 
rem if not '%choice%'=='' set choice=%choice:~0;1%
if '%choice%'=='' ECHO "%choice%"  Вы не выбрали номер команды, попробуйте снова.
if '%choice%'=='1' goto cleaner
if '%choice%'=='2' goto faq
if '%choice%'=='3' goto exit
ECHO.
:faq
ECHO.
ECHO.
ECHO.
ECHO.  Справка:
ECHO.
ECHO     Если выбрать 1, то будет произведена попытка удалить ВСЕ
ECHO     файлы и папки, созданные установками продуктов от компании Adobe.
ECHO     Помимо этого, в реестре также будут удалены ВСЕ записи от Adobe.
ECHO.
ECHO     Если Вы хотите знать, что именно Adobe Cleaner удаляет,
ECHO     нажмите по нему правой кнопкой и выберете пункт "Изменить".
ECHO     Файлы, папки, службы и ключи реестра перечислены с 38 строки.
ECHO.
ECHO.
goto start
:cleaner
rd "%userprofile%\AppData\Local\Adobe" /q /s
rd "%userprofile%\AppData\LocalLow\Adobe" /q /s
rd "%userprofile%\AppData\Roaming\Adobe" /q /s
rd "%programfiles%\Adobe" /q /s
rd "%programfiles(x86)%\Adobe" /q /s
rd "%commonprogramfiles%\Adobe" /q /s
rd "%commonprogramfiles(x86)%\Adobe" /q /s
rd "%programdata%\Adobe" /q /s
rd "%programdata%\regid.1986-12.com.adobe" /q /s
del "%userprofile%\AppData\Local\*Установки формата*" /q /s /f
del "%userprofile%\AppData\Local\*Сохранить для Web*" /q /s /f
sc stop "Bonjour Service"
sc stop AGSService 
sc delete AGSService
Taskkill /f /im AcroRd32.exe
Taskkill /f /im AcroRd64.exe
Taskkill /f /im AdobeARM.exe
Taskkill /f /im "Adobe Encode.exe"
Taskkill /f /im "Adobe Media Encoder.exe"
Taskkill /f /im "Adobe QT32 Server.exe"
Taskkill /f /im "Adobe Premiere Pro.exe"
Taskkill /f /im Photoshop.exe
Taskkill /f /im PhotoshopPrefsManager.exe
Taskkill /f /im dynamiclinkmanager.exe
Taskkill /f /im AdobeIPCBroker.exe
Taskkill /f /im node.exe
reg delete "HKEY_CURRENT_USER\Software\Adobe"  /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Adobe"  /f
ECHO.
ECHO Windows успешно очищена от всех следов продуктов компании Adobe.
pause