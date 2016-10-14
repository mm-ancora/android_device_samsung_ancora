LOCAL_PATH := $(call my-dir)

# Camera and Sensor

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     gui/SensorManager.cpp \
     ui/GraphicBuffer.cpp \
     ui/GraphicBufferAllocator.cpp \
     ui/GraphicBufferMapper.cpp \
     media_shim.cpp \
     MemoryHeapPmem.cpp \
     MemoryBase.c \
     VectorImpl.cpp

#     SharedBuffer.cpp \


LOCAL_C_INCLUDES += external/safe-iop/include

LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libutils libsync libmedia

LOCAL_MODULE := libshim_native
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# Ril

include $(CLEAR_VARS)

LOCAL_SRC_FILES := ril_shim.cpp

LOCAL_SHARED_LIBRARIES := libbinder

LOCAL_MODULE := libshim_ril

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
