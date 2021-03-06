@echo off

set TURTLEBOT2_WIN10_PATH=%~dp0
set SRC_PATH=%TURTLEBOT2_WIN10_PATH%\..
set ROOT_PATH=%SRC_PATH%\..

pushd %ROOT_PATH%

echo .
echo Configure the build to skip AMENT projects that aren't relevant
echo .
if "%~1" == "advanced" (
call %TURTLEBOT2_WIN10_PATH%\setup-for-win10.cmd filter advanced
goto:NextStep
)
call %TURTLEBOT2_WIN10_PATH%\setup-for-win10.cmd filter turtlebot2


:NextStep

echo .
echo Build ROS2 binaries for Windows 10 Iot Core
echo .
python src\ament\ament_tools\scripts\ament.py build


echo .
echo Build Gamepad UWP binary for Windows 10 Iot Core
echo .
msbuild %TURTLEBOT2_WIN10_PATH%\GamepadNodeUwp\GamepadNodeUwp.vcxproj /p:Configuration=Release /p:Platform=x64 /t:clean;build


popd