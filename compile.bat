@echo off
echo ==========================================
echo Online Quiz System - Compilation Script
echo ==========================================

:: 1. SETUP PATHS
:: You MUST set the path to your Servlet API Jar (usually in Tomcat/lib)
:: Example: "C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib\servlet-api.jar"
set SERVLET_API_JAR="C:\path\to\your\tomcat\lib\servlet-api.jar"

:: Project paths
set SRC_DIR=src
set OUT_DIR=WebContent\WEB-INF\classes

:: 2. PREPARE OUTPUT DIRECTORY
if not exist "%OUT_DIR%" (
    echo Creating output directory: %OUT_DIR%
    mkdir "%OUT_DIR%"
)

:: 3. CHECK DEPENDENCIES
if not exist %SERVLET_API_JAR% (
    echo [ERROR] servlet-api.jar NOT FOUND!
    echo You must edit this file (compile.bat) and set SERVLET_API_JAR to your Tomcat lib path.
    echo Current path: %SERVLET_API_JAR%
    pause
    exit /b
)

:: 4. COMPILE
echo Compiling Java source files...
javac -d "%OUT_DIR%" -cp %SERVLET_API_JAR% ^
    "%SRC_DIR%\com\quiz\util\*.java" ^
    "%SRC_DIR%\com\quiz\model\*.java" ^
    "%SRC_DIR%\com\quiz\dao\*.java" ^
    "%SRC_DIR%\com\quiz\controller\*.java"

if %errorlevel% neq 0 (
    echo [FAILURE] Build Failed! Check errors above.
    pause
    exit /b
)

echo.
echo [SUCCESS] Build Successful!
echo Class files generated in %OUT_DIR%
echo.
echo ==========================================
echo TO RUN:
echo 1. Ensure MySQL is running and schema.sql is executed.
echo 2. Copy the 'OnlineQuizSystem' folder to your Tomcat 'webapps' folder.
echo 3. Start Tomcat.
echo 4. Go to http://localhost:8080/OnlineQuizSystem
echo ==========================================
pause
