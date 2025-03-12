@FOR /F "delims=" %%s IN ('powershell -command "$env:computername.ToLower()"') DO @set host=%%s

SET target=c:\content
SET source=\\network_share

rmdir "%target%\" /S /Q
if not exist "%target%\" mkdir "%target%"

if %host%==host1 (
	robocopy "%source%\content_for_host1" "%target%" /z /s
)

if %host%==host2 (
	robocopy "%source%\content_for_host2\01" "%target%\01" /z /s
	robocopy "%source%\content_for_host2\02" "%target%\02" /z /s
)