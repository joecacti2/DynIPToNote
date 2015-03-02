@echo off
REM DynIPToNote.bat v1.0
REM Fred Miller - joecacti@yahoo.com
REM This batch file grabs your IP address and writes it to Evernote.
REM It creates a new note each time it gets a new IP
REM You can leave this running on your home computer and your home IP will always be known to you!
REM Dependencies:  Evernote and powershell

REM No need for wget anymore "C:\Program Files (x86)\GnuWin32\bin\wget.exe" -Oc:\zzz.txt http://bot.whatismyipaddress.com/

powershell -command (new-object System.Net.WebClient).DownloadFile('http://bot.whatismyipaddress.com/','C:\currentIP.txt')

"C:\Program Files (x86)\Evernote\Evernote\Enscript.exe" exportNotes /qDynIPAddress /fc:\oldIPs.txt

set /p var1=<c:\currentIP.txt

findstr /m %var1% c:\oldIPs.txt

if %errorlevel%==0 (
echo Found current IP Address in Evernote DynIPAddress, will not do anything
) else (
"C:\Program Files (x86)\Evernote\Evernote\Enscript.exe" createNote /s "c:\currentIP.txt" /n "IPs" /i "DynIPAddress" 
echo New IP Address found, will create new Note, yay
)
