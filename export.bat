@echo off

set BUILD_DIR=BUILD

if exist "%BUILD_DIR%" (
    del /q "%BUILD_DIR%"
    for /D %%i in ("%BUILD_DIR%/**") DO (
        if not %%i==".vs" (
            if exist "%BUILD_DIR%/%%i" (
                echo -- Deleting "%%i"
                rd /S /Q "%BUILD_DIR%/%%i"
            )
        )
    )
)

mkdir %BUILD_DIR%
cd %BUILD_DIR%
cmake -G "Visual Studio 16 2019" -A x64 ..