LOCAL_PATH := $(call my-dir)

#to the Android.mk file and it should work.  As explained in the ndk doc, it is because the ndk performs a debug checking even for avoiding runtime linking error and for some motivations it doesn't find the correct references in a pre-built library. Hope it coulds help.
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

subdirs := $(addprefix $(LOCAL_PATH)/,$(addsuffix /Android.mk, \
		openssl/ssl \
		openssl/crypto \
		openssl/apps \
	))

include $(subdirs)
