@echo off
REM DynIPToNote.bat v1.0
REM Fred Miller - joecacti@yahoo.com
REM This batch file grabs your IP address and writes it to Evernote.
REM It creates a new note each time it gets a new IP
REM You can leave this running on your home computer and your home IP will always be known to you!
REM Dependencies:  Evernote and GnuWin32 wget

"C:\Program Files (x86)\GnuWin32\bin\wget.exe" -Oc:\zzz.txt http://bot.whatismyipaddress.com/

"C:\Program Files (x86)\Evernote\Evernote\Enscript.exe" exportNotes /qDynIPAddress /fc:\xxx.txt

setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /F "tokens=*" %%A in (c:\zzz.txt) do (
    SET /A vidx=!vidx! + 1
    set var!vidx!=%%A
)
set var

findstr /m %var1% c:\xxx.txt

if %errorlevel%==0 (
echo Found current IP Address in Evernote DynIPAddress, will not do anything
) else (
"C:\Program Files (x86)\Evernote\Evernote\Enscript.exe" createNote /s "c:\zzz.txt" /n "IPs" /i "DynIPAddress" 
echo New IP Address found, will create new Note, yay
)


