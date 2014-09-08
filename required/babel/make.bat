echo off

rem Makefile for LaTeX2 "babel" files

  if not [%1] == [] goto init

:help

  echo.
  echo  make check [show]   - run automated check system
  echo  make clean          - clean out directory
  echo  make doc [show]     - typeset all dtx files
  echo  make localinstall   - locally install package
  echo  make savetlg ^<name^> - save test log for ^<name^>
  echo  make unpack [show]  - extract modules
  echo.
  echo  The "show" option enables display of the output
  echo  of the TeX runs in the terminal.

  goto :EOF

:init

  rem Avoid clobbering anyone else's variables

  setlocal

  rem Safety precaution against awkward paths

  cd /d "%~dp0"

  rem The name of the module and the bundle it is part of

  set BUNDLE=latex2e
  set MODULE=babel

  rem Unpacking information

  set UNPACK=%MODULE%.ins

  rem Clean up settings

  set AUXFILES=aux cmds fpl glo hd idx ilg ind log lvt tlg toc out lof bbl
  set CLEAN=fc gz pdf sty dvi def drv ldf ist fd ps xyc cfg
  set NOCLEAN=

  rem Check system set up

  set CHECKDIR=testfiles
  set CHECKEXE=latex -translate-file ./ascii.tcx
  set CHECKRUNS=2
  set CHECKUNPACK=%UNPACK%

  rem Local installation settings

  set INSTALLDIR=latex\%BUNDLE%\%MODULE%
  set INSTALLFILES=*.sty *.ldf *.def *.tex *.fd *.cfg

  rem Documentation typesetting set up

  set TYPESETEXE=pdflatex -interaction=nonstopmode

  rem Locations for the various support items required

  set MAINDIR=..\..
  set SCRIPTDIR=%MAINDIR%\scripts
  set VALIDATE=%MAINDIR%\validate

  rem Set up redirection of output

  set REDIRECT=^> nul
  if not [%2] == [] (
    if /i [%2] == [show] (
      set REDIRECT=
    )
  )

:main

  if /i [%1] == [check]        goto check
  if /i [%1] == [clean]        goto clean
  if /i [%1] == [cleanall]     goto clean
  if /i [%1] == [doc]          goto doc
  if /i [%1] == [localinstall] goto localinstall
  if /i [%1] == [savetlg]      goto savetlg
  if /i [%1] == [unpack]       goto unpack

  goto help

:check

  if not exist %CHECKDIR%\nul goto end

  rem Check for Perl, and give up if it is not found

  call :perl
  if ERRORLEVEL 1 goto :EOF

  rem Unpack, allowing for using a 'trace' version or similar

  for %%I in (%CHECKUNPACK%) do (
    (echo y & echo y) | tex %%I %REDIRECT%
  )

  rem Remove any old files, and copy the test system into place

  for %%I in (fc lvt tlg) do (
    if exist *.%%I del /q *.%%I
  )

  copy /y %SCRIPTDIR%\log2tlg   > nul
  copy /y %VALIDATE%\test2e.tex > nul
  copy /y %VALIDATE%\ascii.tcx  > nul

  rem Copy all test files for which there is a matching reference log

  for %%I in (%CHECKDIR%\*.lvt) do (
    if exist %CHECKDIR%\%%~nI.tlg (
      copy /y %CHECKDIR%\%%~nI.lvt > nul
      copy /y %CHECKDIR%\%%~nI.tlg > nul
    )
  )

  echo.
  echo Running checks on

  for %%I in (*.tlg) do (
    echo   %%~nI
    for /l %%J in (1,1,%CHECKRUNS%) do (
        %CHECKEXE% %%~nI.lvt %REDIRECT%
      )
    %PERLEXE% log2tlg %%~nI < %%~nI.log > %%~nI.new.log
    del /q %%~nI.log > nul
    ren %%~nI.new.log %%~nI.log > nul
    fc /n  %%~nI.log %%~nI.tlg > %%~nI.fc
  )

  for %%I in (*.fc) do (
    for /f "skip=1 tokens=1" %%J in (%%~nI.fc) do (
      if "%%J" == "FC:" (
        del /q %%I
      )
    )
  )

  echo.

  if exist *.fc (
    echo   Checks fails for
    for %%I in (*.fc) do (
      echo   - %%~nI
    )
  ) else (
    echo   All checks passed
  )

  for %%I in (*.tlg) do (
    if exist %%~nI.pdf del /q %%~nI.pdf
  )

  goto clean-int

:clean

  for %%I in (%NOCLEAN%) do (
    copy /y %%I %%I.bak > nul
  )

  for %%I in (%CLEAN%) do (
    if exist *.%%I del /q *.%%I
  )

  for %%I in (%NOCLEAN%) do (
    copy /y %%I.bak %%I > nul
    del /q %%I.bak
  )

:clean-int

  for %%I in (%AUXFILES%) do (
    if exist *.%%I del /q *.%%I
  )

  if exist log2tlg del /q log2tlg
  if exist test2e.tex del /q test2e.tex
  if exist ascii.tcx del /q ascii.tcx

  goto end

:doc

  echo.
  echo Typesetting

  for %%I in (*.dtx) do (
    echo   %%I
    %TYPESETEXE% -draftmode %%I %REDIRECT%
    if ERRORLEVEL 1 (
      echo   ! Compilation failed
    ) else (
      if exist %%~nI.idx (
        makeindex -q -s gind.ist -o %%~nI.ind %%~nI.idx > nul
      )
      %TYPESETEXE% %%I %REDIRECT%
      %TYPESETEXE% %%I %REDIRECT%
    )
  )

  goto clean-int

:localinstall

  call :unpack

  echo.
  echo Installing files

  rem Find local root if possible

  if not defined TEXMFHOME (
    for /f "delims=" %%I in ('kpsewhich --var-value=TEXMFHOME') do @set TEXMFHOME=%%I
    if "%TEXMFHOME%" == "" (
      set TEXMFHOME=%USERPROFILE%\texmf
    )
  )

  set INSTALLROOT=%TEXMFHOME%\tex\%INSTALLDIR%

  if exist "%INSTALLROOT%\*.*" rmdir /q /s "%INSTALLROOT%"
  mkdir "%INSTALLROOT%"

  for %%I in (%INSTALLFILES%) do (
    copy /y %%I "%INSTALLROOT%" > nul
  )

  goto clean-int

:perl

  set PATHCOPY=%PATH%

:perl-loop

  if defined PERLEXE goto :EOF

  rem This code is used to find out if Perl is available in the path

  for /f "delims=; tokens=1,2*" %%I in ("%PATHCOPY%") do (
    if exist %%I\perl.exe set PERLEXE=perl
    set PATHCOPY=%%J;%%K
  )

  if defined PERLEXE goto :EOF

  rem No Perl found in the path, so try some standard locations

  if not "%PATHCOPY%" == ";" goto perl-loop

  if exist %SYSTEMROOT%\Perl\bin\perl.exe set PERLEXE=%SYSTEMROOT%\Perl\bin\perl
  if exist %ProgramFiles%\Perl\bin\perl.exe set PERLEXE=%ProgramFiles%\Perl\bin\perl
  if exist %SYSTEMROOT%\strawberry\Perl\bin\perl.exe set PERLEXE=%SYSTEMROOT%\strawberry\Perl\bin\perl

  if defined PERLEXE goto :EOF

  rem Failed to find Perl, give up and kill the entire batch process

  echo.
  echo  This procedure requires Perl, but it could not be found.

  exit /b 1

  goto :EOF

:savetlg

  call :perl

  if [%2] == [] goto help
  if not exist %CHECKDIR%\%2.lvt (
    echo.
    echo Check file %2.lvt not found!
    shift
    goto end
  )

  for %%I in (%CHECKUNPACK%) do (
    (echo y & echo y) | tex %%I %REDIRECT%
  )

  copy /y %SCRIPTDIR%\log2tlg   > nul
  copy /y %VALIDATE%\test2e.tex > nul
  copy /y %VALIDATE%\ascii.tcx  > nul
  copy /y %CHECKDIR%\%2.lvt              > nul

  echo.
  echo Creating and copying %2.tlg

  for /l %%I in (1,1,%CHECKRUNS%) do (
      %CHECKEXE% %2.lvt %REDIRECT%
    )
  %PERLEXE% log2tlg %2 < %2.log > %2.tlg
  copy /y %2.tlg %CHECKDIR%\%2.tlg > nul

  shift

  goto clean-int

:unpack

  for %%I in (%UNPACK%) do (
    (echo y & echo y) | tex %%I %REDIRECT%
  )

  goto end

:end

  rem If something like "make check show" was used, remove the "show"

  if /i [%2] == [show] shift

  shift
  if not [%1] == [] goto main
