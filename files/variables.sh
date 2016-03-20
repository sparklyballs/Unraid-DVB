#!/bin/bash

##Current TBS Drivers See http://www.tbsdtv.com/download/
TBS="160219"

##Current CVH Release - See http://www.mycvh.de/openelec/dvb-firmware/
CVH="1.11"

##Current Date (DDExp Version)
DATE=$(date +'%d%m%y')

##Current Unraid Version
VERSION="$(cat /etc/unraid-version | cut -d '"' -f2)"

##Working directory
D="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

##Packages required 

URLS="
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<cpio-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<patch-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<bc-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<sqlite-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<autoconf-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<automake-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<binutils-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<gcc-[[:digit:]].*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<gcc-g\+.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<kernel-headers-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<libtool-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<m4-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<make-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<mercurial-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<perl-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<pkg-config-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<glibc-[[:digit:]].*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<libmpc-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<mpfr-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<ncurses-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<libgudev-*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<glibc-solibs-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<libcgroup-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<guile-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<gc-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<libunistring-.*.txz$' FILE_LIST | cut -b 53-9001)"
http://mirrors.slackware.com/slackware/slackware64-current/slackware64"$(egrep -e '\<flex-.*.txz$' FILE_LIST | cut -b 53-9001)"
https://github.com/dmacias72/unRAID-plugins/raw/master/packages/6.2/python-2.7.11-x86_64-2.txz
"

