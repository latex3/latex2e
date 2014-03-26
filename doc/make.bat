@echo off

rem Makefile for LaTeX2e documentation files

  if not [%1] == [] goto :init

:help

  echo.
  echo  make check        - runs the automated test suite
  echo  make doc [show]   - runs all documentation files
  echo  make clean        - clean out directory tree
  echo  make ctan         - create CTAN-ready archives
  echo  make localinstall - install files in local texmf tree
  echo  make unpack       - extract packages

  goto :EOF

:init

  rem Avoid clobbering anyone else's variables

  setlocal

  rem Safety precaution against awkward paths

  cd /d "%~dp0"

  set TYPESETEXE=pdflatex -interaction=nonstopmode

  set MAINDIR=..
  set DISTRIBDIR=%MAINDIR%\distrib

  rem Clean up settings

  set AUXFILES=aux cmds fpl glo hd idx ilg ind log lvt tlg toc out lof lot bbl tlg-clean
  set CLEAN=fc gz pdf sty dvi def drv ldf ist fd ps xyc cfg
  set NOCLEAN=


  rem Set up redirection of output

  set REDIRECT=^> nul
  if not [%2] == [] (
    if /i [%2] == [show] (
      set REDIRECT=
    )
  )


:main

  rem Cross-compatibility with *nix
  
  if /i [%1] == [-s] shift

  if /i [%1] == [check]        goto check
  if /i [%1] == [doc]          goto doc
  if /i [%1] == [clean]        goto clean
  if /i [%1] == [cleanall]     goto clean
  if /i [%1] == [ctan]         goto ctan
  if /i [%1] == [localinstall] goto localinstall
  if /i [%1] == [unpack]       goto unpack

  goto help

:check

  echo Nothing to do here

  goto end

:doc

  echo.
  echo Typesetting (using normal TeX system on machine)

  for %%I in (*.tex) do (
    if %%~xI == .tex (
    echo   %%I
    %TYPESETEXE% -draftmode %%I %REDIRECT%
    if ERRORLEVEL 1 (
      echo   ! Compilation failed
      set PROBLEM=true
    ) else (
      If Exist %%~nI.idx (
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
 ) else (
    goto clean-int
 )

  goto end

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

  goto end

:ctan

  del /q %DISTRIBDIR%\doc\*

  call :clean
  call :doc

  for %%I in (*.tex *.pdf) do (
    copy /y %%I %DISTRIBDIR%\doc\%%I >nul
  )

  for %%I in (*.tex~) do (
    echo %%I
    if exist %DISTRIBDIR%\doc\%%I del /q %DISTRIBDIR%\doc\%%I >nul
  )

  goto end

:localinstall

  echo.
  echo Nothing to do here

  goto end

:unpack

  echo.
  echo Nothing to do here

  goto end

:end

rem  echo doc: PROBLEM="%PROBLEM%" and GLOBALPROBLEM="%GLOBALPROBLEM%"

  endlocal & if "%PROBLEM%" == "true" set GLOBALPROBLEM=%PROBLEM%

  rem If something like "make check show" was used, remove the "show"

  if /i [%2] == [show] shift

  shift
  if not [%1] == [] goto main


