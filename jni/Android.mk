LOCAL_PATH := $(call my-dir)

#OGG_DIR        := Passed as an argument to ndk-build
#VORBIS_DIR     := Passed as an argument to ndk-build
OGG_INCLUDES    := $(LOCAL_PATH)/../$(OGG_DIR)/include
VORBIS_INCLUDES := $(LOCAL_PATH)/../$(VORBIS_DIR)/include \
	                 $(LOCAL_PATH)/../$(VORBIS_DIR)/lib

######################################################################
# OGG
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_MODULE   := libogg
LOCAL_CFLAGS   := -ffast-math -fsigned-char -O2 -fPIC -DPIC \
                  -DBYTE_ORDER=LITTLE_ENDIAN -D_ARM_ASSEM_

LOCAL_C_INCLUDES := $(OGG_INCLUDES)

LOCAL_SRC_FILES := \
	$(addprefix ../, $(shell cd $(LOCAL_PATH)/../; \
                           find $(OGG_DIR)/src -type f -name '*.c'))

include $(BUILD_STATIC_LIBRARY)

######################################################################
# VORBIS
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_MODULE   := libvorbis
LOCAL_CFLAGS   := -ffast-math -fsigned-char -O2 -fPIC -DPIC \
                  -DBYTE_ORDER=LITTLE_ENDIAN -D_ARM_ASSEM_

LOCAL_C_INCLUDES := $(OGG_INCLUDES) $(VORBIS_INCLUDES)

LOCAL_SRC_FILES := \
	$(addprefix ../, $(shell cd $(LOCAL_PATH)/../; \
                           find $(VORBIS_DIR)/lib -type f -name '*.c' | \
                           grep -v psytune.c))

include $(BUILD_STATIC_LIBRARY)

######################################################################
