LOCAL_PATH := $(call my-dir)

# Ril

include $(CLEAR_VARS)

LOCAL_SRC_FILES := ril_shim.cpp

LOCAL_SHARED_LIBRARIES := libbinder

LOCAL_MODULE := libshim_ril

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
