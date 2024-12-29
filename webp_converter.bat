@echo off
:: Define the output folder
set output_folder=Converted_WebP

:: Create the output folder if it doesn't exist
if not exist "%output_folder%" (
    mkdir "%output_folder%"
)

:: Loop through each JPG file in the current directory
for %%i in (*.jpg) do (
    :: Check if the WebP file already exists in the output folder
    if not exist "%output_folder%\%%~ni.webp" (
        echo Converting "%%i" to WebP...
        cwebp "%%i" -o "%output_folder%\%%~ni.webp"
    ) else (
        echo Skipping "%%i" as the WebP file already exists.
    )
)

echo Conversion completed! All WebP files are in the "%output_folder%" folder.
pause
