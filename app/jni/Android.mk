LOCAL_PATH := $(call my-dir)

LOCAL_MODULE    := avutil 

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_SRC_FILES := ./ffmpeg/armv7-a/libavutil.a
else
    ifeq ($(TARGET_ARCH_ABI),armeabi)
	LOCAL_SRC_FILES := ./ffmpeg/armv5te/libavutil.a
    else
        ifeq ($(TARGET_ARCH_ABI),x86)
	    LOCAL_SRC_FILES := ./ffmpeg/i686/libavutil.a
        endif
    endif
endif

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)


LOCAL_MODULE    := avformat

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_SRC_FILES := ./ffmpeg/armv7-a/libavformat.a
else
    ifeq ($(TARGET_ARCH_ABI),armeabi)
	LOCAL_SRC_FILES := ./ffmpeg/armv5te/libavformat.a
    else
        ifeq ($(TARGET_ARCH_ABI),x86)
	    LOCAL_SRC_FILES := ./ffmpeg/i686/libavformat.a
        endif
    endif
endif

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)



LOCAL_MODULE    := avcodec 

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_SRC_FILES := ./ffmpeg/armv7-a/libavcodec.a
else
    ifeq ($(TARGET_ARCH_ABI),armeabi)
	LOCAL_SRC_FILES := ./ffmpeg/armv5te/libavcodec.a
    else
        ifeq ($(TARGET_ARCH_ABI),x86)
	    LOCAL_SRC_FILES := ./ffmpeg/i686/libavcodec.a
        endif
    endif
endif

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)


LOCAL_MODULE    := crypto

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_SRC_FILES := ./boringssl/lib/libcrypto_armeabi-v7a.a
else
    ifeq ($(TARGET_ARCH_ABI),armeabi)
	LOCAL_SRC_FILES := ./boringssl/lib/libcrypto_armeabi.a
    else
        ifeq ($(TARGET_ARCH_ABI),x86)
	    LOCAL_SRC_FILES := ./boringssl/lib/libcrypto_x86.a
        endif
    endif
endif

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)


ifeq ($(TARGET_ARCH_ABI),armeabi)
	LOCAL_ARM_MODE  := thumb
else
	LOCAL_ARM_MODE  := arm
endif
LOCAL_MODULE := sqlite
LOCAL_CFLAGS 	:= -w -std=c11 -Os -DNULL=0 -DSOCKLEN_T=socklen_t -DLOCALE_NOT_USED -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS 	+= -DANDROID_NDK -DDISABLE_IMPORTGL -fno-strict-aliasing -fprefetch-loop-arrays -DAVOID_TABLES -DANDROID_TILE_BASED_DECODE -DANDROID_ARMV6_IDCT -DHAVE_STRCHRNUL=0

LOCAL_SRC_FILES     := \
./sqlite/sqlite3.c

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false

LOCAL_MODULE 	:= morteza
LOCAL_CFLAGS 	:= -w -std=c11 -Os -DNULL=0 -DSOCKLEN_T=socklen_t -DLOCALE_NOT_USED -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS 	+= -Drestrict='' -D__EMX__ -DOPUS_BUILD -DFIXED_POINT -DUSE_ALLOCA -DHAVE_LRINT -DHAVE_LRINTF -fno-math-errno
LOCAL_CFLAGS 	+= -DANDROID_NDK -DDISABLE_IMPORTGL -fno-strict-aliasing -fprefetch-loop-arrays -DAVOID_TABLES -DANDROID_TILE_BASED_DECODE -DANDROID_ARMV6_IDCT -ffast-math -D__STDC_CONSTANT_MACROS
LOCAL_CPPFLAGS 	:= -DBSD=1 -ffast-math -Os -funroll-loops -std=c++11
LOCAL_LDLIBS 	:= -ljnigraphics -llog -lz -latomic -lOpenSLES -lEGL -lGLESv2
LOCAL_STATIC_LIBRARIES := sqlite avformat avcodec avutil


LOCAL_C_INCLUDES    := \
./jni/libyuv/include \
./jni/ffmpeg/include \
./jni/intro

#./jni/opus/include \
#./jni/opus/silk \
#./jni/opus/silk/fixed \
#./jni/opus/celt \
#./jni/opus/ \
#./jni/opus/opusfile \

#./jni/boringssl/include \
#./jni/emoji \

LOCAL_SRC_FILES     += \
./libyuv/source/compare_common.cc \
./libyuv/source/compare_gcc.cc \
./libyuv/source/compare_neon64.cc \
./libyuv/source/compare_win.cc \
./libyuv/source/compare.cc \
./libyuv/source/convert_argb.cc \
./libyuv/source/convert_from_argb.cc \
./libyuv/source/convert_from.cc \
./libyuv/source/convert_jpeg.cc \
./libyuv/source/convert_to_argb.cc \
./libyuv/source/convert_to_i420.cc \
./libyuv/source/convert.cc \
./libyuv/source/cpu_id.cc \
./libyuv/source/mjpeg_decoder.cc \
./libyuv/source/mjpeg_validate.cc \
./libyuv/source/planar_functions.cc \
./libyuv/source/rotate_any.cc \
./libyuv/source/rotate_argb.cc \
./libyuv/source/rotate_common.cc \
./libyuv/source/rotate_gcc.cc \
./libyuv/source/rotate_mips.cc \
./libyuv/source/rotate_neon64.cc \
./libyuv/source/rotate_win.cc \
./libyuv/source/rotate.cc \
./libyuv/source/row_any.cc \
./libyuv/source/row_common.cc \
./libyuv/source/row_gcc.cc \
./libyuv/source/row_mips.cc \
./libyuv/source/row_neon64.cc \
./libyuv/source/row_win.cc \
./libyuv/source/scale_any.cc \
./libyuv/source/scale_argb.cc \
./libyuv/source/scale_common.cc \
./libyuv/source/scale_gcc.cc \
./libyuv/source/scale_mips.cc \
./libyuv/source/scale_neon64.cc \
./libyuv/source/scale_win.cc \
./libyuv/source/scale.cc \
./libyuv/source/video_common.cc

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_CFLAGS += -DLIBYUV_NEON
    LOCAL_SRC_FILES += \
        ./libyuv/source/compare_neon.cc.neon    \
        ./libyuv/source/rotate_neon.cc.neon     \
        ./libyuv/source/row_neon.cc.neon        \
        ./libyuv/source/scale_neon.cc.neon
endif

LOCAL_SRC_FILES     += \
./jni.c \
./utils.c \
./image.c \
./video.c \
./intro/IntroRenderer.c \
./SqliteWrapper.cpp \
./NativeLoader.cpp \


include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/cpufeatures)