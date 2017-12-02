QCOM_MEDIA_ROOT := $(call my-dir)

LOCAL_BUILD_DASH ?= false

ifeq ($(TARGET_ENABLE_DASH),true)
  LOCAL_BUILD_DASH := true
endif

ifeq ($(TARGET_DISABLE_DASH),true)
  LOCAL_BUILD_DASH := false
endif

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS),true)
  LOCAL_BUILD_DASH := true
else
  LOCAL_BUILD_DASH := false
endif

ifeq ($(LOCAL_BUILD_DASH),true)
ifeq ($(TARGET_ENABLE_QC_MEDIAPLAYER),true)
include $(QCOM_MEDIA_ROOT)/jni/Android.mk
include $(QCOM_MEDIA_ROOT)/QCMediaPlayer/Android.mk
include $(QCOM_MEDIA_ROOT)/QCMediaPlayer/native/Android.mk
endif
include $(QCOM_MEDIA_ROOT)/dashplayer/Android.mk
endif
