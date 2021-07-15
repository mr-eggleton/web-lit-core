#!/bin/bash
## A sample shell script to demo concept of shell parameter expansion
## Usage: ../make_slideshow.sh crowdsourcing-on-the-web.md
## for f in *.md; do ../make_slideshow.sh $f ; done
## -------------------------------------------------------------------
 
## Get our script name ##
_me="${0##*/}"
 
## get filename from cmd arg $1
_mdpath="$1"
 
## Failsafe 
[[ $# -ne 1 ]] && { echo -en "Usage:\t$_me /path/to/file.tar\n\t$_me /path/to/file.tgz\n"; exit 1; }
 
## Backup these dirs 
_what="/etc /home /root"
 
## Get dirname 
_dirname="${_mdpath%/*}"
 
# Get filename 
_filename="${_mdpath##*/}"

pandoc -s ${_mdpath} -o ../html/${_filename%.*}.html
pandoc -s ${_mdpath} -t revealjs -o ../revealjs/${_filename%.*}.html
pandoc -s ${_mdpath} -o ../powerpoints/${_filename%.*}.pptx
