LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := bad_dtls_test.c \
                   bio_ssl.c \
                   clienthellotest.c \
                   d1_both.c \
                   d1_clnt.c \
                   d1_lib.c \
                   d1_meth.c \
                   d1_pkt.c \
                   d1_srtp.c \
                   d1_srvr.c \
                   dtlstest.c \
                   fatalerrtest.c \
                   heartbeat_test.c \
                   kssl.c \
                   s23_clnt.c \
                   s23_lib.c \
                   s23_meth.c \
                   s23_pkt.c \
                   s23_srvr.c \
                   s2_clnt.c \
                   s2_enc.c \
                   s2_lib.c \
                   s2_meth.c \
                   s2_pkt.c \
                   s2_srvr.c \
                   s3_both.c \
                   s3_cbc.c \
                   s3_clnt.c \
                   s3_enc.c \
                   s3_lib.c \
                   s3_meth.c \
                   s3_pkt.c \
                   s3_srvr.c \
                   ssl_algs.c \
                   ssl_asn1.c \
                   ssl_cert.c \
                   ssl_ciph.c \
                   ssl_conf.c \
                   ssl_err.c \
                   ssl_err2.c \
                   ssl_lib.c \
                   ssl_rsa.c \
                   ssl_sess.c \
                   ssl_stat.c \
                   ssl_task.c \
                   ssl_txt.c \
                   ssl_utst.c \
                   sslv2conftest.c \
                   t1_clnt.c \
                   t1_enc.c \
                   t1_ext.c \
                   t1_lib.c \
                   t1_meth.c \
                   t1_reneg.c \
                   t1_srvr.c \
                   t1_trce.c \
                   tls_srp.c \



local_c_include := \
                    $(NDK_PATH) \
                    $(NDK_PATH)/openssl/openssl \
                    $(NDK_PATH)/openssl/internal \
                    $(NDK_PATH)/openssl/crypto/asn1 \
                    $(NDK_PATH)/openssl/crypto/evp \

include $(CLEAR_VARS)
include $(NDK_PATH)/android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_SHARED_LIBRARIES += libcrypto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libssl
include $(BUILD_SHARED_LIBRARY)

ifeq ($(WITH_HOST_DALVIK),true)
    include $(CLEAR_VARS)
    include $(NDK_PATH)/android-config.mk
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_SHARED_LIBRARIES += libcrypto
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libssl
    include $(BUILD_SHARED_LIBRARY)
endif

# ssltest
#include $(CLEAR_VARS)
#include $(NDK_PATH)/android-config.mk
#LOCAL_SRC_FILES:= ssltest.c
#LOCAL_C_INCLUDES += $(local_c_includes)
#LOCAL_SHARED_LIBRARIES := libssl libcrypto
#LOCAL_MODULE:= ssltest
#LOCAL_MODULE_TAGS := optional

#include $(BUILD_SHARED_LIBRARY)