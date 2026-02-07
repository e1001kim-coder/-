@echo off
echo Installing OpenCLAW on Windows...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed. Please install Python 3.7+ from https://www.python.org/
    pause
    exit /b 1
)

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Error: Git is not installed. Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

REM Check if CMake is installed
cmake --version >nul 2>&1
if errorlevel 1 (
    echo Warning: CMake is not installed. Installing CMake via pip...
    pip install cmake
)

REM Install Clawpack
echo Installing Clawpack...
pip install clawpack

REM Clone OpenCLAW repository
echo Cloning OpenCLAW repository...
git clone https://github.com/clawpack/openclaw.git
cd openclaw

REM Create build directory
mkdir build
cd build

REM Run CMake
echo Running CMake...
cmake ..

REM Build OpenCLAW
echo Building OpenCLAW...
cmake --build . --config Release
echo.
echo OpenCLAW installation completed!
echo.
pause
