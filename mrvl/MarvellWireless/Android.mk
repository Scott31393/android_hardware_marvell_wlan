LOCAL_PATH:= $(call my-dir)

ifneq ($(MRVL_WIRELESS_DAEMON_API),)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := marvell_wireless_daemon.c

LOCAL_SHARED_LIBRARIES := libc libcutils libutils libnetutils

LOCAL_MODULE := MarvellWirelessDaemon
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror

ifdef SD8787_NEED_CALIBRATE
LOCAL_CFLAGS += -DSD8787_NEED_CALIBRATE
endif

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= lib_marvell_wireless.c

LOCAL_SHARED_LIBRARIES := libc libcutils libutils

LOCAL_MODULE:= libMarvellWireless
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

endif
