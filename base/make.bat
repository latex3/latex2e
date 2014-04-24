@echo off

rem TODO


rem Makefile for LaTeX2 "base" files

  if not [%1] == [] goto init

:help

  echo.
  echo  make check [show]   - run automated check system
  echo  make clean          - clean out directory
  echo  make doc [show]     - typeset all dtx files
  echo  make localinstall   - locally install package
  echo  make savetlg ^<name^> - save test log for ^<name^>
  echo  make checktlg ^<name^> - check one test file ^<name^>
  echo  make unpack [show]  - extract modules
  echo  make ctan [show]  - build CTAN distribution
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
  set MODULE=base

  rem Unpacking information

rem  set UNPACK=%MODULE%.ins

  rem Clean up settings

  set AUXFILES=aux cmds fpl glo hd idx ilg ind log lvt tlg toc out lof lot bbl tlg-clean
  set CLEAN=fc gz pdf sty dvi def drv ldf ist fd ps xyc cfg
  set NOCLEAN=

  rem Check system set up

  set CHECKDIR=testfiles
  set CHECKEXE=etex -interaction=nonstopmode -translate-file ./ascii.tcx -efmt=..\build\latex.fmt -output-format=dvi 
  set CHECKRUNS=2

  rem Local installation settings

  set INSTALLDIR=latex\%BUNDLE%\%MODULE%
  set INSTALLFILES= *.cfg *.clo *.cls *.def *.dfu  *.fd *.ist *.ltx *.sty *.tex *.err

  rem Documentation typesetting set up (not using internal format for now, perhaps it should)

  set TYPESETEXE=pdflatex -interaction=nonstopmode

  rem Locations for the various support items required

  set MAINDIR=..
  set SCRIPTDIR=%MAINDIR%\scripts
  set VALIDATE=%MAINDIR%\validate

  set UNPACKDIR=%MAINDIR%\unpacked
  set BUILDDIR=%MAINDIR%\build
  set TESTDIR=%MAINDIR%\test
  set SUPPORTDIR=%MAINDIR%\support

  set DISTRIBDIR=%MAINDIR%\distrib


  rem Set up redirection of output

  set REDIRECT=^> nul
  if not [%2] == [] (
    if /i [%2] == [show] (
      set REDIRECT=
    )
  )

:main

  if /i [%1] == [check]        goto check
  if /i [%1] == [checktlg]     goto checktlg
  if /i [%1] == [clean]        goto clean
  if /i [%1] == [cleanall]     goto clean
  if /i [%1] == [doc]          goto doc
  if /i [%1] == [localinstall] goto localinstall
  if /i [%1] == [savetlg]      goto savetlg
  if /i [%1] == [unpack]       goto unpack
  if /i [%1] == [ctan]      goto ctan

  goto help

:check-init

  if not exist %CHECKDIR%\nul goto end

  rem Check for Perl, and give up if it is not found

  call :perl
  if ERRORLEVEL 1 goto :EOF

  rem Remove any old files, and then copy the test system into place

  del /q %TESTDIR%\*

  rem Unpack, allowing for using a 'trace' version or similar

  call :unpack

rem next unpacks are needed if we want to process all test files
rem i.e. also those from the required portion, but I guess we really 
rem better keep this separate

rem   call ..\required\tools\make.bat unpack show
rem   call ..\required\graphics\make.bat unpack show
rem   call ..\required\cyrillic\make.bat unpack show

  copy /y %SCRIPTDIR%\log2tlg  %TESTDIR% > nul
  copy /y %VALIDATE%\test2e.tex %TESTDIR% > nul
  copy /y %VALIDATE%\test209.tex %TESTDIR% > nul
  copy /y %VALIDATE%\ascii.tcx  %TESTDIR% > nul

  if exist %CHECKDIR%\helpers\nul (
      copy /y %CHECKDIR%\helpers\* %TESTDIR% > nul
  )

  goto :EOF


:check

  call :check-init

  rem Copy all test files for which there is a matching reference log

  for %%I in (%CHECKDIR%\*.lvt) do (
    if exist %CHECKDIR%\%%~nI.tlg (
      copy /y %CHECKDIR%\%%~nI.lvt %TESTDIR% > nul
      copy /y %CHECKDIR%\%%~nI.tlg %TESTDIR% > nul
    ) else (
      echo %CHECKDIR%\%%~nI.tlg missing
    )
  )

  goto check-execute

:checktlg

  if [%2] == [] goto help
  if not exist %CHECKDIR%\%2.lvt (
    echo.
    echo Check file %2.lvt not found!
    shift
    goto end
  )

  call :check-init

  rem Copy all test files for which there is a matching reference log

  for %%I in (%CHECKDIR%\%2.lvt) do (
    if exist %CHECKDIR%\%%~nI.tlg (
      copy /y %CHECKDIR%\%%~nI.lvt %TESTDIR% > nul
      copy /y %CHECKDIR%\%%~nI.tlg %TESTDIR% > nul
    ) else (
      echo %CHECKDIR%\%%~nI.tlg missing
    )
  )

 shift
 goto check-execute

:check-execute

  echo.
  echo Running checks on

  SET TEXINPUTS=.;%UNPACKDIR%;%BUILDDIR%

  pushd %TESTDIR%

  for %%I in (*.tlg) do (
    echo   %%~nI
    for /l %%J in (1,1,%CHECKRUNS%) do (
        %CHECKEXE% %%~nI.lvt <%SCRIPTDIR%\enter.txt %REDIRECT%
      )
    %PERLEXE% log2tlg %%~nI < %%~nI.log > %%~nI.new.log

rem    del /q %%~nI.log > nul
    ren %%~nI.log %%~nI.logfull > nul
    ren %%~nI.new.log %%~nI.log > nul

rem remove empty lines from .tlg file
    %PERLEXE% -n -e "/^\s*$/ || print" < %%~nI.tlg >%%~nI.clean.tlg

    fc /n  %%~nI.log %%~nI.clean.tlg > %%~nI.fc
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
    set PROBLEM=true
    echo   Checks fails for
    for %%I in (*.fc) do (
      echo   - %%~nI
    )
  ) else (
    echo   All checks passed
  )

  for %%I in (*.tlg) do (
    if exist %%~nI.pdf del /q %%~nI.pdf
    if exist %%~nI.dvi del /q %%~nI.dvi
  )

  popd

  goto end

:clean


  del /q %DISTRIBDIR%\base\*
  del /q %DISTRIBDIR%\unpacked\*

  del /q %TESTDIR%\*
  del /q %UNPACKDIR%\*
  del /q %BUILDDIR%\*


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
  echo Typesetting (using normal TeX system on machine)

  for %%I in (*.dtx) do (
    if %%~xI == .dtx (
    echo   %%I
    %TYPESETEXE% -draftmode %%I %REDIRECT%
    if ERRORLEVEL 1 (
      echo   ! Compilation failed
      set PROBLEM=true
    ) else (
      if exist %%~nI.idx (
        makeindex -q -s l3doc.ist -o %%~nI.ind %%~nI.idx > nul
      )
      %TYPESETEXE% %%I %REDIRECT%
      %TYPESETEXE% %%I %REDIRECT%
    )
  ) else echo %%I skipped 
  )

  for %%I in (*.fdd) do (
    if %%~xI == .fdd (
    echo   %%I
    %TYPESETEXE% -draftmode %%I %REDIRECT%
    if ERRORLEVEL 1 (
      echo   ! Compilation failed
      set PROBLEM=true
    ) else (
      if exist %%~nI.idx (
        makeindex -q -s l3doc.ist -o %%~nI.ind %%~nI.idx > nul
      )
      %TYPESETEXE% %%I %REDIRECT%
      %TYPESETEXE% %%I %REDIRECT%
    )
  ) else echo %%I skipped 
  )

  for %%I in (source2e.tex sample2e.tex lppl.tex small2e.tex) do (
    if %%~xI == .tex (
    echo   %%I
    %TYPESETEXE% -draftmode %%I %REDIRECT%
    if ERRORLEVEL 1 (
      echo   ! Compilation failed
      set PROBLEM=true
    ) else (
      if exist %%~nI.idx (
        makeindex -q -s l3doc.ist -o %%~nI.ind %%~nI.idx > nul
      )
      %TYPESETEXE% %%I %REDIRECT%
      %TYPESETEXE% %%I %REDIRECT%
    )
  ) else echo %%I skipped 
  )

 if "%PROBLEM%" == "true" (
    echo.
    echo There have been some problems!
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


  pushd %UNPACKDIR% 

  for %%I in (%INSTALLFILES%) do (
    copy /y %%I "%INSTALLROOT%" > nul
  )

  popd

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

  if not exist %CHECKDIR%\%2.lvt (
    echo.
    echo Check file %2.lvt not found!
    shift
    goto end
  )

  call :check-init

  rem Copy the test file 

  copy /y %CHECKDIR%\%2.lvt %TESTDIR% > nul

  echo.
  echo Creating and copying %2.tlg

  SET TEXINPUTS=.;%UNPACKDIR%;%BUILDDIR%

  pushd %TESTDIR%

  for /l %%I in (1,1,%CHECKRUNS%) do (
      %CHECKEXE% %2.lvt %REDIRECT%
    )
  %PERLEXE% log2tlg %2 < %2.log > %2.tlg

  popd

  copy /y %TESTDIR%\%2.tlg %CHECKDIR%\%2.tlg > nul


  shift

  goto clean-int


:ctan

  del /q %DISTRIBDIR%\base\*
  del /q %DISTRIBDIR%\unpacked\*

  for %%I in (*.cls *.dtx latexbug.el *.err *.fdd *.ins ltpatch.ltx README *.tex *.txt) do (
    copy /y %%I %DISTRIBDIR%\base\%%I >nul
  )

  for %%I in (*.cls~ *.dtx~ *atexbug.el~ *.err~ *.fdd~ *.ins~ *tpatch.ltx~ *EADME~ *.tex~ *.txt~) do (
    echo %%I
    if exist %DISTRIBDIR%\base\%%I del /q %DISTRIBDIR%\base\%%I >nul
  )

  call :unpack

  copy /y %UNPACKDIR%\* %DISTRIBDIR%\unpacked >nul

  call :doc

  pushd %UNPACKDIR%

  for %%I in (*.pdf) do (
    copy /y %%I %DISTRIBDIR%\base\%%I >nul
  )

  popd

  
  goto end


:unpack

  del /q %UNPACKDIR%\*
  del /q %BUILDDIR%\*

  echo. 
  echo ***************************************************
  echo *** Copying kernel bootstrap sources ...
  echo ***************************************************
  echo. 

  for %%I in (*.dtx *.ins *.fdd ltpatch.ltx *.tex *.cls) do (
    copy /y %%I %UNPACKDIR%\%%I >nul
  )

rem getting rid of emacs ~ files

  for %%I in (*.dtx *.ins *.fdd ltpatch.ltx *.tex *.cls) do (
    if exist %UNPACKDIR%\%%I~ rm %UNPACKDIR%\%%I~
  )

rem remove other files
  for %%I in (ttcterrata.cls) do (
    if exist %UNPACKDIR%\%%I del %UNPACKDIR%\%%I
  )


rem unpack the distribution
rem Make sure that no external input files are read by setting TEXINPUTS

  echo. 
  echo ***************************************************
  echo *** Generating LaTeX2e kernel bootstrap files...
  echo ***************************************************
  echo. 

  pushd %UNPACKDIR% 
  SET TEXINPUTS=.;  
  etex -ini unpack.ins <%SCRIPTDIR%\yes.txt


  for %%I in (*.dtx *.ins *.fdd ) do (
    if exist %%I del %%I  >nul
  )



  popd
  pushd %BUILDDIR%

  echo. 
  echo ***************************************************
  echo *** Copying format support files...
  echo ***************************************************
  echo. 
  copy /y %SUPPORTDIR%\*.*

  echo. 
  echo ***************************************************
  echo *** Generating LaTeX2e kernel formats...
  echo ***************************************************
  echo. 

  SET TEXINPUTS=.;%UNPACKDIR%

  etex -ini -etex latex.ltx <%SCRIPTDIR%\yes.txt   
  pdfetex -ini -etex -jobname=pdflatex "*pdflatex.ini" latex.ltx <%SCRIPTDIR%\yes.txt   

  set TEXINPUTS=
  popd

  goto end

:end

rem  echo base: PROBLEM="%PROBLEM%" and GLOBALPROBLEM="%GLOBALPROBLEM%"

  endlocal & if "%PROBLEM%" == "true" set GLOBALPROBLEM=%PROBLEM%

  rem If something like "make check show" was used, remove the "show"

  if /i [%2] == [show] shift

  shift
  if not [%1] == [] goto main
