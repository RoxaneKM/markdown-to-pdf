@echo off

:: %1  -> markdown file to be converted
SET source=%1

:: %2  -> result pdf file name 
SET result=%2

:: %3  -> markdown styling stylesheet (if empty default will be chosen)

:: %4  -> custom html header 

:: %5  -> custom html footer

:: Get script full path
SET script_full_path=%~dp0
echo %script_full_path:~0,-1%

:: Create the markdown the html
SET tmp_html_file=%source:~0,-3%_tmp.html
echo %tmp_html_file%
copy NUL %tmp_html_file%

:: Add css style
if "%~3"=="" (
    SET style=github.css
) else (
     SET style=%3
)

:: Add header
if "%~4"=="" (
    SET header=%script_full_path%headers\default.html
) else (
     SET header=%script_full_path%headers\%4
)

:: Add footer
if "%~5"=="" (
    SET footer=%script_full_path%footers\default.html
) else (
     SET footer=%script_full_path%footers\%5
)

echo ^<html^>^<head^>^<meta charset^="utf-8"^>^<link rel^="stylesheet" href^=^'%script_full_path%styles\%style%^'^>^</head^>^<body^> >> %tmp_html_file%

:: Append markdown code to temporary html file
pandoc -f markdown -t html %source% -o md.html
type md.html >> %tmp_html_file%

:: Append post html to temporary html file
echo ^</body^>^</html^> >> %tmp_html_file%

:: Convert html to PDF
wkhtmltopdf --header-html %header% --footer-html %footer% %tmp_html_file% %result%

:: Remove temporary files
del %tmp_html_file%
del md.html