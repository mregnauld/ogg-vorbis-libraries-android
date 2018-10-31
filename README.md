# libogg and libvorbis libraries for Android

## Presentation

* For simplicity sake, this code is licensed under the same license as the libvorbis library from (http://xiph.org/vorbis/)
* This project is highly inspired from https://github.com/MoNTE48/libvorbis-android

This project provides static libogg and libvorbis libraries, and also allows you to compile them on your own, using build.sh.

## Usage

To compile the libraries, here is how you can proceed (tested on Linux Ubuntu 16.04.5):

1. Download the Android NDK here: https://developer.android.com/ndk/downloads/, and choose Linux 64-bit (x86) (tested with version r18b)
2. Unzip the Android NDK in your *home* directory, and name it android-ndk
3. Clone this project, also in your *home* directory, and go in it (in ogg-vorbis-libraries-android)
4. In the *ogg-vorbis-libraries-android* directory, open a terminal
5. Add the ndk-build in your PATH, by typing: `PATH=${PATH}:/home/<your_user_name>/android-ndk/build`
6. Then, `chmod +x ./build.sh`
7. Finally, compile everything by typing: `./build.sh`

