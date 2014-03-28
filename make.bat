@echo off

rem TODO
rem add the required bundles

rem Makefile for LaTeX2e files

  if not [%1] == [] goto :init

:help

  echo.
  echo  make check        - runs the automated test suite
  echo  make doc          - runs all documentation files
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

  rem Clean up settings

  set CLEAN=zip

  rem Bundles that are part of the overall LaTeX2e structure

  set BUNDLES=base doc

  set MAINDIR=.
  set DISTRIBDIR=%MAINDIR%\distrib
  set UNPACKDIR=%MAINDIR%\unpacked
  set BUILDDIR=%MAINDIR%\build
  set TESTDIR=%MAINDIR%\test


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

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] check
    echo ======================================
    pushd %%I
    call make check
    popd
  )

  goto end

:doc

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] doc
    echo ======================================
    pushd %%I
    call make doc
    popd
  )

  goto end

:clean

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] clean
    echo ======================================
    pushd %%I
    call make clean
    popd
  )

    echo ======================================
    echo == [main] clean
    echo ======================================
  for %%I in (%CLEAN%) do (
    if exist *.%%I del /q *.%%I
  )

  del /q %DISTRIBDIR%\doc\*
  del /q %DISTRIBDIR%\base\*
  del /q %DISTRIBDIR%\unpacked\*

  del /q %TESTDIR%\*
  del /q %UNPACKDIR%\*
  del /q %BUILDDIR%\*

  goto end

:ctan

  call :clean
  call :localinstall
  call :check

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] ctan
    echo ======================================
    pushd %%I
    call make ctan
    popd
  )

    echo ======================================
    echo == [main] ctan
    echo ======================================

  zip -v -r latex2e-distrib.zip distrib -x "*~" 

  goto end

:localinstall

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] localinstall
    echo ======================================
    pushd %%I
    call make localinstall
    popd
  )

  goto end

:unpack

  for %%I in (%BUNDLES%) do (
    echo ======================================
    echo == [%%I] unpack
    echo ======================================
    pushd %%I
    call make unpack
    popd
  )

  goto end

:end

  if "%GLOBALPROBLEM%" == "true" (
     echo.
     echo ==================================
     echo There have been some problems!!!!!
     echo ==================================
  )

  endlocal & set GLOBALPROBLEM=

  
  shift
  if not [%1] == [] goto main
