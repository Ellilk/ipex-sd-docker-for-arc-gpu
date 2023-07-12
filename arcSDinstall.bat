@echo off
setlocal enableextensions
path=C:\Program Files\Docker\Docker\resources\bin;%path%

winget install docker.dockerdesktop

echo Please OPEN DOCKER DESKTOP, then config the proxies (if needed).
echo Where do you wanna install sd-webui? Your models and pictures will be there. (default=%UserProfile%\docker-mount\sd-webui)
set /p loc=
If "%loc%" == "" (
    @set loc=%UserProfile%\docker-mount\sd-webui
)

docker run -it ^
--device /dev/dxg ^
-v /usr/lib/wsl:/usr/lib/wsl ^
-v %loc%:/sd-webui ^
-v deps:/deps ^
-p 7860:7860 ^
--name sd-server ^
nuullll/ipex-arc-sd:latest
:EOF
endlocal
pause