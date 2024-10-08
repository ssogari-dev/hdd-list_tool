@echo off
setlocal enabledelayedexpansion

set "scriptDir=%~dp0"
set "outputCsv=%scriptDir%folder.csv"

(
    echo FolderName
    for /d %%F in ("%scriptDir%*") do (
        echo %%~nF
    )
) > "%outputCsv%"

endlocal
