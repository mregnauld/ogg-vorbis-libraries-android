#!/bin/bash

ogg_ver=1.3.3
vor_ver=1.3.6

if [ "$1" == clean ]; then
  rm -rf obj
  rm -rf inc
  rm -rf lib
  rm -rf libogg-$ogg_ver
  rm -rf libogg-$ogg_ver.tar.gz
  rm -rf libvorbis-$vor_ver
  rm -rf libvorbis-$vor_ver.tar.gz
  exit
fi

function unpack-and-configure {
  what=$1
  version=$2

  rm -rf lib$what-$version
  
  if [ ! -f lib$what-$version.tar.gz ]; then
    wget http://downloads.xiph.org/releases/$what/lib$what-$version.tar.gz
  fi
  
  tar xf lib$what-$version.tar.gz

  (cd lib$what-$version; ./configure --host=arm-android-linux)
}

unpack-and-configure ogg $ogg_ver
unpack-and-configure vorbis $vor_ver

ndk-build OGG_DIR=libogg-$ogg_ver VORBIS_DIR=libvorbis-$vor_ver

mkdir -p inc/ogg
mkdir -p inc/vorbis
cp ./libogg-$ogg_ver/include/ogg/*.h ./inc/ogg
cp ./libvorbis-$vor_ver/include/vorbis/*.h ./inc/vorbis

mkdir -p lib/armeabi-v7a
mkdir -p lib/x86_64
mkdir -p lib/arm64-v8a
mkdir -p lib/x86
cp ./obj/local/armeabi-v7a/libogg.a ./lib/armeabi-v7a
cp ./obj/local/armeabi-v7a/libvorbis.a ./lib/armeabi-v7a
cp ./obj/local/x86_64/libogg.a ./lib/x86_64
cp ./obj/local/x86_64/libvorbis.a ./lib/x86_64
cp ./obj/local/arm64-v8a/libogg.a ./lib/arm64-v8a
cp ./obj/local/arm64-v8a/libvorbis.a ./lib/arm64-v8a
cp ./obj/local/x86/libogg.a ./lib/x86
cp ./obj/local/x86/libvorbis.a ./lib/x86

