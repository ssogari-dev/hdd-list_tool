@echo off
setlocal enabledelayedexpansion

rem 현재 배치 파일이 있는 폴더 설정
set "folder=%~dp0"
set "output_file=video_info.csv"

rem 폴더 내 모든 비디오 파일 찾기
for %%F in (*.mov *.mpeg *.mp4 *.avi *.mkv *.wmv *.m2ts) do (
    rem 파일명 가져오기
    set "filename=%%~nxF"

    rem 비디오 길이 가져오기
    for /f "tokens=*" %%A in ('ffmpeg -i "%%F" 2^>^&1 ^| findstr /R "Duration"') do (
        set "duration=%%A"
        set "duration=!duration:~10,7!"  rem Duration: 00:00:00.00 형식에서 00:00:00으로 잘라내기
        echo !filename!,!duration! >> "%output_file%"
    )
)
endlocal
