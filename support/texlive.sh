#!/usr/bin/env sh

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../support/texlive.profile

  cd ..
fi

# Backups only make the cache bigger
tlmgr option -- autobackup 0

# Update a cached version first (else later step might fail)
tlmgr update --self

# Needed for any use of texlua even if not testing LuaTeX
tlmgr install luatex

# The test framework itself
tlmgr install l3build

# Required to build plain and LaTeX formats:
# TeX90 plain for unpacking, pdfLaTeX, LuaLaTeX and XeTeX for tests
tlmgr install cm etex knuth-lib latex-bin tex tex-ini-files unicode-data \
  xetex
 
# Assuming a 'basic' font set up, metafont is required to avoid
# warnings with some packages and errors with others
tlmgr install metafont mfware texlive-scripts

# Contrib packages: done as a block to avoid multiple calls to tlmgr
tlmgr install   \
  amsfonts      \
  ec            \
  fontspec      \
  hyperref      \
  iftex         \
  kvoptions     \
  oberdiek      \
  pdftexcmds    \
  lh            \
  lualibs       \
  luaotfload    \
  tex-gyre      \
  stringenc     \
  url

# Additional support for typesetting
tlmgr install  \
  amscls       \
  atbegshi     \
  atveryend    \
  auxhook      \
  babel-german \
  bigintcalc   \
  bitset       \
  bookmark     \
  cbfonts      \
  csquotes     \
  dvips        \
  epstopdf     \
  epstopdf-pkg \
  etexcmds     \
  etoolbox     \
  fancyvrb     \
  fc           \
  geometry     \
  gettitlestring \
  graphics-def \
  helvetic     \
  hologo       \
  hycolor      \
  imakeidx     \
  infwarerr    \
  intcalc      \
  kvdefinekeys \
  kvoptions    \
  kvsetkeys    \
  letltxmacro  \
  ltxcmds      \
  ly1          \
  makeindex    \
  mflogo       \
  palatino     \
  pdfescape    \
  pl           \
  refcount     \
  rerunfilecheck \
  sauter       \
  times        \
  uniquecounter \
  vntex        \
  wasy         \
  wsuipa       \
  xkeyval      \
  zref

# ensure we have the latest of the above packages
tlmgr update --all
