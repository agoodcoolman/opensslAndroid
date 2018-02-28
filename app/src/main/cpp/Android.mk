LOCAL_PATH := $(call my-dir)

subdirs := $(addprefix $(LOCAL_PATH)/,$(addsuffix /Android.mk, \
		openssl/crypto \
		openssl/ssl \
		openssl/apps \
	))

include $(subdirs)
