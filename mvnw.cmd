@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM M2_HOME - location of maven's installed home (default is your unzipped maven install).
@REM M2_REPO - location of maven's local repository (default is %USERPROFILE%\.m2\repository).
@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a keystroke before ending
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM     e.g. to debug Maven itself, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM ---------------------------------------------------------------------------

@setlocal

set ERROR_CODE=0

@REM To isolate internal variables from possible post scripts, we use another setlocal
@setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Error: JAVA_HOME not found in your environment. >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Error: JAVA_HOME is set to an invalid directory. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

@REM ==== END VALIDATION ====

:init

@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".
@REM Fallback to current working directory if not found.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
IF "%MAVEN_PROJECTBASEDIR%"=="" (
  set MAVEN_PROJECTBASEDIR=%CD%
)

set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
set WRAPPER_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar"
set WRAPPER_JAR_ARGS=""

if exist %WRAPPER_JAR% (
    set WRAPPER_JAR_ARGS="has-wrapper"
)

@REM Download maven-wrapper.jar if it doesn't exist
if not exist "%WRAPPER_JAR%" (
    if not "%WRAPPER_URL%"=="" (
        setlocal enabledelayedexpansion
        if "%QUIET%"=="true" (
          set "LOG_AND_ECHO=@echo off"
          set "LOG_LEVEL_FAIL=@echo off"
          set "LOG_LEVEL_ERROR=@echo off"
          set "LOG_LEVEL_WARN=@echo off"
          set "LOG_LEVEL_INFO=@echo off"
          set "LOG_LEVEL_DEBUG=@echo off"
        ) else (
          set "LOG_AND_ECHO=@echo"
          set "LOG_LEVEL_FAIL=@echo ERROR:"
          set "LOG_LEVEL_ERROR=@echo ERROR:"
          set "LOG_LEVEL_WARN=@echo WARNING:"
          set "LOG_LEVEL_INFO=@echo INFO:"
          set "LOG_LEVEL_DEBUG=@echo DEBUG:"
        )
        %LOG_AND_ECHO% Downloading maven-wrapper.jar from: %WRAPPER_URL%
        powershell -Command "&{"^
            "$webclient = new-object System.Net.WebClient;"^
            "if (-not ([string]::IsNullOrEmpty('%WRAPPER_PROXY%'))) {"^
            "$webclient.Proxy = new-object System.Net.WebProxy('%WRAPPER_PROXY%');"^
            "if (-not ([string]::IsNullOrEmpty('%WRAPPER_PROXY_USER%'))) {"^
            "$webclient.Proxy.Credentials = new-object System.Net.NetworkCredential('%WRAPPER_PROXY_USER%', '%WRAPPER_PROXY_PASSWORD%');"^
            "}"^
            "}"^
            "try {"^
            "$File = '%WRAPPER_JAR%';"^
            "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;"^
            "$webclient.DownloadFile('%WRAPPER_URL%', $File);"^
            "if (Test-Path $File) {"^
            "echo 'Downloaded successfully';"^
            "} else {"^
            "echo 'Failed to download';"^
            "exit /b 1;"^
            "}"^
            "} catch {"^
            "echo $_.Exception | out-string;"^
            "exit /b 1;"^
            "}"^
        "}"
        if ERRORLEVEL 1 (
            setlocal enabledelayedexpansion
            %LOG_LEVEL_FAIL% Could not download %WRAPPER_URL%
            endlocal
        )
        endlocal
    )
)
@REM End of extension

if exist "%WRAPPER_JAR%" (
    if "%QUIET%"=="true" (
      set "LOG_AND_ECHO=@echo off"
    ) else (
      set "LOG_AND_ECHO=@echo"
    )
    %LOG_AND_ECHO% Running the Maven wrapper (%WRAPPER_JAR%)
    "%JAVA_HOME%\bin\java.exe" %MAVEN_OPTS% -cp "%WRAPPER_JAR%" "-Dmaven.wrapperRootDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CONFIG% "%@%"
) else (
    if not "%WRAPPER_URL%"=="" (
        echo Error: Maven wrapper not found: %WRAPPER_JAR%
    ) else (
        echo Error: Maven not found and WRAPPER_URL not set.
    )
    exit /b 1
)

if ERRORLEVEL 1 (
  if not "%WRAPPER_LAUNCHER%"=="" (
    %LOG_LEVEL_FAIL% Maven wrapper exited with status %ERRORLEVEL%
  )
  exit /b %ERRORLEVEL%
)

endlocal
if "%ERRORLEVEL%"=="0" (
  goto mainEnd
)

:error
set ERROR_CODE=1

:mainEnd
@endlocal & exit /b %ERROR_CODE%
