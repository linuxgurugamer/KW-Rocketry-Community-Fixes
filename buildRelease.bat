@echo off
set DEFHOMEDRIVE=d:
set DEFHOMEDIR=%DEFHOMEDRIVE%%HOMEPATH%
set HOMEDIR=
set HOMEDRIVE=%CD:~0,2%

set RELEASEDIR=d:\Users\jbb\release
set ZIP="c:\Program Files\7-zip\7z.exe"
echo Default homedir: %DEFHOMEDIR%

set /p HOMEDIR= "Enter Home directory, or <CR> for default: "

if "%HOMEDIR%" == "" (
set HOMEDIR=%DEFHOMEDIR%
)
echo %HOMEDIR%

SET _test=%HOMEDIR:~1,1%
if "%_test%" == ":" (
set HOMEDRIVE=%HOMEDIR:~0,2%
)

type KWCommunityFixes.version
set /p VERSION= "Enter version: "



set d=%HOMEDIR\install
if exist %d% goto one
mkdir %d%
:one
set d=%HOMEDIR%\install\GameData
if exist %d% goto two
mkdir %d%
:two
set d=%HOMEDIR%\install\GameData\KWCommunityFixes
if exist %d% goto three
mkdir %d%
:three
set d=%HOMEDIR%\install\GameData\KWCommunityFixes\Plugin
if exist %d% goto four
mkdir %d%
:four
set d=%HOMEDIR%\install\GameData\KWCommunityFixes\Textures
if exist %d% goto five
mkdir %d%
:five

copy *.cfg %HOMEDIR%\install\GameData\KWCommunityFixes
copy README.txt %HOMEDIR%\install\GameData\KWCommunityFixes
copy README-1-0-5.txt %HOMEDIR%\install\GameData\KWCommunityFixes
copy KWCommunityFixes.version %HOMEDIR%\install\GameData\KWCommunityFixes

%HOMEDRIVE%
cd %HOMEDIR%\install
%ZIP% a -tzip %RELEASEDIR%\KW-Rocketry-Community-Fixes-%VERSION%.zip GameData\KWCommunityFixes

