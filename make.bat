@echo off

rem TODO
rem change babel to same system?

rem Makefile for LaTeX2e files

  if not [%1] == [] goto :init

:help

  echo.
  echo  make check         - runs the automated test suite
  echo  make doc           - runs all documentation files
  echo  make clean         - clean out directory tree
  echo  make ctan          - create CTAN-ready archives
  echo  make ctan ^<name^> - create CTAN-ready archive for required\name
  echo  make localinstall  - install files in local texmf tree
  echo  make unpack        - extract packages

  goto :EOF

:init

  rem Avoid clobbering anyone else's variables

  setlocal

  rem Safety precaution against awkward paths

  cd /d "%~dp0"

  rem Clean up settings

  set CLEAN=zip

  rem Bundles that are part of the overall LaTeX2e structure

  set BUNDLES=base doc required\tools required\graphics required\cyrillic
rem  set BUNDLES=required\cyrillic

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

  goto end

:ctan

  if [%2] == [] goto ctanall

  if not exist required\%2 (
    echo.
    echo Module required\%2 not found!
    shift
    goto end
  )

  pushd required\%2

    call make clean
    call make localinstall
    call make check
rem    call make doc         -- done in ctan
    call make ctan

  popd

  zip -v -r -ll latex2e-distrib-%2.zip distrib\required\%2 -x "*~" "*.pdf" 
  zip -v -r -g  latex2e-distrib-%2.zip distrib\required\%2\*.pdf -x "*~"

  if "%GLOBALPROBLEM%" == "true" (
     echo.
     echo ==================================
     echo There have been some problems!!!!!
     echo ==================================
  )

  shift

  endlocal & set GLOBALPROBLEM=

  goto end

:ctanall

  call :clean
  call :localinstall
  call :check
rem  call :doc               --- done in :ctan

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

  zip -v -r -ll latex2e-distrib.zip distrib\base distrib\doc\ distrib\unpacked -x "*~" "*.pdf"
  zip -v -r -g  latex2e-distrib.zip distrib\base distrib\doc\*.pdf distrib\unpacked\*.pdf -x "*~" 

  for %%I in (tools graphics cyrillic) do (
    zip -v -r -ll latex2e-distrib-%%I.zip distrib\required\%%I -x "*~" "*.pdf"
    zip -v -r -g  latex2e-distrib-%%I.zip distrib\required\%%I\*.pdf -x "*~"
  )

  if "%GLOBALPROBLEM%" == "true" (
     echo.
     echo ==================================
     echo There have been some problems!!!!!
     echo ==================================
  )

  endlocal & set GLOBALPROBLEM=

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

  shift
  if not [%1] == [] goto main
